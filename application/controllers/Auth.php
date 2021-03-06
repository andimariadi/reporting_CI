<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

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
		echo '<div class="alert alert-danger alert-dismissible fade show" role="alert" style="position: fixed;bottom: 20%;left: 15%; width: 75%;z-index: 99999;">
          <strong>Info!</strong> This site is BETA TESTER.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>';
	}

	public function index ($page = 'Login') {
		$data['title'] = $page;
		$this->load->view('templates/head', $data);
		$this->load->view('login/login');
	}

	public function action()
	{
		$username = $this->input->post('user');
		$password = $this->input->post('pass');
		$where = array('username' => $username);

		$data = $this->crud->search('user_report', $where)->row_array();
		if (password_verify($password, $data['password'])) {
			$session_data = array('username' => $data['username'], 'level' => $data['type']);
			$this->session->set_userdata($session_data);
			redirect(base_url('dash'));
		} else {
			$this->session->set_flashdata('msg', 'Username or password wrong!');
			redirect(base_url('Auth'));
		}
		
	}

	public function logout()
	{
		$this->session->sess_destroy();
		$cookies = explode(';', $_SERVER['HTTP_COOKIE']);
	    foreach($cookies as $cookie) {
	        $parts = explode('=', $cookie);
	        $name = trim($parts[0]);
	        delete_cookie($name);
	        delete_cookie($name);
	    }
		redirect(base_url());
	}
}
