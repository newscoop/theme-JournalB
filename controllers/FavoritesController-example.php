<?php
/**
 * @author Oleg Lavrovsky <oleg@appswithlove.com>
 *
 *  Zend Framework controller for Journal-B.ch web services in Newscoop
 
Copyright (c) 2012 Apps with love

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 */
require_once('disqus/disqusapi.php');

use Newscoop\Entity\Article;

class FavoritesController extends Zend_Controller_Action
{
	// Account details
	private $shortname = '';  
	private $PUBLIC_KEY = ""; // Disqus Public key
	private $SECRET_KEY = ""; // Disqus Secret Key
	private $homepage = "http://journal-b.ch"; // Homepage URL
	private $redirect = "http://journal-b.ch/favorites"; // Favorites Page URL

	/** @var Newscoop\Entity\Repository\ArticleRepository */
    private $articleRepository;
    
    /** @var Zend_Session_Namespace */
    private $session;
    
    // Location of data store
    private $basefs;
        
	public function init()
    {
        $this->articleRepository = $this->_helper->entity->getRepository('Newscoop\Entity\Article');
        
        $this->session = new Zend_Session_Namespace('JournalB');
        if (!isset($this->session->faves)) { $this->session->faves = array(); }
        
        $this->basefs = $_SERVER['DOCUMENT_ROOT'] . "/services/_users/";
        
        return $this;
    }
	
	/** @var int */
    private $userid;
	/** @var string */
    private $username;
	/** @var string */
    private $token;
	/** @var int */
    private $refresh;
    /** @var DisqusAPI */
    private $disqusapi;
	
	// If we are not logged in, redirect us to login
	private function ensureDisqusLogin($gotologin = true) {
	
		if (!empty($this->userid)) { return true; }
		
		$jsdisqus = $this->getRequest()->getCookie('jsdisqus');
		$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
		if (!isset($jbdisqus)) {
			if (isset($jsdisqus) && strpos($jsdisqus, ';') > 1) {
				$jsdisqus = explode(';', $jsdisqus);
				$username = explode(' ', $jsdisqus[1]);
				$jbdisqus = array(	
					'userid'=>$jsdisqus[0],
					'username'=>$username[0]
				);
			} elseif (!$this->getDisqusLogin($this->getRequest())) {
				if ($gotologin) {
					$this->_redirect('https://disqus.com/api/oauth/2.0/authorize/?' .
						'client_id=' . $this->PUBLIC_KEY . '&' .
						//'scope=' . 'read' . '&' .
						'response_type=' . 'code' . '&' .
						'redirect_uri=' . $this->redirect
					);
				} else {
					return false;
				}
			} else {
				// Get cookie again now that we've processed the login
				$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
			}
		}
				
		$this->userid = 	$jbdisqus['userid'];
		$this->username = 	$jbdisqus['username'];
		$this->token = 		$jbdisqus['token'];
		$this->refresh = 	$jbdisqus['refresh'];
			
		if (!isset($this->userid)) {
			// Could not obtain user ID, probably authentication declined
			return $this->logoutAction();
		}
		if (isset($this->token)) {
			$this->disqusapi = new DisqusAPI($this->SECRET_KEY);
		}	
		return true;
	}
	
	// Process the token code for request access
	private function getDisqusLogin($request) {
	
		$CODE = $request->getParam('code');
		if (!isset($CODE)) { return false; }
				
		// Request the access token
		extract($_POST);
		
		$authorize = "authorization_code";
		$url = 'https://disqus.com/api/oauth/2.0/access_token/?';
		$fields = array(
			'grant_type'=>urlencode($authorize),
			'client_id'=>urlencode($this->PUBLIC_KEY),
			'client_secret'=>urlencode($this->SECRET_KEY),
			'redirect_uri'=>urlencode($this->redirect),
			'code'=>urlencode($CODE)
		);
		$fields_string = '';
		
		//url-ify the data for the POST
		foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		rtrim($fields_string, "&");
		
		//open connection
		$ch = curl_init();
		
		//set the url, number of POST vars, POST data
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST,count($fields));
		curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
		
		//execute post
		$resultdata = curl_exec($ch);
		
		//close connection
		curl_close($ch);
		
		//get the token if available
		if (strpos($resultdata, "access_token") === FALSE) {
			die('Error: could not log into Disqus.');
			
		} else {
			$tokdata = json_decode($resultdata);
			if ($tokdata === NULL) die('Error parsing json');
			
			$expires = time() + 1209600; // login for two weeks
			setcookie('jbdisqus[userid]', 	$tokdata->user_id, $expires);
			setcookie('jbdisqus[username]',	$tokdata->username, $expires);
			setcookie('jbdisqus[token]', 	$tokdata->access_token, $expires);
			setcookie('jbdisqus[refresh]', 	$tokdata->refresh_token, $expires);
			
			// go to home page after logging in
			$this->_redirect('/');
		}

	}
	
	/**
     * Find article by number
     *
     * @param int $num
     * @return Newscoop\Entity\Article
     */
	private function getArticleById($num) {
		return $this->articleRepository->findOneBy(array(
	        'number' => $num,
	    ));
	}
	
	/**
     * Get the article ID from its URL
     *
     * @param string $url
     * @return int
     */
	private function getArticleIdent($url) {
		if (preg_match('/\/de\/[0-9a-z]*\/[0-9a-z]*\/([0-9]+)\//', $url, $matches)) {
			if (isset($matches[1]) && is_numeric($matches[1])) {
				return intval($matches[1]);
			}
		}
		return null;
	}
	
	private function fscache_isset($uri) {
		return file_exists($this->basefs . $uri);		
	}
	private function fscache_get($uri) {
		return unserialize(file_get_contents($this->basefs . $uri));		
	}
	private function fscache_set($uri, $val) {
		file_put_contents($this->basefs . $uri, serialize($val));
	}
	private function fscache_time($uri) {
		return filemtime($this->basefs . $uri);
	}
	
	/* User favorites */
	public function indexAction() {
			
		if (!$this->ensureDisqusLogin(false)) {
			$this->view->nologin = true; 
			return; 
		}
			
		$articles = array();
		
		if (count($this->session->faves) > 0) {
			// Get favorites cached in session
			foreach ($this->session->faves as $id => $f) {
				$article = $this->getArticleById($id);
				if ($article !== null) { $articles[] = $article; }
			}
		
		} elseif ($this->fscache_isset('jb_faves_' . $this->userid)) {
			// Get favorites cached in server
			$faves = $this->fscache_get('jb_faves_' . $this->userid);
			foreach ($faves as $id => $f) {
				$article = $this->getArticleById($id);
				if ($article !== null) { $articles[] = $article; }
			}
			// save to session
			$this->session->faves = $faves;
		
		} elseif (isset($this->disqusapi)) { 
			// Get favorites from user's Disqus activities
			$activities =
				$this->disqusapi->users->listActivity(array(
					'user'=>$this->userid, 'include'=>'user', 'limit'=>100
				));
			
			$faves = array();
			
			foreach ($activities as $k => $v) {
				if (strpos($v->type, "like") !== FALSE && 
					//$v->object->vote == 1 && 
					$v->object->forum->id == $this->shortname) {

					// get article number from Disqus link
					$url = $v->object->thread->link;
					$id = $this->getArticleIdent($url);
					if ($id != null) {
						// add article if we can find it in Newscoop
						$article = $this->getArticleById($id);
						if ($article !== null) {
							$articles[] = $article;
							$faves[$id] = $url;
						}
					}
				}
			}
			
			// save to session
			$this->session->faves = $faves;
			
			// save to cache
			$this->fscache_set('jb_faves_' . $this->userid, $faves);			
		}
		
		/* -- Test --
		//$articles = array();
		$articles[] = $this->getArticleById(194);
		$articles[] = $this->getArticleById(208);
		$articles[] = $this->getArticleById(203);
		*/
		//die(count($articles)." articles");
		
		// Convert Article entity list to MetaArticles
		$this->view->articles = array_reverse(array_map(function($article) {
            return new \MetaArticle($article->getLanguageId(), $article->getNumber());
        }, $articles));
		
	}
		
	// Get a shortlist of our favorites if we're logged in
	public function myfavesAction() {
		
		// make sure the script is not being rendered
		$this->_helper->layout()->setLayout('empty');
		$this->_helper->viewRenderer->setNoRender(true);
		
		if (!$this->ensureDisqusLogin(false)) { die('NOLOGIN'); }
		
		$faves = array();
		
		// reload our session or cache if needed
		if (count($this->session->faves) > 0) {
			$faves = $this->session->faves;
		} elseif ($this->fscache_isset('jb_faves_' . $this->userid)) {
			$faves = $this->fscache_get('jb_faves_' . $this->userid);
		} else {	
			$this->indexAction();
			$faves = $this->session->faves;
		}
				
		die (json_encode(array(
			'username'=>$this->username,
			'favorites'=>$faves
		)));
			
	}
	
	public function mobileAction()
	{				
		$faves = array();
		
		// reload our session or cache if needed
		if (count($this->session->faves) > 0) {
			$faves = $this->session->faves;
		} elseif ($this->fscache_isset('jb_faves_' . $this->userid)) {
			$faves = $this->fscache_get('jb_faves_' . $this->userid);
		} else {	
			$this->indexAction();
			$faves = $this->session->faves;
		}
				
		foreach ($faves as $id => $url)
		{
			$article = $this->getArticleById($id);
			$faves[$id] = array("url" => $url, "time" => strtotime($article->getPublishDate()));
		}
		$this->view->faves = $faves;
		
		if ($this->fscache_isset('jb_faves_' . $this->userid))
		{
			$this->view->favorites_time = $this->fscache_time('jb_faves_' . $this->userid);
		}
		else
		{
			$this->view->favorites_time = 0;
		}
	}
	
	// Returns key of array hit if there is a subtring match
	private function array_part_search($needle = null, $haystack_array = null, $skip = 0) {
		if ($needle == null || $haystack_array == null) return false;
		foreach ($haystack_array as $key => $eval) {
			if ($skip != 0) $eval = substr($eval, $skip);
			if (stristr($eval, $needle) !== false) return $key;
		}
		return false;
	}
	
	// Ensures the browser does not cache
	private function nocacheResponse() {
		$this->getResponse()
			->setHeader('Pragma', 'no-cache', true)
			->setHeader('Cache-Control', 'no-cache');
	}
			
	/* Star a page */
	public function voteAction() {
	
		$request = $this->getRequest();
		
		// make sure the script is not being rendered
		$this->_helper->layout()->setLayout('empty');
		$this->_helper->viewRenderer->setNoRender(true);
		
		$vote = $request->getParam('vote') or die('vote required');
		$title = $request->getParam('title') or die('title required');
		$page = $request->getParam('url') or die('url required');
			
		$title = urldecode($title);
		$page = urldecode($page);
		$vote = intval($vote) or die('Invalid vote');
		if ($vote < 0) { $vote = 0; } // don't dislike pages
		
		if (strpos($page, $this->homepage) === FALSE) { die('Invalid request ' . $page); }
		
		$page = str_replace($this->homepage, "", $page);
		$ident = $this->getArticleIdent($page);
		
		echo($vote . ' / ' . $title . ' / ' . $ident);
				
		$this->ensureDisqusLogin();
		
		$this->nocacheResponse();
		
		// Find this thread
		if (isset($this->disqusapi)) {
			$threads =
				$this->disqusapi->forums->listThreads(array(
					'forum'=>$this->shortname, 'thread:ident'=>$ident
				));
		
			$id = -1;
			if (count($threads) == 0) {
				// Try creating
				$thread = $this->disqusapi->threads->create(array(
						'forum'=>$this->shortname, 
						'title'=>$title, 
						'url'=>$this->homepage . $page,
						'identifier'=>$ident
					));
				$id = $thread->id;
				echo(' / created thread: ' . $id);
			
			} else {
				// Take existing match
				$id = $threads[0]->id;
				echo(' / found thread: ' . $id);
			}
		
			if ($id > 0) {
				// Now vote for it
				$voteresult = $this->disqusapi->threads->vote(array(
					'vote'=>$vote, 'thread'=>$id, 'forum'=>$this->shortname
				));
			} else {
				error_log("Could not vote on thread: " . $page);
				die(' / ERROR');
			}
		}
			
		// Update cache
		$faves = array();
		if ($this->fscache_isset('jb_faves_' . $this->userid)) {
			$faves = $this->fscache_get('jb_faves_' . $this->userid);
			if ($vote > 0) {
				if (!isset($faves[$ident])) {
					$faves[$ident] = $page;
					echo (' / added');
				}
			} else {
				unset($faves[$ident]);
				echo (' / removed');
			}
		}
		
		// Save cache and session
		$this->fscache_set('jb_faves_' . $this->userid, $faves);
		$this->session->faves = $faves;
		
		die(' / OK / cached: ' . count($faves));
	}
	
	// Sign into the service
	public function loginAction() {
		$this->ensureDisqusLogin();
		$this->_redirect('/');
	}
	
	// Sign out of our service
	public function logoutAction() {
		setcookie('jbdisqus[userid]', "", 1, "/");
		setcookie('jbdisqus[username]', "", 1, "/");
		setcookie('jbdisqus[token]', "", 1, "/");
		setcookie('jbdisqus[refresh]', "", 1, "/");
		setcookie('jbdisqus', "", 1, "/");
		setcookie('jsdisqus', "", 1, "/");
		unset($this->session->faves);
		\Zend_Session::ForgetMe();
		\Zend_Session::destroy(true);		
		$this->_redirect('/');
	}
	
}

?>
