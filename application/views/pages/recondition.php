<!-- partial -->
				<div class="content-wrapper">
					<h3 class="page-heading mb-4">Track Recondition</h3>
					<?php 
			            if ($this->session->flashdata('msg') != '') {
			              echo '<div class="alert alert-success" role="alert">' . $this->session->flashdata('msg') . '</div>';
			            }
			          ?>
					<?php
					foreach ($unit as $dunit) { ?>
					<div class="card-deck">
						<div class="card col-lg-12 px-0 mb-4">
							<div class="card-body">
								<h5 class="card-title"><?php echo $dunit['name']; ?></h5>
									<div class="table-responsive">
										<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<thead>
													<tr>
															<th>CN Unit</th>
															<th>Date</th>
															<th>Time</th>
															<th>Data Recondition</th>
															<th>PIC</th>
															<th></th>
													</tr>
											</thead>
											<tfoot>
													<tr>
															<th>CN Unit</th>
															<th>Date</th>
															<th>Time</th>
															<th>Data Recondition</th>
															<th>PIC</th>
															<th></th>
													</tr>
											</tfoot>
											<tbody>
											<?php
											$query = "SELECT `unit_detail`.`cn_unit`,(SELECT `date` FROM recondition WHERE recondition.id_unit = unit_detail.cn_unit ORDER BY date DESC LIMIT 1) as `date`,(SELECT `time` FROM recondition WHERE recondition.id_unit = unit_detail.cn_unit ORDER BY date DESC LIMIT 1) as `time`,(SELECT `value` FROM recondition WHERE recondition.id_unit = unit_detail.cn_unit ORDER BY date DESC LIMIT 1) as `value`,(SELECT `pic` FROM recondition WHERE recondition.id_unit = unit_detail.cn_unit ORDER BY date DESC LIMIT 1) as `pic` FROM `unit_detail` WHERE `kode_unit`='" . $dunit['IdEnum'] . "'";
											$sql = $this->Crud->query($query);
											foreach ($sql as $value) {
												$recon = explode(',', $value['value']);
											?>
											<tr>
												<td><?php echo $value['cn_unit'];?></td>
												<td><?php echo $value['date'];?></td>
												<td><?php echo $value['time'];?></td>
												<td><?php
												if ($value['value'] != '') {
													$keys = "" ;
													foreach ($recon as $key) {
														$keys .= ', ' . $recondition[$key];
													}
													echo substr($keys, 2);
												}
												?></td>
												<td><?php echo $value['pic'];?></td>
												<td><a href="<?php echo base_url("dash/recondition/{$value['cn_unit']}");?>" data-toggle="tooltip" data-placement="left" title="Summary Recondition <?php echo $value['cn_unit']; ?>" style="cursor: pointer"><i class="fa fa-arrow-right fa-lg"></i></a></td>
											</tr>
											<?php } ?>
											</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<?php } ?>

					
					<!-- End CardDeck -->
				</div>
<script type="text/javascript">
    $(document).ready(function() {
      $('#example, #exa, #shovel').DataTable()
    });
</script>