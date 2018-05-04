<div class="content-wrapper">
          <h3 class="page-heading mb-4">Problem</h3>
          <?php 
            if ($this->session->flashdata('msg') != '') {
              echo '<div class="alert alert-success" role="alert">' . $this->session->flashdata('msg') . '</div>';
            }
          ?>
          <div class="row mb-2">
          
          <?php
          foreach ($device as $value) {?>
            <div class="col-md-6 mb-4">
              
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title"><?php echo $value['name_device'];?></h5>
                  <div class="row">
                    <div class="col-12">
                      <div class="mb-4">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">Name</th>
                              <th scope="col"></th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php
                            $no = 0;
                            $sqla = $this->Crud->search('enum', array('type' => 'problem', 'IdDevice' => $value['id']))->result_array();
                            foreach ($sqla as $data) {
                              $no++;
                              ?>
                              <tr id="showing">
                                <th scope="row"><?php echo $no;?></th>
                                <td contenteditable="true" onBlur="saveToDatabase(this,'<?php echo $data['IdEnum']; ?>')" data-old_value="<?php echo $data['name'];?>" onClick="showEdit(this)">
                                  <?php echo $data['name'];?>
                                </td>
                                <td><span id="delete" data-id="<?php echo $data['IdEnum']; ?>" data-toggle="tooltip" data-placement="top" title="Delete" style="cursor: pointer"><i class="fa fa-trash-o fa-lg"></i></span></td>
                              </tr>
                            <?php } ?>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <div class="col-12">
                      <p class="text-muted mb-0">
                      <form class="form-inline" method="post" action="<?php echo base_url('dash/save/problem');?>">
                        <div class="form-group mx-sm-8 mb-2">
                          <input type="hidden" value="<?php echo $value['id'];?>" name="iddevice">
                          <input type="text" class="form-control p-input" name="namesave" placeholder="Enter Add Data">
                        </div>
                        <button type="submit" class="btn btn-link mb-2" name="save"><i class="fa fa-plus-circle fa-lg"></i>  Add Problem</button>
                      </form>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <?php } ?>

          </div>
        </div>

<script type="text/javascript">
  function showEdit(editableObj) {
    $(editableObj).css({"background-color": "#f9f9f9","border": "1px solid #ddd"});
  }
    function saveToDatabase(editableObj,id) {
      if ($(this).attr('data-old_value') !== editableObj.innerText) {
        $.ajax({
          type: "POST",
          data:'column=name&value='+editableObj.innerText+'&id='+id,
          url: "<?php echo base_url('Json/uenum');?>",
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
  $(document).ready(function() {
    $(document).on('click', '#delete', function() {
      var ai = $(this).attr('data-id');
      $.ajax({
          type: "POST",
          data:'del=' + ai,
          url: "<?php echo base_url('Json/delenum');?>",
          success: function(response) {
            location.reload();
          },
          error: function () {
            console.log("errr");
          }
      });
    });
    $("#problem").addClass('show');
  })
</script>