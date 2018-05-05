<div class="content-wrapper"> 
 <h3 class="page-heading mb-4">Users</h3>
 <?php 
 if ($this->session->flashdata('msg') != '') {
  echo '<div class="alert alert-success" role="alert">' . $this->session->flashdata('msg') . '</div>';
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
              $sql = mysqli_query($db->connection, "SELECT `IDUser`,`username`,`description`,`type` FROM `user_report`");
              while ($data = mysqli_fetch_assoc($sql)) {
                $no++;
                ?>
                <tr id="showing">
                  <th scope="row"><?php echo $no;?></th>
                  <td><?php echo $data['username'];?></td>
                  <td><?php echo $data['description'];?></td>
                  <td><?php echo $data['type'];?></td>
                  <td><span id="delete" data-id="<?php echo $data['IDUser']; ?>" data-toggle="tooltip" data-placement="top" title="Delete" style="cursor: pointer"><i class="fa fa-trash-o fa-lg"></i></span></td>
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
         <form method="post">
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


<script type="text/javascript">
  $(document).ready(function() {
    $(document).on('click', '#delete', function() {
      var ai = $(this).attr('data-id');
      $.ajax({
 type: "POST",
 data:'del=' + ai,
 url: "<?php echo base_url('api/deluser.php');?>",
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