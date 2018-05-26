<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class exports extends CI_Controller {

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
		$this->load->helper('Penghitungan_helper');
    }

    public function index() {
    	
    }

    public function report($dev='', $year = '', $mount = '') {
    	$dev = $dev == '' ? null : $dev;
		$y = $year == '' ? null : $year;
		$m = $mount == '' ? null : $mount;
		/** Error reporting */
		error_reporting(E_ALL);
		ini_set('display_errors', TRUE);
		ini_set('display_startup_errors', TRUE);
		date_default_timezone_set('Europe/London');

		if (PHP_SAPI == 'cli')
			die('This example should only be run from a Web Browser');

		/** Include PHPExcel */
		$this->load->library('Excel');

		// Create new PHPExcel object
		$objPHPExcel = new PHPExcel();

		// Set document properties
		$objPHPExcel->getProperties()->setCreator("Andi Mariadi")
									 ->setLastModifiedBy("Andi Mariadi")
									 ->setTitle("Office 2007 XLSX Test Document")
									 ->setSubject("Office 2007 XLSX Test Document")
									 ->setDescription("This document for Office 2007 XLSX, generated using PHP classes.")
									 ->setKeywords("office 2007 openxml php")
									 ->setCategory("Result file");

		//logo atas
			$objDrawing = new PHPExcel_Worksheet_Drawing();
			$objDrawing->setName('Logo ');
			$objDrawing->setDescription('Logo ');

			if ($dev == 'jigsaw') {
				$objDrawing->setPath('___/images/report_jigsaw.png');
				$fillbor = '0561a3';
				$fillanu = '0070c0';
				$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:W4');
			} else {
				$objDrawing->setPath('___/images/report_network.png');
				$fillbor = 'ff0000';
				$fillanu = 'ff5050';
				$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:Q4');
			}
			
			$objDrawing->setResizeProportional(true);
			$objDrawing->setHeight(79);
			$objDrawing->setCoordinates('B1');
			$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

			//styles
			$border = array('fill' => array('borders' => array(
										'right'		=> array('style' => PHPExcel_Style_Border::BORDER_THIN)
									)));
			$bordering = array('fill' 	=> array(
									'type'		=> PHPExcel_Style_Fill::FILL_SOLID,
									'color'		=> array('rgb' => $fillbor)
									),
					'font' => array(
								'size'  => 12,
								'name'  => 'Times New Roman',
								'color' => array('rgb' => 'ffffff')
							),
					'borders' => array(
										'bottom'	=> array('style' => PHPExcel_Style_Border::BORDER_MEDIUM),
										'left'	=> array('style' => PHPExcel_Style_Border::BORDER_MEDIUM),
										'top'	=> array('style' => PHPExcel_Style_Border::BORDER_MEDIUM),
										'right'		=> array('style' => PHPExcel_Style_Border::BORDER_MEDIUM)
									),
					'alignment' => array(
			            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER
			        	)
					 );
			$styleArray = array(
		          'borders' => array(
		              'allborders' => array(
		                  'style' => PHPExcel_Style_Border::BORDER_THIN
		              )
		          )
		      );

			$tebal = array(
					'borders' => array(
							'bottom'	=> array('style' => PHPExcel_Style_Border::BORDER_MEDIUM)
						)
					 );

			$objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray(
				array('fill' 	=> array(
									'type'		=> PHPExcel_Style_Fill::FILL_SOLID,
									'color'		=> array('rgb' => $fillanu)
									)
				)
			);


			$objPHPExcel->getActiveSheet()->getStyle('A5:' . $objPHPExcel->getActiveSheet()->getHighestColumn() . $objPHPExcel->getActiveSheet()->getHighestRow())->applyFromArray($styleArray);

			//data in tables
			$alphas = range('A', 'Z');
			if ($dev == 'jigsaw') {
				$objPHPExcel->getActiveSheet()->getStyle('A5:W5')->applyFromArray($bordering);
				$td = array('No', 'Date', 'Shift', 'CN Jigsaw', 'Type', 'BD Type', 'Problem', 'Work Location', 'Time First Problem', 'Start Waiting', 'End Waiting', 'Duration Waiting', 'Problem Analysis', 'Cause Of Problem', 'Corrective Action', 'Start Action', 'End Action', 'Duration Action', 'BD Reciever', 'RFU Reciever', 'PIC', 'Status', 'Remarks');
				$forv = 23;
			} else {
				$objPHPExcel->getActiveSheet()->getStyle('A5:Q5')->applyFromArray($bordering);
				$td = array('No', 'Date', 'Shift', 'CN Unit', 'Detail Problem Analysis', 'Category', 'Work Location', 'Time First Problem', 'Corrective Action', 'Start Action',' End Action','Duration', 'BD Reciever', 'RFU Reviever', 'PIC', 'Remarks', 'Status');
				$forv = 17;
			}
			
			for ($i=0; $i < $forv ; $i++) { 
				$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[$i] . '5', $td[$i]);
				$objPHPExcel->getActiveSheet()->getStyle($alphas[$i] . '5')->getAlignment()->setWrapText(true); 
			}

			//size of column

			if ($dev == 'jigsaw') {
				$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(4.29);
				$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(16.57);
				$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(7);
				$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(17.86);
				$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(35);
				$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(9.86);
				$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(60);
				$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(35);
				$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(42);
				$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('R')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('S')->setWidth(16.57);
				$objPHPExcel->getActiveSheet()->getColumnDimension('T')->setWidth(16.57);
				$objPHPExcel->getActiveSheet()->getColumnDimension('U')->setWidth(30);
				$objPHPExcel->getActiveSheet()->getColumnDimension('V')->setWidth(14.00);
				$objPHPExcel->getActiveSheet()->getColumnDimension('W')->setWidth(200);
			} else {
				$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(4.29);
				$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(16.57);
				$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(6.29);
				$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(14.71);
				$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(32.86);
				$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(13.71);
				$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(18);
				$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(10.57);
				$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(36.43);
				$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(7.86);
				$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(7.86);
				$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(10);
				$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(14.71);
				$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(17.43);
				$objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(20.71);
				$objPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(131.43);
				$objPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(14.43);
			}
			$objPHPExcel->getActiveSheet()->getRowDimension('5')->setRowHeight(40);


			//for export data in mysql database
			$cdev = $this->Crud->query("SELECT `id` FROM `device_report` WHERE `name_device`='{$dev}'");
			$devid = $cdev[0]['id'];
			if (isset($y) OR isset($m)) {
				$year = empty($y) ? null : $y;
				$month = empty($m) ? null : $m;
				$sss = "SELECT `date` FROM `reportingjob` WHERE `id_device`='{$devid}' AND YEAR(`date`)='{$year}' AND MONTH(`date`)='{$month}' GROUP BY `date`";
				$sql = $this->Crud->query($sss);
				$hitung = 5;
				foreach ($sql as $value) {
					$no = 0;
					if ($devid == 1) {
						$ss = "SELECT `reportingjob`.`date`,`reportingjob`.`shift`,`reportingjob`.`id_unit`,`cat`.`name` as `category`,`reportingjob`.`bd_type`,`enum`.`name` as `problem`,`reportingjob`.`location`,`reportingjob`.`time_problem`,`wait_start`,`wait_end`,NULL as `duration`,`ana`.`name` as `analy`,`case`.`name` as `cname`,`act`.`name` as `actname`,`start_action`,`end_action`,NULL as `duration`,`bd_receiver`,`rfu_receiver`,`pic`,`reportingjob`.`status`,`reportingjob`.`remark` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `ana` ON `reportingjob`.`analysis` = `ana`.`IdEnum` LEFT JOIN `enum` as `case` ON `reportingjob`.`case` = `case`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `enum` as `cat` ON `reportingjob`.`category` = `cat`.`IdEnum` LEFT JOIN `unit_detail` ON `reportingjob`.`id_unit` = `unit_detail`.`cn_unit` WHERE `reportingjob`.`id_device`='{$devid}' AND `reportingjob`.`date`='" . $value['date'] . "' ORDER BY `shift`, `start_action` ASC";
					} else {
						$ss= "SELECT `reportingjob`.`date`,`reportingjob`.`shift`,`reportingjob`.`id_unit`,`enum`.`name` as `asproblem`,`cat`.`name` as `category`,`unit_detail`.`position`,`time_problem`,`act`.`name` as `activity`,`start_action`,`end_action`,'' as `duration`,`bd_receiver`,`rfu_receiver`,`pic`,`reportingjob`.`remark`,`reportingjob`.`status` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `ana` ON `reportingjob`.`analysis` = `ana`.`IdEnum` LEFT JOIN `enum` as `case` ON `reportingjob`.`case` = `case`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `enum` as `cat` ON `reportingjob`.`category` = `cat`.`IdEnum` LEFT JOIN `unit_detail` ON `reportingjob`.`id_unit` = `unit_detail`.`cn_unit` WHERE `reportingjob`.`id_device`='{$devid}' AND `reportingjob`.`date`='" . $value['date'] . "' ORDER BY `reportingjob`.`shift`, `start_action` ASC";
					}
					
					$sqla = $this->Crud->query($ss);
					$end = count($sqla);
					foreach ($sqla as $data) {
						$no++;
						$hitung++;
						$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[0] . $hitung, $no);
						$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[1] . $hitung, $data['date']);
						$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[2] . $hitung, $data['shift']);
						$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[3] . $hitung, $data['id_unit']);

						if ($devid == 1) {
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[4] . $hitung, $data['category']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[5] . $hitung, $data['bd_type']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[6] . $hitung, $data['problem']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[7] . $hitung, $data['location']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[8] . $hitung, $data['time_problem']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[9] . $hitung, $data['wait_start']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[10] . $hitung, $data['wait_end']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[11] . $hitung, selisih($data['wait_start'],$data['wait_end']));
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[12] . $hitung, $data['analy']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[13] . $hitung, $data['cname']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[14] . $hitung, $data['actname']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[15] . $hitung, $data['start_action']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[16] . $hitung, $data['end_action']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[17] . $hitung, selisih($data['start_action'],$data['end_action']));
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[18] . $hitung, $data['bd_receiver']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[19] . $hitung, $data['rfu_receiver']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[20] . $hitung, $data['pic']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[21] . $hitung, $data['status']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[22] . $hitung, $data['remark']);
						} else {
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[4] . $hitung, $data['asproblem']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[5] . $hitung, $data['category']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[6] . $hitung, $data['position']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[7] . $hitung, $data['time_problem']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[8] . $hitung, $data['activity']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[9] . $hitung, $data['start_action']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[10] . $hitung, $data['end_action']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[11] . $hitung, selisih($data['start_action'],$data['end_action']));
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[12] . $hitung, $data['bd_receiver']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[13] . $hitung, $data['rfu_receiver']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[14] . $hitung, $data['pic']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[15] . $hitung, $data['remark']);
							$objPHPExcel->setActiveSheetIndex(0)->setCellValue($alphas[16] . $hitung, $data['status']);
						}
						for ($i=1, $a = 0; $i < $forv; $i++, $a++) { 
							$objPHPExcel->getActiveSheet()->getStyle($alphas[$a] . $hitung . ':' . $objPHPExcel->getActiveSheet()->getHighestColumn() . $objPHPExcel->getActiveSheet()->getHighestRow())->applyFromArray($styleArray);							
						}
						
					}
					$objPHPExcel->getActiveSheet()->getStyle("A{$hitung}:Q{$hitung}")->applyFromArray($tebal);
				}
			}



		$objPHPExcel->getActiveSheet()->setTitle('Activity ' . ucfirst($dev));

		$objPHPExcel->setActiveSheetIndex(0);
		// Redirect output to a client’s web browser (Excel5)
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="ADMO MDI ' . date('y') . '_Report ' . date('F') . ' Daily Activity ' . ucfirst($dev) . '.xls"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');

		exit;
    }


}
?>