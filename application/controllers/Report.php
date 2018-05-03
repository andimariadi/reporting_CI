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
		$cookie = array(
			'dev' => $this->input->cookie('dev'),
			'bd' => $this->input->cookie('bd'),
			'rfu' => $this->input->cookie('rfu'),
			'pic' => $this->input->cookie('pic'),
			'device' => $this->input->cookie('device'),
			'loc' => $this->input->cookie('loc'),
			'swait' => $this->input->cookie('swait'),
			'ewait' => $this->input->cookie('ewait'),
			'sact' => $this->input->cookie('sact'),
			'eact' => $this->input->cookie('eact'),
			'bd_type' => $this->input->cookie('bd_type'),
			'problem' => $this->input->cookie('problem'),
			'analysis' => $this->input->cookie('analysis'),
			'case' => $this->input->cookie('case'),
			'activity' => $this->input->cookie('activity'),
			'category' => $this->input->cookie('category'),
			'sn_mojo' => $this->input->cookie('sn_mojo'),
			'sn_wb' => $this->input->cookie('sn_wb'),
			'sn_gps' => $this->input->cookie('sn_gps'),
			'antenna' => $this->input->cookie('antenna'),
			'relay' => $this->input->cookie('relay'),
			'locked' => $this->input->cookie('locked'),
			'remark' => $this->input->cookie('remark'),
			'status' => $this->input->cookie('status'),
		);
		$this->load->view('report/report', $cookie);
	}

	public function cookies($name, $value)
	{
		$hour = time() + (86400 * 30);
		
	}
}
