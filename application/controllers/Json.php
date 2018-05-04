<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Json extends CI_Controller {

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
		$this->load->model('Crud');
		$username = $this->session->userdata('username');
		$level = $this->session->userdata('level');
		if(empty($username)){
			redirect(base_url("Auth"));
		}
		if($level == 'teknisi'){
			redirect(base_url("report"));
		}
	}

	public function index ($page = 'Homepage') {
		$data['title'] = $page;
		$this->load->view('templates/head', $data);
		$this->load->view('pages/home');
	}

	public function delenum()
	{
		$id = $this->input->post('del');
		$this->Crud->delete('enum', array('IdEnum' => $id));
		$this->session->set_flashdata('msg', 'Field has been delete!');
	}

	public function uenum()
	{
		$column = $this->input->post('column');
		$value = $this->input->post('value');
		$id = $this->input->post('id');
		$this->Crud->update('enum', array('IdEnum' => $id),array($column => $value));
	}

	public function updateunit()
	{
		$column = $this->input->post('column');
		$value = $this->input->post('value');
		$id = $this->input->post('id');
		$this->Crud->update('unit_detail', array('cn_unit' => $id),array($column => $value));
	}

	public function delunit()
	{
		$id = $this->input->post('del');
		$this->Crud->delete('unit_detail', array('cn_unit' => $id));
		$this->session->set_flashdata('msg', 'Field has been delete!');
	}
	
}
