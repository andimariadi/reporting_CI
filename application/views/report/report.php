<?php

$hour = time() + (86400 * 30);
$submit = $this->input->post('submit');
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

if ($dev == '') {
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
} elseif ($bd == '' AND $rfu == '' AND $pic == '' AND $dev != '') {
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
}  elseif ($bd != '' AND $rfu != '' AND $pic != '' AND $device == '') {
  if (isset($submit)) {
    $device = $this->input->post('device');
    $data = $this->crud->search('unit_detail', array('id_unit' => $device));
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

} elseif ($device != '' AND $loc == '') {
  if ($dev != 1) {
    $cookie = array(
          'name'   => 'loc',
          'value'  => 'network',
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    redirect(base_url('index.php/report'));
  } else {
    if (isset($submit)) {
      $value = $this->input->post('location');
      $cookie = array(
          'name'   => 'loc',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      redirect(base_url('index.php/report'));
    }
    ?>
    <form method="post">
            <div class="form-group">
              <input type="text" class="form-control p_input" placeholder="Work Location" name="location" required>
            </div>
            <div class="text-center">
              <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
            </div>
          </form>
<?php
  } 
} elseif ($loc != '' AND $swait == '' AND $ewait == '') {
  if ($dev != 1) {
    $cookie = array(
          'name'   => 'swait',
          'value'  => date('H:i:s'),
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    $cookie = array(
          'name'   => 'ewait',
          'value'  => date('H:i:s'),
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    redirect(base_url('index.php/report'));
  } else {
    if (isset($submit)) {
      $value = $this->input->post('swait');
      $cookie = array(
          'name'   => 'swait',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('ewait');
      $cookie = array(
          'name'   => 'ewait',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      redirect(base_url('index.php/report'));
    }

?>
  <form method="post">
    <div class="form-group">
      <label>Start Waiting</label>
      <input type="text" class="form-control p_input" placeholder="HH:MM:SS" name="swait" required>
    </div>
    <div class="form-group">
      <label>End Waiting</label>
      <input type="text" class="form-control p_input" placeholder="HH:MM:SS" name="ewait" required>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>
<?php }

} elseif ($sact == '' AND $eact == '' AND $ewait != '' AND $swait != '') {
  if (isset($submit)) {
    $value = $this->input->post('sact');
    $cookie = array(
          'name'   => 'sact',
          'value'  => $value,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    $value = $this->input->post('eact');
    $cookie = array(
          'name'   => 'eact',
          'value'  => $value,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    redirect(base_url('index.php/report'));
  }
?>
  <form method="post">
    <div class="form-group">
      <label>Start Action</label>
      <input type="text" class="form-control p_input" placeholder="HH:MM:SS" name="sact" value="<?php echo $this->input->cookie('ewait');?>" required>
    </div>
    <div class="form-group">
      <label>End Action</label>
      <input type="text" class="form-control p_input" placeholder="HH:MM:SS" name="eact" required>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>

<?php } elseif ($bd_type == '' AND $problem == '' AND $analysis == '' AND $case == '' AND $activity == '' AND $eact != '' AND $sact != '') {
    if (isset($submit)) {
      $value = $this->input->post('bd_type');
      $cookie = array(
          'name'   => 'bd_type',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('problem');
      $cookie = array(
          'name'   => 'problem',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('analysis');
      $cookie = array(
          'name'   => 'analysis',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('case');
      $cookie = array(
          'name'   => 'case',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('activity');
      $cookie = array(
          'name'   => 'activity',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('category');
      $cookie = array(
          'name'   => 'category',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      redirect(base_url('index.php/report'));
    } 
?>
  <form method="post">
    <?php if ($dev == 1) { ?>
    <div class="form-group">
      <label>BD Type</label>
      <select class="form-control" name="bd_type" required>
        <option value="BS">BS</option>
        <option value="BUS">BUS</option>
        <option value="BUS BY PLAN">BUS BY PLAN</option>
        <option value="STB">STB</option>
        <option value="OPERASI">OPERASI</option>
      </select>
    </div>
    <?php } ?>

    <div class="form-group">
      <label>Problem</label>
      <select class="form-control" name="problem">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'problem'));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
        }
        ?>
      </select>
    </div>
    <?php if ($dev == 1) { ?>
    <div class="form-group">
      <label>Problem Analysis</label>
      <select class="form-control" name="analysis">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'analysis'));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
        }
        ?>
      </select>
    </div>
    <div class="form-group">
      <label>Cause Of Problem</label>
      <select class="form-control" name="case">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'case'));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
        }
        ?>
      </select>
    </div>
    <?php } ?>
    <div class="form-group">
      <label>Category</label>
      <select class="form-control" name="category">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'category'));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
        }
        ?>
      </select>
    </div>
    <div class="form-group">
      <label>Activity</label>
      <select class="form-control" name="activity">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'activity'));
        $data = $search->result_array();
        foreach ($data as $value) {
          echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
        }
        ?>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>
<?php } elseif ($problem != '' AND $activity != '' AND $remark == '' AND $status == '') {
  if (isset($submit)) {
    if ($dev == 1) {
      $value = $this->input->post('sn_mojo');
      $cookie = array(
          'name'   => 'sn_mojo',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('sn_wb');
      $cookie = array(
          'name'   => 'sn_wb',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('sn_gps');
      $cookie = array(
          'name'   => 'sn_gps',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('antenna');
      $cookie = array(
          'name'   => 'antenna',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('relay');
      $cookie = array(
          'name'   => 'relay',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
      $value = $this->input->post('locked');
      $cookie = array(
          'name'   => 'locked',
          'value'  => $value,
          'expire' => $hour
          );
      $this->input->set_cookie($cookie);
    }
    $value = $this->input->post('remark');
    $cookie = array(
          'name'   => 'remark',
          'value'  => $value,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    $value = $this->input->post('status');
    $cookie = array(
          'name'   => 'status',
          'value'  => $value,
          'expire' => $hour
          );
    $this->input->set_cookie($cookie);
    redirect(base_url('index.php/report'));
  }
  $show = $this->crud->search('unit_detail', array('cn_unit' => $device));
  $show = $show->result_array();
  $mojo     = empty($show[0]['sn_mojo']) ? null : $show[0]['sn_mojo'];
  $wb       = empty($show[0]['sn_wb']) ? null : $show[0]['sn_wb'];
  $gps      = empty($show[0]['sn_gps']) ? null : $show[0]['sn_gps'];
  $antenna  = empty($show[0]['antenna']) ? null : $show[0]['antenna'];
  $remark   = empty($show[0]['remark']) ? null : $show[0]['remark'];
  $relay    = empty($show[0]['relay']) ? null : $show[0]['relay'];
  $locked   = empty($show[0]['locked']) ? null : $show[0]['locked'];

?>
  <form method="post">
    <?php if ($dev == 1) { ?>
    <div class="form-group">
      <label>S/N MOJO</label>
      <input type="text" class="form-control p_input" placeholder="Type serial number mojo" name="sn_mojo" value="<?php echo $mojo;?>" required/>
    </div>

    <div class="form-group">
      <label>S/N Wifibox</label>
      <input type="text" class="form-control p_input" placeholder="Type serial number wifibox" name="sn_wb" value="<?php echo $wb;?>" required/>
    </div>

    <div class="form-group">
      <label>S/N GPS</label>
      <input type="text" class="form-control p_input" placeholder="Type serial number gps" name="sn_gps" value="<?php echo $gps;?>" required/>
    </div>
    <div class="form-group">
      <label>Antenna Type</label>
      <select  class="form-control" name="antenna">
        <?php
        $search = $this->crud->search('enum', array('IdDevice' => $dev, 'type' => 'antenna'));
        $data = $search->result_array();
        foreach ($data as $value) {
          if ($value['IdEnum'] == $antenna) {
            echo "<option value=\"{$value['IdEnum']}\" selected>{$value['name']}</option>";
          } else {
            echo "<option value=\"{$value['IdEnum']}\">{$value['name']}</option>";
          }
        }
        ?>
      </select>
    </div>

    <div class="form-group">
      <label>Relay</label>
      <select  class="form-control" name="relay">
        <?php
        if ($relay == 1) {
          echo '<option value="0">No Relay</option>
                  <option value="1" selected>With Relay</option>
                  <option value="2">Relay Not RFU</option>
                  ';
        } elseif ($relay == 2) {
          echo '<option value="0">No Relay</option>
                  <option value="1">With Relay</option>
                  <option value="2" selected>Relay Not RFU</option>
                  ';
        } else {
          echo '<option value="0" selected>No Relay</option>
                  <option value="1">With Relay</option>
                  <option value="2">Relay Not RFU</option>';
        }
        ?>
      </select>
    </div>
    <div class="form-group">
      <label>Locked</label>
      <select  class="form-control" name="locked">
        <?php
        if ($locked == 1) {
          echo '<option value="0">No Locked</option>
                <option value="1" selected>Locked All Connector</option>';
        } else {
          echo '<option value="0" selected>No Locked</option>
                <option value="1">Locked All Connector</option>';
        }
        ?>
      </select>
    </div>
    <?php } ?>
    <div class="form-group">
      <label>Remark Backlog</label>
      <textarea rows="6" class="form-control" placeholder="Type remark backlog"  name="remark" required><?php echo $remark;?></textarea>
    </div>
    <div class="form-group">
      <label>Status</label>
      <input type="text" class="form-control p_input" placeholder="Type Status" name="status" required/>
    </div>
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">SUBMIT</button>
    </div>
  </form>

<?php }  elseif ($remark != '' AND $status != '') {
  $push = $this->input->post('push');
  echo $push;
  if ((date('H:i:s') >= '07:00:00') AND (date('H:i:s') <= '17:00:00')) {
    $shift = 1;
    $tproblem = '07:00:00';
    $dating = date('Y-m-d');
  } else {
    $shift = 2;
    $tproblem = '17:00:00';
    if ((date('H:i:s') >= '00:00:00') AND (date('H:i:s') <= '07:00:00')) {
      $dating = date('Y-m-d', strtotime('-1 Day'));
    } else {
      $dating = date('Y-m-d');
    }
  }
  

  if (isset($push)) {
    if ($dev == 1) {
      $this->crud->insert('reportingjob', array(
        'id_device' => $dev,
        'date' => $dating,
        'shift' => $shift,
        'id_unit' => $device,
        'bd_type' => $bd_type,
        'problem' => $problem,
        'category' => $category,
        'location' => $loc,
        'time_problem' => $tproblem,
        'wait_start' => $swait,
        'wait_end' => $ewait,
        'analysis' => $analysis,
        'case' => $case,
        'activity' => $activity,
        'start_action' => $sact,
        'end_action' => $eact,
        'bd_receiver' => $bd,
        'rfu_receiver' => $rfu,
        'pic' => $pic,
        'status' => $status,
        'remark' => $remark
      ));

      $this->crud->update('unit_detail', array(
        'sn_mojo' => $sn_mojo,
        'sn_wb' => $sn_wb,
        'sn_gps' => $sn_gps,
        'antenna' => $antenna,
        'remark' => $remark,
        'relay' => $relay,
        'locked' => $locked,
        'date_update' => date('Y-m-d'),
        'time_update' => date('H:i:s'),
        'pic_update' => $pic
      ), array(
        'cn_unit' => $device
      ));
    } else {
      $this->crud->insert('reportingjob', array(
        'id_device' => $dev,
        'date' => $dating,
        'shift' => $shift,
        'id_unit' => $device,
        'problem' => $problem,
        'category' => $category,
        'time_problem' => $tproblem,
        'activity' => $activity,
        'start_action' => $sact,
        'end_action' => $eact,
        'bd_receiver' => $bd,
        'rfu_receiver' => $rfu,
        'pic' => $pic,
        'status' => $status,
        'remark' => $remark
      ));

      $this->crud->update('unit_detail', array(
        'date_update' => date('Y-m-d'),
        'time_update' => date('H:i:s'),
        'pic_update' => $pic
      ), array(
        'cn_unit' => $device
      ));
    }

    if ($push == 'finish') {
      redirect(base_url('index.php/Auth/logout'));
    } else {
      delete_cookie("device");
      delete_cookie("loc");
      delete_cookie("swait");
      delete_cookie("ewait");
      delete_cookie("sact");
      delete_cookie("eact");
      delete_cookie("bd_type");
      delete_cookie("problem");
      delete_cookie("analysis");
      delete_cookie("case");
      delete_cookie("activity");
      delete_cookie("remark");
      delete_cookie("status");
      if ($dev == 1) {
        delete_cookie("category");
        delete_cookie("sn_mojo");
        delete_cookie("sn_wb");
        delete_cookie("sn_gps");
        delete_cookie("antenna");
      }
      redirect(base_url('index.php/report'));
    }
  }
?>
  <form method="post">
    <input type="hidden" name="push" value="restart">
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-primary btn-block enter-btn">Restart</button>
    </div>
  </form>
  <br />
  <form method="post">
    <input type="hidden" name="push" value="finish">
    <div class="text-center">
      <button type="submit" name="submit" class="btn btn-danger btn-block enter-btn">Finish</button>
    </div>
  </form>
          <?php }

echo '</div>
        <p class="existing-user text-center pt-4 mb-0"><a href="' . base_url('index.php/Auth/logout') .'" style="color: #888">Log Out</a></p><br />
      </div>
    </div>
  </div>
</div>
    </body>';
    ?>