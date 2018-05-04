<!-- partial -->
				<div class="content-wrapper">
					<h3 class="page-heading mb-4">Device Units</h3>
					<?php 
			            if ($this->session->flashdata('msg') != '') {
			              echo '<div class="alert alert-success" role="alert">' . $this->session->flashdata('msg') . '</div>';
			            }
			          ?>
					<div class="card-deck">
						<div class="card col-lg-12 px-0 mb-4">
							<div class="card-body">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
								  Add Units
								</button>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
								  Import Excel
								</button>
								<div><p class="helper-text">Hello guys, Please check a marked serial number with red color. Please replace with actual data!</p></div>
							</div>
						</div>
					</div>
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
								                              <th>ID Unit</th>
								                              <th>Type</th>
								                              <th>Description</th>
								                              <th>Position</th>
								                              <th>Remark</th>
								                              <th>Status</th>
								                              <th>Date Updated</th>
								                              <th>PIC Updated</th>
								                              <th></th>
													</tr>
											</thead>
											<tfoot>
													<tr>
															<th>CN Unit</th>
								                              <th>ID Unit</th>
								                              <th>Type</th>
								                              <th>Description</th>
								                              <th>Position</th>
								                              <th>Remark</th>
								                              <th>Status</th>
								                              <th>Date Updated</th>
								                              <th>PIC Updated</th>
								                              <th></th>
													</tr>
											</tfoot>
											<tbody>
											<?php
											$query = "SELECT `cn_unit`,`id_unit`,`enum`.`name` as `type`,`description`,`position`,`remark`,`status` as `id_status`,`anu`.`name` as `status`,  `date_update`,`time_update`,`pic_update` FROM `unit_detail` LEFT JOIN `enum` ON `unit_detail`.`type_unit` = `enum`.`IdEnum` LEFT JOIN `enum` as `anu` ON `unit_detail`.`status` = `anu`.`IdEnum` WHERE `id_device`='2' ORDER BY `cn_unit` ASC";
											$sql = $this->Crud->query($query);
											#ffccd1
											foreach ($sql as $value) { ?>
													<tr>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'cn_unit','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['cn_unit'];?>" onClick="showEdit(this)"><?php echo $value['cn_unit'];?></td>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'id_unit','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['id_unit'];?>" onClick="showEdit(this)"><?php echo $value['id_unit'];?></td>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'type_unit','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['type'];?>" onClick="showEdit(this)"><?php echo $value['type'];?></td>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'description','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['description'];?>" onClick="showEdit(this)"><?php echo $value['description'];?></td>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'position','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['position'];?>" onClick="showEdit(this)"><?php echo $value['position'];?></td>
						                              <td contenteditable="true" onBlur="saveToDatabase(this,'remark','<?php echo $value['cn_unit']; ?>')" data-old_value="<?php echo $value['remark'];?>" onClick="showEdit(this)"><?php echo $value['remark'];?></td>
						                              <td nowrap id="st<?php echo str_replace(' ', '', $value['cn_unit']); ?>" contenteditable="true" onclick="Showing(this, '<?php echo str_replace(' ', '', $value['cn_unit']).'_s_'.$value['id_status']; ?>')">
						                                <div id="show_<?php echo str_replace(' ', '', $value['cn_unit']).'_s_'.$value['id_status']; ?>">
						                                  <?php 
						                                                  if ($value['status'] == 'Installed') {
						                                                    $status = '<label class="badge badge-success">Installed</label>';
						                                                  } elseif ($value['status'] == 'Dismantle') {
						                                                    $status = '<label class="badge badge-warning">Dismantle</label>';
						                                                  } else {
						                                                    $status = '<label class="badge badge-danger">Uninstalled</label>';
						                                                  }
						                                                  echo $status;?>
						                                </div>
						                                <div id="hide_<?php echo str_replace(' ', '', $value['cn_unit']).'_s_'.$value['id_status']; ?>" style="display: none">
						                                  <select onchange="pushDatabase(this,'status','<?php echo $value['cn_unit']; ?>')" onblur="Hiding('st<?php echo str_replace(' ', '', $value['cn_unit']); ?>', '<?php echo str_replace(' ', '', $value['cn_unit']).'_s_'.$value['id_status']; ?>')">
						                                    <?php
						                                    foreach ($status_unit as $key) {
						                                      if ($key['IdEnum'] == $value['id_status']) {
						                                        echo "<option value=\"{$key['IdEnum']}\" selected>{$key['name']}</option>";
						                                      } else {
						                                        echo "<option value=\"{$key['IdEnum']}\">{$key['name']}</option>";
						                                      }
						                                      
						                                    }
						                                    ?>
						                                  </select>
						                                </div>
						                              </td>
						                              <td wrap><?php echo $value['date_update'] . ' / ' . $value['time_update'];?></td>
						                              <td wrap><?php echo $value['pic_update'];?></td>
						                              <td><span id="delete" data-id="<?php echo $value['cn_unit']; ?>" data-toggle="tooltip" data-placement="left" title="Delete" style="cursor: pointer"><i class="fa fa-trash-o fa-lg"></i></span></td>
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

				<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Add Device Unit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      	<form id="adddevice">
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">CN Unit</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" name="cn_unit" placeholder="Type cn unit here">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">ID Unit</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" name="id_unit" placeholder="Type id unit here">
				    </div>
				  </div>
				  <div class="form-group row">
					  <label class="col-sm-2 col-form-label">Type Unit</label>
					  <div class="col-sm-6">
						  <select class="form-control" name="type_unit">
						  	<option value="">Select type unit</option>
						  	<?php
								foreach ($type_unit as $value) {
									echo '<option value="' . $value['IdEnum'] . '">' . $value['name'] . '</option>';
								} ?>
					    </select>
				    </div>
				  </div>
				  <div class="form-group row">
            <label class="col-sm-2 col-form-label">Unit</label>
            <div class="col-sm-3">
              <select class="form-control" name="kode_unit">
                <option value="">Select type unit</option>
                <?php
                foreach ($unit as $value) {
                  echo '<option value="' . $value['IdEnum'] . '">' . $value['name'] . '</option>';
                } ?>
              </select>
            </div>
          </div>
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">Description</label>
				    <div class="col-sm-10">
				    	<textarea class="form-control" name="description" rows="3" placeholder="Type description here"></textarea>
				    </div>
				  </div>
				  <div class="form-group row">
		            <label class="col-sm-2 col-form-label">Position</label>
		            <div class="col-sm-4">
		              <input type="text" class="form-control" name="position" placeholder="Type position here">
		            </div>
		          </div>
				  <div class="form-group row">
				    <label class="col-sm-2 col-form-label">Remark</label>
				    <div class="col-sm-10">
				    	<textarea class="form-control" rows="3" name="remark" placeholder="Type remark here"></textarea>
				    </div>
				  </div>
				  <div class="form-group row">
					  <label class="col-sm-2 col-form-label">Status</label>
					  <div class="col-sm-6">
						  <select class="form-control" name="status">
						  	<option value="">Select type unit</option>
						  	<?php
								foreach ($status_unit as $value) {
									echo '<option value="' . $value['IdEnum'] . '">' . $value['name'] . '</option>';
								} ?>
					    </select>
				    </div>
				  </div>
				</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="savedevice">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form method="post" enctype="multipart/form-data" action="<?php echo base_url('Dash/importunit/network');?>">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Import Data With Excel</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="custom-file">
		  <input type="file" class="custom-file-input" id="customFile" name="userfile">
		  <label class="custom-file-label" for="customFile">Choose file</label>
		  <div class="invalid-feedback">Only file .xls (Microsoft Excel 2003). <a href="<?php echo base_url('example.xls');?>">Download Example</a></div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="adds">Import Now</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
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
        url: "<?php echo base_url('Json/updateunit');?>",
        success: function(response) {
          $(editableObj).removeAttr('style');
          $(editableObj).attr('data-old_value',editableObj.innerText);
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
	        	url: "<?php echo base_url('Json/updateunit');?>",
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
	$(document).ready(function() {
		$("#device").addClass('show');
		$(document).on('click', '#savedevice', function() {
			var data = $("#adddevice").serialize();
			if(data.indexOf('=&') > -1 || data.substr(data.length - 1) == '='){
			  swal("Error!", "You field can't be empty!", "warning");
			} else {
				$.ajax({
					type: "POST",
					data: data,
					url: "<?php echo base_url('dash/save_unit/2');?>",
					success: function(response) {
						swal({
							title: "Good job!",
							text: "You field is saved!",
							type: "success",
							timer: 2000,
							button: false
						}).then((value) => {
							location.reload();
						});
					},
					error: function () {
						console.log("errr");
					}
				});
			}
		});
    $(document).on('click', '#delete', function() {
      var ai = $(this).attr('data-id');
      $.ajax({
          type: "POST",
          data:'del=' + ai,
          url: "<?php echo base_url('Json/delunit');?>",
          success: function(response) {
            location.reload();
          },
          error: function () {
            console.log("errr");
          }
      })
    });
  });
</script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#example, #exa, #shovel').DataTable()
    });
     
  </script>