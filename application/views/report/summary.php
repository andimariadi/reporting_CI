				<!-- partial -->
				<div class="content-wrapper">
					<h3 class="page-heading mb-4">Summary Report <?php echo ucwords($dev);?></h3>

					<div class="card-deck">
						
						<div class="card col-lg-12 px-0 mb-4">
							<div class="card-body">
								<div class="table-responsive" style="overflow: scroll;">
									<table class="table table-striped table-bordered" cellspacing="0" width="100%">
										<thead>
											<tr bgcolor="#58d8a3">
												<th rowspan="2" style="padding: 0 30px;vertical-align: middle;text-align: center;">Date</th>
												<th rowspan="2" style="padding: 0 20px;vertical-align: middle;text-align: center;">Shift</th>
												<th rowspan="2" style="padding: 0 30px;vertical-align: middle;text-align: center;">ID Unit</th>
												<?php if ($devid == 1) { ?>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">BD Type</th>
												<?php }?>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Problem</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Category</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Work Location</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Time Problem</th>
												<?php if ($devid == 1) { ?>
												<th colspan="3">Waiting</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Problem Analysis</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Cause Of Problem</th>
												<?php } ?>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Activity Action</th>
												<th colspan="3">Action Time</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">BD Receiver</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">RFU Receiver</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">PIC</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Status</th>
												<th rowspan="2" style="vertical-align: middle;text-align: center;">Remark</th>
											</tr>
											<tr bgcolor="#58d8a3">
												<?php if ($devid == 1) { ?>
												<th>Start</th>
												<th>End</th>
												<th>Duration</th>
												<?php } ?>
												<th>Start</th>
												<th>End</th>
												<th>Duration</th>
											</tr>
										</thead>
										<tbody>
										<?php
										if ($y != '' OR $m != '') {
											$sql = "SELECT `reportingjob`.*,`enum`.`IdEnum`,`enum`.`name` as `asproblem`,`ana`.`IdEnum` as `iana`,`ana`.`name` as `analy`,`case`.`IdEnum` as `caseid`,`case`.`name` as `cname`,`act`.`IdEnum` as `idact`,`act`.`name` as `actname`,`unit_detail`.`position`,`cat`.`name` as `categoryy` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `ana` ON `reportingjob`.`analysis` = `ana`.`IdEnum` LEFT JOIN `enum` as `case` ON `reportingjob`.`case` = `case`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `enum` as `cat` ON `reportingjob`.`category` = `cat`.`IdEnum` LEFT JOIN `unit_detail` ON `reportingjob`.`id_unit` = `unit_detail`.`cn_unit` WHERE `reportingjob`.`id_unit`='{$dev}' AND YEAR(`date`)='{$y}' AND MONTH(`date`)='{$m}' ORDER BY `date`,`shift`, `start_action` ASC";
										} else {
											$sql = "SELECT `reportingjob`.*,`enum`.`IdEnum`,`enum`.`name` as `asproblem`,`ana`.`IdEnum` as `iana`,`ana`.`name` as `analy`,`case`.`IdEnum` as `caseid`,`case`.`name` as `cname`,`act`.`IdEnum` as `idact`,`act`.`name` as `actname`,`unit_detail`.`position`,`cat`.`name` as `categoryy` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `ana` ON `reportingjob`.`analysis` = `ana`.`IdEnum` LEFT JOIN `enum` as `case` ON `reportingjob`.`case` = `case`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `enum` as `cat` ON `reportingjob`.`category` = `cat`.`IdEnum` LEFT JOIN `unit_detail` ON `reportingjob`.`id_unit` = `unit_detail`.`cn_unit` WHERE `reportingjob`.`id_unit`='{$dev}' ORDER BY `date`,`shift`, `start_action` ASC";
										}
										$cdev = $this->Crud->query($sql);
										foreach ($cdev as $value) {
										?>
										<tr>
											<td nowrap><?php echo $value['date'];?></td>
											<td nowrap><?php echo $value['shift'];?></td>
											<td nowrap><?php echo $value['id_unit'];?></td>
											<?php if ($devid == 1) { ?>
											<td nowrap><?php echo $value['bd_type'];?></td>
											<?php } ?>
											<td nowrap><?php echo $value['asproblem'];?></td>
											<td nowrap><?php echo $value['categoryy'];?></td>
											<?php if ($devid == 1) { ?>
											<td nowrap><?php echo $value['location'];?></td>
											<?php } else { ?>
											<td nowrap><?php echo $value['position'];?></td>
											<?php } ?>
											<td nowrap><?php echo $value['time_problem'];?></td>
											<?php if ($devid == 1) { ?>
											<td nowrap><?php echo $value['wait_start'];?></td>
											<td nowrap><?php echo $value['wait_end'];?></td>
											<td><?php echo selisih($value['wait_start'],$value['wait_end']);?></td>
											<td nowrap><?php echo $value['analy'];?></td>
											<td nowrap><?php echo $value['cname'];?></td>
											<?php } ?>

											<td nowrap><?php echo $value['actname'];?></td>
											<td nowrap><?php echo $value['start_action'];?></td>
											<td nowrap><?php echo $value['end_action'];?></td>
											<td><?php echo selisih($value['start_action'],$value['end_action']);?></td>
											<td nowrap><?php echo $value['bd_receiver'];?></td>
											<td nowrap><?php echo $value['rfu_receiver'];?></td>
											<td nowrap><?php echo $value['pic'];?></td>
											<td nowrap><?php echo $value['status'];?></td>
											<td nowrap><?php echo $value['remark'];?></td>
										</tr>
										<?php } ?>
										</tbody>
									</table>
								</div>
							<br /><br />
							</div>
						</div>
					</div>

					
					<!-- End CardDeck -->
				</div>


<script type="text/javascript">
	$(document).ready(function() {
		<?php
		if (empty($y) OR empty($m)) { ?>
		$.getJSON('json/report.php?id=<?php echo $devid;?>', function(jd) {
			if (jd.data == 'empty') {
				$('#year').html('Tidak ada data');
			} else {
				$.each(jd.data, function(){
					$('#year').append('<li id="y-' + this['year'] + '"><span onclick="GetData(\'' + this['year'] + '\', \'y-' + this['year'] + '\')" style="cursor: pointer">Tahun: ' +this['year']+ '</span><ul id="month-' + this['year'] + '"></ul></li>');
				});
			}
		});
		<?php } ?>
	});
	
	function GetData(year,pid) {
		var vPool="";
		$.getJSON('json/report.php?id=<?php echo $devid;?>&y=' + year, function(jd) {
			$.each(jd.data, function(i, val){				
				vPool += '<li id="y-' + this['month'] + '"><a href="<?php echo base_url("?report&{$dev}&");?>' + year + '&' + this['month'] + '">' + this['month'] + ' - ' + this['tmonth'] + '</a></li>';
			});
			$('#month-' + year).html(vPool);
		});
	}
	
	function showEdit(editableObj) {
    	$(editableObj).css({"background-color": "#f9f9f9","border": "1px solid #ddd"});
  	}
  	function Showing(editableObj, column) {
  		$(editableObj).attr({"contenteditable": "false"});
  		$('#show_'+column).css({"display": "none"});
  		$('#hide_'+column).css({"display": "inline-block"});
  	}
  	function Hiding(editableObj, column) {
  		$("td").attr({"contenteditable": "true"});
  		$('#show_'+column).css({"display": "inline-block"});
  		$('#hide_'+column).css({"display": "none"});
  	}
  	function saveToDatabase(editableObj,column,id) {
    	if ($(this).attr('data-old_value') !== editableObj.innerText) {
	      	$.ajax({
	        	type: "POST",
	        	data:'column='+column+'&value='+editableObj.innerText+'&id='+id,
	        	url: "<?php echo base_url('api/ureport.php');?>",
	        	success: function(response) {
	        		$(editableObj).removeAttr('style');
	        		$(editableObj).attr('data-old_value',editableObj.innerText);
	        		location.reload();
	        	},
	        	error: function () {
	        		console.log("errr");
	        	}
	        });
      	}
    }
    function pushDatabase(editableObj,column,id) {
    	var data = $(editableObj).val();
    	$.ajax({
	        	type: "POST",
	        	data:'column='+column+'&value='+data+'&id='+id,
	        	url: "<?php echo base_url('api/ureport.php');?>",
	        	success: function(response) {
	        		$(editableObj).removeAttr('style');
	        		$(editableObj).attr('data-old_value', editableObj.innerText);
	        		location.reload();
	        	},
	        	error: function () {
	        		console.log("errr");
	        	}
	    });

    }
    $(document).on('click', '#delete', function() {
    	
    	var ai = $(this).attr('data-id');
    	//alert(ai);
      	$.ajax({
      		type: "POST",
      		data:'del=' + ai,
      		url: "<?php echo base_url('api/delrep.php');?>",
      		success: function(response) {
      			location.reload();
      		},
      		error: function () {
      			console.log("errr");
      		}
      	})
    });
</script>