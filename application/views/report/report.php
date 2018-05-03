<?php

$hour = time() + (86400 * 30);
$submit = $this->input->post('submit');
$dev = $this->input->cookie('dev') != '' ? $this->input->cookie('dev') : '';
echo '<body>
      <div class="container-scroller">
        <div class="container-fluid">
        <div class="row">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">';
            if ($this->session->flashdata('msg') != '') {
              echo '<div class="alert alert-danger" role="alert">' . $this->session->flashdata('msg') . '</div>';
            }

if ($this->input->cookie('dev') == '') {
  echo $this->input->cookie('dev');
  if (isset($submit)) {
    $value = $this->input->post('dev');
    $cookie = array(
          'name'   => 'dev',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      redirect(base_url('index.php/report'));
  }
  ?>
  <?php
    $data = $this->crud->view('device_report');
    foreach ($data as $value) {
      if ($value['id'] == 1) {
        $color = "btn-primary";
      } else {
        $color = "btn-success";
      }
    ?>
    <form method="post" action="">
      <div class="text-center">
        <input type="hidden" name="dev" value="<?php echo $value['id'];?>" />
        <button type="submit" name="submit" class="btn <?php echo $color;?> btn-block"><?php echo $value['name_device'];?></button>
      </div>
    </form>
    <br />
    <?php }
} elseif ($this->input->cookie('bd') == '' AND $this->input->cookie('rfu') == '' AND $this->input->cookie('pic') == '' AND $this->input->cookie('dev') != '') {
  if (isset($submit)) {
    $bd = $this->input->post('bd');
    $rfu = $this->input->post('rfu');
    $pic = $this->input->post('pic');
    $cookie = array(
          'name'   => 'bd',
          'value'  => $bd,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    $cookie = array(
          'name'   => 'rfu',
          'value'  => $rfu,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    $cookie = array(
          'name'   => 'pic',
          'value'  => $pic,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    redirect(base_url('index.php/report'));
  }
  ?>
  <form method="post">
    <div class="form-group">
      <input type="text" class="form-control p_input" name="bd" placeholder="BD Receiver" required>
    </div>
    <div class="form-group">
      <input type="text" class="form-control p_input" name="rfu" placeholder="RFU Receiver" required>
    </div>
    <div class="form-group">
      <input type="text" class="form-control p_input" name="pic" placeholder="Person in Charge" required>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>
  <?php
}  elseif ($this->input->cookie('bd') != '' AND $this->input->cookie('rfu') != '' AND $this->input->cookie('pic') != '' AND $this->input->cookie('device') == '') {
  if (isset($submit)) {
    $device = $this->input->post('device');
    $data = $this->crud->search('unit_detail', array('id_unit' => $post));
    $row = $data->num_rows();
    if ($row > 0) {
      $cookie = array(
          'name'   => 'device',
          'value'  => $device,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
    } else {
      $this->session->set_flashdata('msg', 'Error! Unit not in database');
    }
    redirect(base_url('index.php/report'));
  }

  ?>
  <form method="post">
    <div class="form-group">
      <select  class="form-control" name="device">
        <?php
        $search = $this->crud->search('unit_detail', array('id_device' => $dev));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['cn_unit']}\">{$value['cn_unit']}</option>";
        }
        ?>
          
      </select>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>

<?php

}

echo '</div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </body>';
    ?>