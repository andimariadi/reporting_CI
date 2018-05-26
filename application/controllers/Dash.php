<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dash extends CI_Controller {

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
		$username 	= $this->session->userdata('username');
		$level 		= $this->session->userdata('level');
		if(empty($username)){
			redirect(base_url("Auth"));
		}
		if($level == 'teknisi'){
			redirect(base_url("report"));
		}

		$page 		= 'Dashboard';
		$this->load->view('templates/head', array('title' => $page));


		//for homepage
		$session = array('username' => $username, 'level' => $level);
		$this->load->view('templates/sidebar', $session);
		echo '<div class="alert alert-danger alert-dismissible fade show" role="alert" style="position: fixed;bottom: 20%;left: 15%; width: 75%;z-index: 99999;">
          <strong>Info!</strong> This site is BETA TESTER.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>';
	}

	public function index()
	{
		$this->load->helper('Penghitungan_helper');
		if ((date('H:i:s') >= '07:00:00') AND (date('H:i:s') <= '18:00:00')) {
			$shift = 1;
			$last_biling = date('Y-m-d');
		} else {
			$shift = 2;
			$last_biling = date('Y-m-d', strtotime('-1 days'));
		}

		###########################################################################################
		###################################### FOR ALL ############################################
		###########################################################################################
		//count all
		$count_all = $this->Crud->view_select('reportingjob', array('count(id_device) as totaly'))->result_array();
		//count monthly all
		$count_problem = $this->Crud->search_select('reportingjob', array('count(id_device) as totaly'), array(
			'MONTH(date)' => date('m'),
			'YEAR(date)' => date('Y')
		))->result_array();
		$total_unit = $this->Crud->search_select('unit_detail', array('COUNT(cn_unit) as total'), array(
			'status' => '24'
		))->result_array();
		//unit population
		$unit_population = $this->Crud->query("SELECT `IDEnum`,`name`, count(`IDEnum`) as `count` FROM `enum` LEFT JOIN `unit_detail` ON `unit_detail`.`kode_unit` = `enum`.`IDEnum` WHERE `type` = 'unit' GROUP BY `enum`.`IDEnum`");
		$unit_population_installed = $this->Crud->query("SELECT `name` as `type`, COUNT(`unit_detail`.`kode_unit`) as `count` FROM `unit_detail` LEFT JOIN `enum` ON `unit_detail`.`kode_unit` = `enum`.`IdEnum` WHERE `status` = '24' OR `status` = '160' GROUP BY `kode_unit`");
		//weekly problem



		###########################################################################################
		################################## FOR JIGSAW  ############################################
		###########################################################################################
		//count monthly problem jigsaw
		$device = 1;
		$count_problem_jigsaw = $this->Crud->search_select('reportingjob', array('count(id_device) as totaly'), array(
			'id_device' => $device,
			'MONTH(date)' => date('m'),
			'YEAR(date)' => date('Y')
		))->result_array();
		$total_unit_jigsaw = $this->Crud->search_select('unit_detail', array('COUNT(cn_unit) as total'), array(
			'id_device' => $device,
			'status' => '24'
		))->result_array();
		//count_stastistik
		$all_stastistik_jigsaw = $this->Crud->query("SELECT `name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem` = `enum`.`IdEnum`  WHERE `id_device`='{$device}' GROUP BY `problem` ORDER BY `count` DESC LIMIT 5");
		$count_stastistik_jigsaw = $this->Crud->query("SELECT SUM(report.`problem`) as `count` FROM (SELECT COUNT(rj.problem) as `problem`, rj.id_device FROM reportingjob rj WHERE rj.id_device = '{$device}' GROUP BY rj.problem LIMIT 5) as `report` WHERE `report`.`id_device`='{$device}'");
		//relay
		$relay = $this->Crud->search_select_group('unit_detail', array('relay', 'count(relay) as count'), array(
			'status' => 24,
			'id_device' => '1'
		), array('relay'))->result_array();
		//locked
		$locked = $this->Crud->search_select_group('unit_detail', array('locked', 'count(locked) as count'), array(
			'status' => 24,
			'id_device' => '1'
		), array('locked'))->result_array();
		//data monthly problem jigsaw
		$data_monthly_jigsaw = $this->Crud->query("SELECT `enum`.`name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `enum`.`IDEnum` = `reportingjob`.`problem` WHERE MONTH(`date`) = '" . date('m') ."' AND YEAR(`date`)='" . date('Y') ."' AND `id_device`='{$device}' GROUP BY `problem`");
		//data weekly problem
		$weekly_problem_jigsaw = $this->Crud->query("SELECT `enum`.`name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `enum`.`IDEnum` = `reportingjob`.`problem` WHERE `id_device`='{$device}' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' GROUP BY `problem` ORDER BY `count` DESC");
		$last_jigsaw = $this->Crud->query("SELECT `date`,`shift`,`id_device`,`id_unit`,`start_action`,`end_action`,`enum`.`name` as `problem`,`act`.`name` as `activity`,`pic`,`name_device` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `device_report` ON `reportingjob`.`id_device` = `device_report`.`id` WHERE `id_device` = '{$device}' AND `date`='" . $last_biling . "' AND `shift` = '{$shift}' ORDER BY `reportingjob`.`IDReport` ASC");
		


		###########################################################################################
		################################## FOR NETWORK ############################################
		###########################################################################################
		//count monthly problem network
		$device = 2;
		$count_problem_network = $this->Crud->search_select('reportingjob', array('count(id_device) as totaly'), array(
			'id_device' => $device,
			'MONTH(date)' => date('m'),
			'YEAR(date)' => date('Y')
		))->result_array();
		$total_unit_network = $this->Crud->search_select('unit_detail', array('COUNT(cn_unit) as total'), array(
			'id_device' => $device,
			'status' => '24'
		))->result_array();
		$all_stastistik_network = $this->Crud->query("SELECT `name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem` = `enum`.`IdEnum`  WHERE `id_device`='{$device}' GROUP BY `problem` ORDER BY `count` DESC LIMIT 5");
		$count_stastistik_network = $this->Crud->query("SELECT SUM(report.`problem`) as `count` FROM (SELECT COUNT(rj.problem) as `problem`, rj.id_device FROM reportingjob rj WHERE rj.id_device = '{$device}' GROUP BY rj.problem LIMIT 5) as `report` WHERE `report`.`id_device`='{$device}'");
		//data monthly problem jigsaw
		$data_monthly_network = $this->Crud->query("SELECT `enum`.`name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `enum`.`IDEnum` = `reportingjob`.`problem` WHERE MONTH(`date`) = '" . date('m') ."' AND YEAR(`date`)='" . date('Y') ."' AND `id_device`='{$device}' GROUP BY `problem`");
		//data weekly problem
		$weekly_problem_network = $this->Crud->query("SELECT `enum`.`name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `enum`.`IDEnum` = `reportingjob`.`problem` WHERE `id_device`='{$device}' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' GROUP BY `problem` ORDER BY `count` DESC");
		$last_network = $this->Crud->query("SELECT `date`,`shift`,`id_device`,`id_unit`,`start_action`,`end_action`,`enum`.`name` as `problem`,`act`.`name` as `activity`,`pic`,`name_device` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `device_report` ON `reportingjob`.`id_device` = `device_report`.`id` WHERE `id_device` = '{$device}' AND `date`='" . $last_biling . "' AND `shift` = '{$shift}' ORDER BY `reportingjob`.`IDReport` ASC");
		


		$data = array(
			'no' => 0,
			'count_jigsaw_monthly' => $count_problem_jigsaw[0]['totaly'],
			'count_network_monthly' => $count_problem_network[0]['totaly'],
			'percent_jigsaw_monthly' => get_percent($count_problem_jigsaw[0]['totaly'], $total_unit_jigsaw[0]['total']),
			'percent_network_monthly' => get_percent($count_problem_network[0]['totaly'], $total_unit_network[0]['total']),
			'percent_average_monthly' => get_percent($count_problem[0]['totaly'], $total_unit[0]['total']),
			'all_problem' => $count_all[0]['totaly'],
			'relay' => $relay,
			'locked' => $locked,
			'statistik_problem_jigsaw' => $all_stastistik_jigsaw,
			'count_stastistik_jigsaw' => $count_stastistik_jigsaw[0]['count'],
			'statistik_problem_network' => $all_stastistik_network,
			'count_stastistik_network' => $count_stastistik_network[0]['count'],
			'data_monthly_jigsaw' => $data_monthly_jigsaw,
			'data_monthly_network' => $data_monthly_network,
			'unit_population' => $unit_population,
			'unit_population_installed' => $unit_population_installed,
			'weekly_problem_jigsaw' => $weekly_problem_jigsaw,
			'weekly_problem_network' => $weekly_problem_network,
			'last_jigsaw' => $last_jigsaw,
			'last_network' => $last_network,
		);
		$this->load->view('pages/home', $data);
	}

	public function save($type = '')
	{
		$submit = $this->input->post('submit');
		if ($type == 'cases') {
			$type = 'case';
		}
		$type = $type;
		$iddevice = $this->input->post('iddevice');
		$value = $this->input->post('namesave');
		$this->Crud->insert('enum', array(
				'name' => $value,
				'type' => $type,
				'IdDevice' => $iddevice
		));
		if ($type == 'case') {
			$type = 'cases';
		}
		$this->session->set_flashdata('msg', 'Field saved!');
		redirect(base_url('dash/' . $type));
	}

	public function activity() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/activity', $data);
	}

	public function analysis() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/analysis', $data);
	}

	public function category() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/category', $data);
	}

	public function cases() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/case', $data);
	}

	public function problem() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/problem', $data);
	}

	public function enum() {
		$device = $this->Crud->view('device_report');
		$data = array(
			'device' => $device,

		);
		$this->load->view('pages/enum', $data);
	}

	public function save_enum()
	{
		$submit = $this->input->post('submit');
		$type = $this->input->post('type');
		$iddevice = $this->input->post('iddevice');
		$value = $this->input->post('namesave');
		$this->Crud->insert('enum', array(
				'name' => $value,
				'type' => $type,
				'IdDevice' => $iddevice
		));
		$this->session->set_flashdata('msg', 'Field saved!');
		redirect(base_url('dash/enum'));
	}

	public function jigsaw_units() {
		$unit = $this->Crud->search('enum', array(
			'type' => 'unit',
			'IdDevice' => '1'
		))->result_array();
		$antenna = $this->Crud->search('enum', array('type' => 'antenna', 'IdDevice' => '1'))->result_array();
		$status_unit = $this->Crud->search('enum', array('type' => 'status', 'IdDevice' => '1'))->result_array();
		$type_unit = $this->Crud->search('enum', array('type' => 'type_unit', 'IdDevice' => '1'))->result_array();
		$data = array(
			'unit' => $unit,
			'antenna' => $antenna,
			'status_unit' => $status_unit,
			'type_unit' => $type_unit

		);
		$this->load->view('pages/units_jigsaw', $data);
	}

	public function network_units() {
		$unit = $this->Crud->search('enum', array(
			'type' => 'unit',
			'IdDevice' => '2'
		))->result_array();
		$antenna = $this->Crud->search('enum', array('type' => 'antenna', 'IdDevice' => '2'))->result_array();
		$status_unit = $this->Crud->search('enum', array('type' => 'status', 'IdDevice' => '2'))->result_array();
		$type_unit = $this->Crud->search('enum', array('type' => 'type_unit', 'IdDevice' => '2'))->result_array();
		$data = array(
			'unit' => $unit,
			'antenna' => $antenna,
			'status_unit' => $status_unit,
			'type_unit' => $type_unit

		);
		$this->load->view('pages/units_network', $data);
	}

	public function save_unit($device = '1') {
		$cn_unit 		= $this->input->post('cn_unit');
		$id_unit 		= $this->input->post('id_unit');
		$type_unit 		= $this->input->post('type_unit');
		$kode_unit		= $this->input->post('kode_unit');
		$description 	= $this->input->post('description');
		$position		= $this->input->post('position');
		$sn_mojo 		= $this->input->post('sn_mojo');
		$sn_wb 			= $this->input->post('sn_wb');
		$sn_gps 		= $this->input->post('sn_gps');
		$remark 		= $this->input->post('remark');
		$status 		= $this->input->post('status');

		if ($device == 1) {
			$this->Crud->insert('unit_detail', array(
				'cn_unit'		=> strtoupper($cn_unit),
				'id_unit'		=> strtoupper($id_unit),
				'type_unit'		=> $type_unit,
				'kode_unit'		=> $kode_unit,
				'description'	=> $description,
				'sn_mojo'		=> $sn_mojo,
				'sn_wb'			=> $sn_wb,
				'sn_gps'		=> $sn_gps,
				'remark'		=> $remark,
				'status'		=> $status,
				'id_device'		=> $device
			));
		} else {
			$this->Crud->insert('unit_detail', array(
				'cn_unit'		=> strtoupper($cn_unit),
				'id_unit'		=> strtoupper($id_unit),
				'type_unit'		=> $type_unit,
				'kode_unit'		=> $kode_unit,
				'description'	=> $description,
				'position'		=> $position,
				'remark'		=> $remark,
				'status'		=> $status,
				'id_device'		=> $device
			));
		}
	}

	public function importunit($unit = 'jigsaw') {
		require_once(APPPATH.'libraries/excel_reader.php');
			$config['upload_path']          = './___/uploads';
			$config['allowed_types']        = 'xls';

			$this->load->library('upload', $config);

			if ( ! $this->upload->do_upload('userfile')){
				$error = array('error' => $this->upload->display_errors());
				print_r($error);
			}else{
				$uploader = $this->upload->data();
				$data = new Spreadsheet_Excel_Reader($uploader['full_path']);
				$baris = $data->rowcount($sheet_index=0);
				for ($i=2; $i <= $baris; $i++){
					$cn_unit = $data->val($i, 1);
					$id_unit = $data->val($i, 2);
					$type_unit = $data->val($i, 3);
					$kode_unit = $data->val($i, 4);
					$description = $data->val($i, 5);
					$position = $data->val($i, 6);
					$sn_mojo = $data->val($i, 7);
					$sn_wb = $data->val($i, 8);
					$sn_gps = $data->val($i, 9);
					$antenna = $data->val($i, 10);
					$remark = $data->val($i, 11);
					$status = $data->val($i, 12);
					$id_device = $data->val($i, 13);
					$cari = count($this->Crud->search('unit_detail', array('cn_unit' => $cn_unit))->result_array());
					if ($cari > 0){
						$this->Crud->update('unit_detail', array('cn_unit' => $cn_unit), array(
							'id_unit' => $id_unit,
							'type_unit' => $type_unit,
							'kode_unit' => $kode_unit,
							'description' => $description,
							'position' => $position,
							'sn_mojo' => $sn_mojo,
							'sn_wb' => $sn_wb,
							'sn_gps' => $sn_gps,
							'antenna' => $antenna,
							'remark' => $remark,
							'status' => $status,
							'id_device' => $id_device
						));
					} else {
						$this->Crud->insert('unit_detail', array(
							'cn_unit' => $cn_unit,
							'id_unit' => $id_unit,
							'type_unit' => $type_unit,
							'kode_unit' => $kode_unit,
							'description' => $description,
							'position' => $position,
							'sn_mojo' => $sn_mojo,
							'sn_wb' => $sn_wb,
							'sn_gps' => $sn_gps,
							'antenna' => $antenna,
							'remark' => $remark,
							'status' => $status,
							'id_device' => $id_device
						));
					}
				}
				$this->session->set_flashdata('msg', 'Field saved');
				unlink($uploader['full_path']);
			}
		redirect(base_url('dash/' . $unit . '_units'));
	}


	public function password() {
		$this->load->view('users/password');
	}

	public function change_password()
	{
		$username 	= $this->session->userdata('username');
		$opass 		= $this->input->post('opass');
		$newpass 	= $this->input->post('newpass');
		$vpass 		= $this->input->post('vpass');
		$search 	= array('username' => $username);
		$validation = $this->Crud->search_select('user_report', array('username', 'password'), $search)->result_array();
		if ($newpass == $vpass) {
			if (password_verify($opass, $validation[0]['password'])) {
				$this->Crud->update('user_report', $search, array('password' => PASSWORD_HASH($newpass, PASSWORD_DEFAULT)));
				$this->session->set_flashdata('msg', '<div class="alert alert-success alert-dismissible fade show" role="alert">
		          <strong>Saved!</strong> You password is changed.
		            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		              <span aria-hidden="true">&times;</span>
		            </button>
		          </div>');
			} else {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
		          <strong>Failed!</strong> Password not valid.
		            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		              <span aria-hidden="true">&times;</span>
		            </button>
		          </div>');
			}
		} else {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
		          <strong>Failed!</strong> Password not valid.
		            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		              <span aria-hidden="true">&times;</span>
		            </button>
		          </div>');
		}
		redirect(base_url('dash/password'));
	}

	public function report($dev = '', $y = '', $m = '', $p = '') {
		$this->load->helper('Penghitungan_helper');
		$level 	= $this->session->userdata('level');
		$dev 	= empty($dev) ? 'jigsaw' : $dev;
		$device = $this->Crud->search('device_report', array('name_device' => $dev))->result_array();
		$devid = $device[0]['id'];
		$data = array(
			'devid' => $devid,
			'y' 	=> $y,
			'm' 	=> $m,
			'p'		=> $p,
			'level' => $level,
			'dev'	=> $dev
		);
		$this->load->view('pages/report', $data);
	}

	public function summary($dev = '', $y = '', $m = '', $dt = '') {
		$this->load->helper('Penghitungan_helper');
		$level 	= $this->session->userdata('level');
		$dev 	= empty($dev) ? 'jigsaw' : $dev;
		$p 		= empty($p) ? 1 : $p;
		$device = $this->Crud->search('device_report', array('name_device' => $dev))->result_array();
		$devid = $device[0]['id'];
		$data = array(
			'devid' => $devid,
			'y' 	=> $y,
			'm' 	=> $m,
			'level' => $level,
			'dev'	=> urldecode($dt),
			'p' 	=> $p
		);
		$this->load->view('report/summary', $data);
	}

	public function users() {
		$user = $this->Crud->view_select('user_report', array('IDUser','username','description','type'));
		$user = $user->result_array();
		$data = array(
			'user' => $user
		);
		$this->load->view('pages/user', $data);
	}

	public function save_user() {
		$submit = $this->input->post('save');
		$user = addslashes($this->input->post('user'));
		$pass = PASSWORD_HASH($this->input->post('pass'), PASSWORD_DEFAULT);
		$desc = addslashes($this->input->post('desc'));
		$level = addslashes(strtolower($this->input->post('level')));
		if (isset($submit)) {
			$cari = $this->Crud->search('user_report', array('username' => $user))->result_array();
			if (count($cari) > 0) {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Oh Snap!</strong> You field already in database.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
			} else {
				$this->Crud->insert('user_report', array(
					'username' => $user,
					'password' => $pass,
					'description' => $desc,
					'type' => $level
				));
				$this->session->set_flashdata('msg', '<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Savage!</strong> You field is saved.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
			}
		}
		redirect(base_url('dash/users'));
	}


	public function graph($dev = '') {
		$device = $this->Crud->search('device_report', array('name_device' => $dev))->result_array();
		$devid = $device[0]['id'];
		$sql = $this->Crud->query("SELECT YEAR(`date`) as `year` FROM `reportingjob` WHERE `id_device` = '{$devid}' GROUP BY YEAR(`date`) ORDER BY YEAR(`date`) ASC");
		$sqla = $this->Crud->query("SELECT `enum`.`name` as `problem`, count(`problem`) as `count` FROM `reportingjob` LEFT JOIN `enum` ON `enum`.`IDEnum` = `reportingjob`.`problem` WHERE MONTH(`date`) = '" . date('m') ."' AND YEAR(`date`)='" . date('Y') ."' AND `id_device` = '{$devid}'  GROUP BY `problem`");
		$data = array(
			'dev' => $dev,
			'devid' => $devid,
			'sql' => $sql,
			'sqla' => $sqla
		);
		$this->load->view('pages/graph', $data);
	}


	public function bandwith($start ='', $end = '',$unit = '') {
		if ($unit == '') {
			if ($start != '' || $end != '') {
				$sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `date` BETWEEN '{$start}' AND '{$end}' GROUP BY `id_unit`");
			} else {
				$sql = $this->Crud->query("SELECT * FROM `bandwith` GROUP BY `id_unit`");
				$sql_data = $this->Crud->query("SELECT * FROM `bandwith` WHERE `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "'");
			}
			$year = $this->Crud->query("SELECT YEAR(`date`) as `year` FROM `bandwith` GROUP BY YEAR(`date`)");
			$data = array(
				'bandwith' => $sql,
				'bandwith_data' => $sql_data,
				'unit' => '',
				'year' => $year,
				'start' => $start,
				'end' => $end
			);
			$this->load->view('pages/bandwith', $data);
		} else {
			$unit = urldecode($unit);
			if ($start != '' || $end != '') {
				$sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '{$unit}' AND `date` BETWEEN '{$start}' AND '{$end}'");
			} else {
				$sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '{$unit}'");
			}
			$data = array(
				'bandwith' => $sql,
				'unit' => $unit,
				'start' => $start,
				'end' => $end
			);
			$this->load->view('pages/sum_bandwith', $data);
		}
	}


	public function recondition($units = '') {
		$recondition = $this->Crud->search('enum', array(
			'type' => 'rekondisi',
			'IdDevice' => '1'
		))->result_array();
		$recon = array();
		foreach ($recondition as $value) {
			$recon[$value['IdEnum']] = $value['name'];
		}
		if ($units != '') {
			$reconds = $this->Crud->query("SELECT * FROM `recondition` WHERE `id_unit` = '{$units}' ORDER BY `time`, `date` ASC");
			$data = array(
				'reconds' => $reconds,
				'recondition' => $recon,
				'unit' => $units
			);
			$this->load->view('pages/sum_recon', $data);
		} else {
			$unit = $this->Crud->search('enum', array(
				'type' => 'unit',
				'IdDevice' => '1'
			))->result_array();
			
			$data = array(
				'unit' => $unit,
				'recondition' => $recon
			);
			$this->load->view('pages/recondition', $data);
		}
	}
		
}
