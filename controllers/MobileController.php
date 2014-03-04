<?php

require_once($GLOBALS['g_campsiteDir'].'/classes/Issue.php');

/*
 *  Custom controller for Journal-B.ch mobile services
 *  - Note: copy into newscoop/application/controllers
 */
class MobileController extends Zend_Controller_Action
{
	/* Latest N articles */
	public function indexAction()
	{
		$this->_forward('mobile', "favorites");
	}
	
	/* List of web resources */
	public function resourcesAction()
	{
		// Logic in template
	}
	
	/* Only newsrows for a specific page */
	public function newsPageAction()
	{
		// Logic in template
	}
	
	/* Header bar for mobile web/native app */
	public function controlbarAction() {
		// Logic in template
	}
	
	/* Redirect static urls to current issue */
	public function alltagAction()
	{
		$this->redirect('alltag');
	}
	
	public function politikAction()
	{
		$this->redirect('politik');
	}
	
	public function kulturAction()
	{
		$this->redirect('kultur');
	}
	
	/* i.e /mobile/alltag redirects to /de/oct2012/alltag */ 
	protected function redirect($section)
	{
		$issue = Issue::getCurrentIssue(1);
		header("Location: /de/".$issue->getUrlName()."/".$section,true,301);
		exit();
	}
	
	public function communityAction()
	{
		// Logic in template
	}
		
}

?>