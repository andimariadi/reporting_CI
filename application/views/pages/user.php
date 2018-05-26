<div class="content-wrapper"> 
 <h3 class="page-heading mb-4">Users</h3>
 <?php 
 if ($this->session->flashdata('msg') != '') {
  echo $this->session->flashdata('msg');
}
?>
 <div class="row mb-2">
   <div class="col-lg-8">
     <div class="card">
       <div class="card-body">
         <h5 class="card-title mb-4">List users</h5>
         <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Username</th>
              <th scope="col">Description</th>
              <th scope="col">Level</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <?php
              $no = 0;
              foreach ($user as $data) {
                $no++;
                ?>
                <tr id="showing">
                  <th scope="row"><?php echo $no;?></th>
                  <td><?php echo $data['username'];?></td>
                  <td><?php echo $data['description'];?></td>
                  <td><?php echo $data['type'];?></td>
                  <td><span id="delete" data-id="<?php echo $data['IDUser']; ?>" data-toggle="tooltip" data-placement="top" title="Delete" style="cursor: pointer"><i class="fa fa-trash-o fa-lg"></i></span>
                    <a href="#" id="edit" data-toggle="modal" data-target="#exampleModal" data-toggle="tooltip" data-placement="top" title="Edit" data-id="<?php echo $data['IDUser']; ?>"><i class="fa fa-pencil fa-lg"></i></a>
                  </td>
                </tr>
              <?php } ?>
          </tbody>
         </table>
       </div>
     </div>
   </div>
   <div class="col-lg-4">
     <div class="card">
       <div class="card-body">
         <h5 class="card-title mb-4">Add form users</h5>
         <form method="post" action="<?php echo base_url('dash/save_user');?>">
          <div class="form-group">
            <label for="exampleInputEmail1">Username</label>
            <input type="text" class="form-control p-input" name="user" placeholder="Enter username">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control p-input" name="pass" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleTextarea">Description</label>
            <textarea class="form-control p-input" name="desc" rows="5" placeholder="Let us type some description...."></textarea>
          </div>
          <div class="form-group">
            <label for="exampleTextarea">Level Type</label>
            <select name="level" class="form-control">
              <option>Supervisor</option>
              <option>Administrator</option>
              <option>Reporting</option>
              <option>Teknisi</option>
            </select>
          </div>
          <div class="form-group">
            <button type="submit" name="save" class="btn btn-primary">Submit</button>
          </div>
         </form>
       </div>
     </div>
   </div>
 </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form method="post" enctype="multipart/form-data" id="editform">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="custom-html">

        </div>
        <a href="#" class="btn btn-danger btn-sm" id="reset">Reset Password!</a>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="#" class="btn btn-primary" id="save">Save Now!</a>
      </div>
      </form>
    </div>
  </div>
</div>


<script type="text/javascript">
  $(document).ready(function() {
    $(document).on('click', '#delete', function() {
      var ai = $(this).attr('data-id');
      $.ajax({
        type: "POST",
        data:'del=' + ai,
        url: "<?php echo base_url('json/deluser');?>",
        success: function(response) {
          location.reload();
        },
        error: function () {
          console.log("errr");
        }
      });
    });
    $(document).on('click', '#edit', function() {
      var id = $(this).attr('data-id');
      $.getJSON('<?php echo base_url('/json/edit_user/');?>' + id, function(jd) {
            if (jd.data == 'empty') {
                $("#custom-html").html('<p>Fields empty</p>');
            } else {
                var geting = "";
                var id_user;
                $.each(jd.data, function(){
                  geting += '<div class="form-group row"><input type="hidden" class="form-control" name="id" placeholder="Type username here" value="' + this['id'] + '"></div>';
                  geting += '<div class="form-group row"><label class="col-sm-2 col-form-label">Username</label><div class="col-sm-5"><input type="text" class="form-control" name="name" placeholder="Type username here" value="' + this['name'] + '"></div></div>';
                  geting += '<div class="form-group row"><label class="col-sm-2 col-form-label">Description</label><div class="col-sm-8"><input type="text" class="form-control" name="description" placeholder="Type description here" value="' + this['description'] + '"></div></div>';
                  geting += '<div class="form-group row"><label class="col-sm-2 col-form-label">Level Type</label><div class="col-sm-6"><select name="level" class="form-control">';
                  if (this['type'] == 'Supervisor') {
                    geting += '<option selected>Supervisor</option>';
                  } else {
                    geting += '<option>Supervisor</option>';
                  }
                  if (this['type'] == 'administrator') {
                    geting += '<option selected>Administrator</option>';
                  } else {
                    geting += '<option>Administrator</option>';
                  }
                  if (this['type'] == 'Reporting') {
                    geting += '<option selected>Reporting</option>';
                  } else {
                    geting += '<option>Reporting</option>';
                  }
                  if (this['type'] == 'Teknisi') {
                    geting += '<option selected>Teknisi</option>';
                  } else {
                    geting += '<option>Teknisi</option>';
                  }
                  geting += '</div></div>';
                  id_user = this['id'];
                });
                $("#custom-html").html(geting);
                $("#reset").attr('data-id', id_user);
            }
        });
    });
    $(document).on('click', '#save', function() {
      var data = $("#editform").serialize();
      $.ajax({
        type: "POST",
        data:data,
        url: "<?php echo base_url('json/update_user');?>",
        success: function(response) {
          location.reload();
        },
        error: function (response) {
          console.log(response);
        }
      });
    });
    $(document).on('click', '#reset', function() {
      var id = $(this).attr('data-id');
      $.ajax({
        type: "POST",
        data:'id=' + id,
        url: "<?php echo base_url('json/reset');?>",
        success: function(response) {
          location.reload();
        },
        error: function () {
          console.log("errr");
        }
      });
    });
  })
</script>