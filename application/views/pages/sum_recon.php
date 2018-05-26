<!-- partial -->
				<div class="content-wrapper">
					<h3 class="page-heading mb-4">Track Recondition</h3>
					<?php 
			            if ($this->session->flashdata('msg') != '') {
			              echo '<div class="alert alert-success" role="alert">' . $this->session->flashdata('msg') . '</div>';
			            }
			          ?>
					<div class="card-deck">
						<div class="card col-lg-12 px-0 mb-4">
							<div class="card-body">
								<h5 class="card-title">Summary Recondition <?php echo $unit; ?></h5>
									<div class="table-responsive">
										<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<thead>
													<tr>
															<th>CN Unit</th>
															<th>Date</th>
															<th>Time</th>
															<th>Data Recondition</th>
															<th>PIC</th>
													</tr>
											</thead>
											<tfoot>
													<tr>
															<th>CN Unit</th>
															<th>Date</th>
															<th>Time</th>
															<th>Data Recondition</th>
															<th>PIC</th>
													</tr>
											</tfoot>
											<tbody>
											<?php
											foreach ($reconds as $value) {
												$recon = explode(',', $value['value']);
											?>
											<tr>
												<td><?php echo $value['id_unit'];?></td>
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
											</tr>
											<?php } ?>
											</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					
					<!-- End CardDeck -->
				</div>
<script type="text/javascript">
    $(document).ready(function() {
      $('#example, #exa, #shovel').DataTable()
    });
</script>