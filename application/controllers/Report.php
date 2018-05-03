<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct() {
		parent::__construct();	
		$this->load->model('crud');
		$this->load->helper('cookie');
	}

	public function index($page = 'Reporting')
	{
		$data = array('title' => $page);
		$this->load->view('templates/head', $data);
		$this->load->view('report/report', $data);
	}

	public function action($name = 'dev', $value = '1')
	{
		$hour = time() + (86400 * 30);
		$value = $this->input->post($value);
		$cookie = array(
          'name'   => $name,
          'value'  => $value,
          'expire' => $hour,
          'domain' => 'localhost',
          'path'   => 'index.php/report',
          'prefix' => 'report_',
          );
    	$this->input->set_cookie($cookie);
    	redirect(base_url('index.php/report/'));
	}
}
