<?php $year = empty($y) ? null : $y;
										$month = empty($m) ? null : $m;
										$p = empty($p) ? 1 : $p;

										//setting halaman
										$per_page = 10;
										$start = ($p - 1) * $per_page;
										if (isset($p)) {
											$sql = $this->Crud->query("SELECT `date` FROM `reportingjob` WHERE `id_device`='{$devid}' AND YEAR(`date`)='{$year}' AND MONTH(`date`)='{$month}' GROUP BY `date` LIMIT $start, $per_page");
										} else {
											$sql = $this->Crud->query("SELECT `date` FROM `reportingjob` WHERE `id_device`='{$devid}' AND YEAR(`date`)='{$year}' AND MONTH(`date`)='{$month}' GROUP BY `date` LIMIT $start, $per_page");
										}
										$sqla = $this->Crud->query("SELECT `date` FROM `reportingjob` WHERE `id_device`='{$devid}' AND YEAR(`date`)='{$year}' AND MONTH(`date`)='{$month}' GROUP BY `date`");
										$total = count($sqla);
										$page_total =  ceil($total / $per_page);
										?>
<div class="row">
	<div class="col-md-6">
<nav aria-label="...">
                <ul class="pagination pagination-lg">

                  <?php
                   $paging_info = get_paging_info($page_total,1,$p); ?>
                    <?php if($paging_info['curr_page'] > 1) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/1");?>' title='Page 1' class="page-link">First</a></li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . ($paging_info['curr_page'] - 1));?>' title='Page <?php echo ($paging_info['curr_page'] - 1); ?>' class="page-link">Prev</a></li>
                      <?php
                    endif; 

                          $max = 7;
                          if($paging_info['curr_page'] < $max)
                              $sp = 1;
                          elseif($paging_info['curr_page'] >= ($paging_info['pages'] - floor($max / 2)) )
                              $sp = $paging_info['pages'] - $max + 1;
                          elseif($paging_info['curr_page'] >= $max)
                              $sp = $paging_info['curr_page']  - floor($max/2);
                      ?>

                      <?php if($paging_info['curr_page'] >= $max) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/1");?>' title='Page 1' class="page-link">1</a></li>
                          <li class="page-item">..</li>
                      <?php endif; ?>
                      <?php for($i = $sp; $i <= ($sp + $max -1);$i++) : ?>
                          <?php
                              if($i > $paging_info['pages'])
                                  continue;
                          ?>
                          <?php if($paging_info['curr_page'] == $i) : ?>
                              <li class="page-item disabled"><a href="#" class="page-link"><?php echo $i; ?></a></li>
                          <?php else : ?>
                              <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $i);?>' title='Page <?php echo $i; ?>' class="page-link"><?php echo $i; ?></a></li>
                          <?php endif; ?>
                      <?php endfor; ?>
                      <?php if($paging_info['curr_page'] < ($paging_info['pages'] - floor($max / 2))) : ?>
                          <li class="page-item">..</li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $paging_info['pages']);?>' title='Page <?php echo $paging_info['pages']; ?>' class="page-link"><?php echo $paging_info['pages']; ?></a></li>
                      <?php endif; ?>
                      <?php if($paging_info['curr_page'] < $paging_info['pages']) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . ($paging_info['curr_page'] + 1));?>' title='Page <?php echo ($paging_info['curr_page'] + 1); ?>' class="page-link">Next</a></li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $paging_info['pages']);?>' title='Page <?php echo $paging_info['pages']; ?>' class="page-link">Last</a></li>
                      <?php endif; ?>
                </ul>
              </nav>
	</div>
	<div class="col-md-6">
		<div class="form-group row">
			<div class="col-md-10">
	    	<input type="text" class="form-control" id="search_dump" placeholder="Search Summary Unit" />
	    	</div>
	    	<div class="col-md-2">
	    		<a href="#" class="btn btn-primary" onclick="pageloc('search_dump')">Search</a>
	    	</div>
	  	</div>
  	</div>
</div>
										<?php
										foreach ($sql as $key) {
											echo '<p>Date : <b>' . $key['date'] . '</b></p>';
											?>
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
																<th rowspan="2"></th>
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
													$sqla = $this->Crud->query("SELECT `reportingjob`.*,`enum`.`IdEnum`,`enum`.`name` as `asproblem`,`ana`.`IdEnum` as `iana`,`ana`.`name` as `analy`,`case`.`IdEnum` as `caseid`,`case`.`name` as `cname`,`act`.`IdEnum` as `idact`,`act`.`name` as `actname`,`unit_detail`.`position`,`cat`.`name` as `categoryy` FROM `reportingjob` LEFT JOIN `enum` ON `reportingjob`.`problem`=`enum`.`IdEnum` LEFT JOIN `enum` as `ana` ON `reportingjob`.`analysis` = `ana`.`IdEnum` LEFT JOIN `enum` as `case` ON `reportingjob`.`case` = `case`.`IdEnum` LEFT JOIN `enum` as `act` ON `reportingjob`.`activity` = `act`.`IdEnum` LEFT JOIN `enum` as `cat` ON `reportingjob`.`category` = `cat`.`IdEnum` LEFT JOIN `unit_detail` ON `reportingjob`.`id_unit` = `unit_detail`.`cn_unit` WHERE `reportingjob`.`id_device`='{$devid}' AND `reportingjob`.`date`='" . $key['date'] . "' ORDER BY `shift` ,  `start_action` ASC");
													foreach ($sqla as $value) {
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
																	<td nowrap><?php echo selisih($value['wait_start'],$value['wait_end']);?></td>

																	<td nowrap><?php echo $value['analy'];?></td>

																	<td nowrap><?php echo $value['cname'];?></td>
																	<?php } ?>

																	<td nowrap><?php echo $value['actname'];?></td>
																	<td nowrap><?php echo $value['start_action'];?></td>
																	<td nowrap><?php echo $value['end_action'];?></td>
																	<td nowrap><?php echo selisih($value['start_action'],$value['end_action']);?></td>
																	<td nowrap><?php echo $value['bd_receiver'];?></td>
																	<td nowrap><?php echo $value['rfu_receiver'];?></td>
																	<td nowrap><?php echo $value['pic'];?></td>
																	<td nowrap><?php echo $value['status'];?></td>
																	<td nowrap><?php echo $value['remark'];?></td>
																	<td nowrap><a href="<?php echo base_url("dash/summary/{$dev}/{$y}/{$m}/{$value['id_unit']}");?>" data-id="<?php echo $value['IDReport']; ?>" data-toggle="tooltip" data-placement="left" title="Summary <?php echo $value['id_unit']; ?>" style="cursor: pointer"><i class="fa fa-arrow-right fa-lg"></i></a></td>
															</tr>
													<?php } ?>
													</tbody>
												</table>
											</div>
											<br /><br />
<?php } ?>
<div style="text-align: center">
<nav aria-label="...">
                <ul class="pagination pagination-lg">

                    <?php if($paging_info['curr_page'] > 1) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/1");?>' title='Page 1' class="page-link">First</a></li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . ($paging_info['curr_page'] - 1));?>' title='Page <?php echo ($paging_info['curr_page'] - 1); ?>' class="page-link">Prev</a></li>
                      <?php
                    endif; 

                          $max = 7;
                          if($paging_info['curr_page'] < $max)
                              $sp = 1;
                          elseif($paging_info['curr_page'] >= ($paging_info['pages'] - floor($max / 2)) )
                              $sp = $paging_info['pages'] - $max + 1;
                          elseif($paging_info['curr_page'] >= $max)
                              $sp = $paging_info['curr_page']  - floor($max/2);
                      ?>

                      <?php if($paging_info['curr_page'] >= $max) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/1");?>' title='Page 1' class="page-link">1</a></li>
                          <li class="page-item">..</li>
                      <?php endif; ?>
                      <?php for($i = $sp; $i <= ($sp + $max -1);$i++) : ?>
                          <?php
                              if($i > $paging_info['pages'])
                                  continue;
                          ?>
                          <?php if($paging_info['curr_page'] == $i) : ?>
                              <li class="page-item disabled"><a href="#" class="page-link"><?php echo $i; ?></a></li>
                          <?php else : ?>
                              <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $i);?>' title='Page <?php echo $i; ?>' class="page-link"><?php echo $i; ?></a></li>
                          <?php endif; ?>
                      <?php endfor; ?>
                      <?php if($paging_info['curr_page'] < ($paging_info['pages'] - floor($max / 2))) : ?>
                          <li class="page-item">..</li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $paging_info['pages']);?>' title='Page <?php echo $paging_info['pages']; ?>' class="page-link"><?php echo $paging_info['pages']; ?></a></li>
                      <?php endif; ?>
                      <?php if($paging_info['curr_page'] < $paging_info['pages']) : ?>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . ($paging_info['curr_page'] + 1));?>' title='Page <?php echo ($paging_info['curr_page'] + 1); ?>' class="page-link">Next</a></li>
                          <li class="page-item"><a href='<?php echo base_url("dash/detail/{$dev}/{$y}/{$m}/" . $paging_info['pages']);?>' title='Page <?php echo $paging_info['pages']; ?>' class="page-link">Last</a></li>
                      <?php endif; ?>
                </ul>
              </nav>
</div>