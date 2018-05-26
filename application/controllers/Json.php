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

	public function report($id='', $y='')
	{
		$year 	= empty($y) ? date('Y') : $y;
		$id 	= empty($id) ? '1' : $id;
		if ($y != '' AND $id != '') {
			$query 	= $this->Crud->query("SELECT MONTH(`date`) as `month`, `date` FROM `reportingjob` WHERE year(`date`)='{$year}' AND `id_device`='{$id}' GROUP BY month(`date`) ORDER BY month(`date`) ASC");
		} elseif ($id != '') {
			$query 	= $this->Crud->query("SELECT YEAR(`date`) as `year` FROM `reportingjob` WHERE `id_device`='{$id}' GROUP BY year(`date`) ORDER BY year(`date`) ASC");
		} else {
			$query 	= $this->Crud->query("SELECT YEAR(`date`) as `year` FROM `reportingjob` GROUP BY year(`date`) ORDER BY year(`date`) ASC");
		}

		if(count($query) > 0 ){
		  $response = array();
		  $response["data"] = array();
		  foreach ($query as $x) {
		  	if ($y != '') {
		  		$h['month'] = $x["month"];
		  		$h['tmonth'] = date('F', strtotime($x["date"]));
		  	} else {
		  		$h['year'] = $x["year"];
		  	}
		    
		    array_push($response["data"], $h);
		  }
		}else {
		  $response["data"]="empty";  
		}
		echo json_encode($response);
	}


	public function ureport()
	{
		$column = $this->input->post('column');
		$value = $this->input->post('value');
		$id = $this->input->post('id');
		$this->Crud->update('reportingjob', array('IDReport' => $id),array($column => $value));
	}

	public function delrep()
	{
		$id = $this->input->post('del');
		$this->Crud->delete('reportingjob', array('IDReport' => $id));
		$this->session->set_flashdata('msg', 'Field has been delete!');
	}
	
	public function deluser()
	{
		$id = $this->input->post('del');
		$this->Crud->delete('user_report', array('IDUser' => $id));
		$this->session->set_flashdata('msg', '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Deleted!</strong> Field has been delete!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
	}

	public function edit_user($id ='', $action ='') {
		$sql = $this->Crud->search('user_report', array('IDUser' => $id))->result_array();
		if(count($sql) > 0 ){
		  $response = array();
		  $response["data"] = array();
		  foreach ($sql as $x) {
		    $h['id'] = $x["IDUser"];
		    $h['name'] = $x["username"];
		    $h['description'] = $x["description"];
		    $h['type'] = $x["type"];
		    array_push($response["data"], $h);
		  }
		}else {
		  $response["data"]="empty";  
		}
		echo json_encode($response);
	}
	public function update_user()
	{
		$id = $this->input->post('id');
		$name = $this->input->post('name');
		$description = $this->input->post('description');
		$level = $this->input->post('level');
		$this->Crud->update('user_report', array('IDUser' => $id),array(
			'username' => $name,
			'description' => $description,
			'type' => $level
		));
		$this->session->set_flashdata('msg', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Updated!</strong> Field has been updated!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
	}

	public function reset()
	{
		$id = $this->input->post('id');
		$sql = $this->Crud->search('user_report', array('IDUser' => $id))->result_array();
		if(count($sql) > 0 ){
			$pass = $sql[0]['username'];
			$this->Crud->update('user_report', array('IDUser' => $id),array(
			'password' => PASSWORD_HASH($pass, PASSWORD_DEFAULT)
			));
		}
		$this->session->set_flashdata('msg', '<div class="alert alert-info alert-dismissible fade show" role="alert"><strong>Success!</strong> Password <b>' . $sql[0]['username'] . '</b> has reset default (username)!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
	}
}
