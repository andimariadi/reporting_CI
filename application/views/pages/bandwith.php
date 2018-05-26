        <!-- partial -->
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">Report Bandwith Network</h3>
          <div class="row">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                  <div class="form-row align-items-center">
                    Sort By date : 
                    <div class="col-auto">
                      <select class="form-control" required id="d_1">
                        <?php
                        for ($i=1; $i <= 31 ; $i++) { 
                          if ($start != '' || $end != '') {
                            if ($i == date('d', strtotime($start))) {
                              echo '<option value="' .  $i . '" selected>' .  $i . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  $i . '</option>';
                            }
                          } else {
                            if ($i == date('d', strtotime('-1 week'))) {
                              echo '<option value="' .  $i . '" selected>' .  $i . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  $i . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required id="m_1">
                        <?php
                        for ($i=1; $i <= 12 ; $i++) { 
                          if ($start != '' || $end != '') {
                            if ($i == date('n', strtotime($start))) {
                              echo '<option value="' .  $i . '" selected>' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            }
                          } else {
                            if ($i == date('n', strtotime('-1 week'))) {
                              echo '<option value="' .  $i . '" selected>' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required id="y_1">
                        <?php
                        foreach ($year as $value) {
                          if ($start != '' || $end != '') {
                            if ($value['year'] == date('Y', strtotime($start))) {
                              echo '<option value="' .  $value['year'] . '" selected>' .  $value['year'] . '</option>';
                            } else {
                              echo '<option value="' .  $value['year'] . '">' .  $value['year'] . '</option>';
                            }
                          } else {
                            if ($value['year'] == date('Y', strtotime('-1 week'))) {
                              echo '<option value="' .  $value['year'] . '" selected>' .  $value['year'] . '</option>';
                            } else {
                              echo '<option value="' .  $value['year'] . '">' .  $value['year'] . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <p>To Date</p>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required id="d_2">
                        <?php
                        for ($i=1; $i <= 31 ; $i++) { 
                          if ($start != '' || $end != '') {
                            if ($i == date('d', strtotime($end))) {
                              echo '<option value="' .  $i . '" selected>' .  $i . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  $i . '</option>';
                            }
                          } else {
                            if ($i == date('d')) {
                              echo '<option value="' .  $i . '" selected>' .  $i . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  $i . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required id="m_2">
                        <?php
                        for ($i=1; $i <= 12 ; $i++) { 
                          if ($start != '' || $end != '') {
                            if ($i == date('n', strtotime($end))) {
                              echo '<option value="' .  $i . '" selected>' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            }
                          } else {
                            if ($i == date('n')) {
                              echo '<option value="' .  $i . '" selected>' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            } else {
                              echo '<option value="' .  $i . '">' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required id="y_2">
                        <?php
                        foreach ($year as $value) {
                          if ($start != '' || $end != '') {
                            if ($value['year'] == date('Y', strtotime($end))) {
                              echo '<option value="' .  $value['year'] . '" selected>' .  $value['year'] . '</option>';
                            } else {
                              echo '<option value="' .  $value['year'] . '">' .  $value['year'] . '</option>';
                            }
                          } else {
                            if ($value['year'] == date('Y')) {
                              echo '<option value="' .  $value['year'] . '" selected>' .  $value['year'] . '</option>';
                            } else {
                              echo '<option value="' .  $value['year'] . '">' .  $value['year'] . '</option>';
                            }
                          }
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <button type="button" id="view" class="btn btn-default mb-2">View Report</button>
                    </div>
                    <div class="offset-md-4 col-md-1">
                      <select class="form-control" required id="unit">
                        <?php
                        foreach ($bandwith as $value) {
                          echo '<option value="' .  $value['id_unit'] . '">' .  $value['id_unit'] . '</option>';
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <button type="button" id="summary" class="btn btn-success mb-2">View Summary</button>
                    </div>
                  </div>
                <div id="chartContainer" style="height: 370px; width: 100%; margin-bottom: 50px;"></div>
                <div id="chartContainer2" style="height: 370px; width: 100%; margin-bottom: 50px;"></div>
                <div id="chartContainer3" style="height: 370px; width: 100%; margin-bottom: 50px;"></div>
                <div id="chartContainer4" style="height: 370px; width: 100%; margin-bottom: 50px;"></div>
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                      <thead>
                          <tr>
                              <th>ID Unit</th>
                              <th>Date/Time</th>
                              <th>Bandwith Receive</th>
                              <th>Bandwith Sent</th>
                              <th>SNR Rx/Tx</th>
                          </tr>
                      </thead>
                      <tbody>
                      <?php
                      foreach ($bandwith_data as $value) {
                        ?>
                          <tr>
                              <td><strong><?php echo $value['id_unit'];?></strong></td>
                              <td><?php echo $value['date'] . ' / ' . $value['time'];?></td>
                              <td><?php echo $value['receive'];?> Kbit/s</td>
                              <td><?php echo $value['sent'];?> Kbit/s</td>
                              <td><?php echo $value['snr_rx'] . ' / ' . $value['snr_tx'];?></td>
                          </tr>
                      <?php } ?>
                      </tbody>
                  </table>
                </div>
                <script type="text/javascript">
                  var options = {
                    animationEnabled: true,
                    title:{
                      text: "Received Bandwith Monitoring 06:00 WIB"   
                    },
                    axisY:{
                      title:"Received Bandwith"
                    },
                    toolTip: {
                      shared: true,
                      reversed: true
                    },
                    data: [
<?php
                    foreach ($bandwith as $data) {?>
                      {
                        type: "stackedColumn",
                        name: "<?php echo $data['id_unit'];?>",
                        showInLegend: "true",
                        yValueFormatString: "#,##0 Kbit/s",
                        dataPoints: [<?php
                          if ($start != '' || $end != '') {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '{$start}' AND '{$end}' AND HOUR(`time`) BETWEEN '05' AND '17'");
                          } else {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' AND HOUR(`time`) BETWEEN '05' AND '17'");
                          }
                          foreach ($sql as $value) {
                           echo "{ y: " . $value['receive'] . " , label: \"" . $value['date'] . "\" },";
                          }
                          ?>]
                      },
                    <?php } ?>]
                  };

                  var optionsx = {
                    animationEnabled: true,
                    title:{
                      text: "Sent Bandwith Monitoring 06:00 WIB"   
                    },
                    axisY:{
                      title:"Sent Bandwith"
                    },
                    toolTip: {
                      shared: true,
                      reversed: true
                    },
                    data: [<?php
                    foreach ($bandwith as $data) {?>
                      {
                        type: "stackedColumn",
                        name: "<?php echo $data['id_unit'];?>",
                        showInLegend: "true",
                        yValueFormatString: "#,##0 Kbit/s",
                        dataPoints: [<?php
                          if ($start != '' || $end != '') {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '{$start}' AND '{$end}' AND HOUR(`time`) BETWEEN '05' AND '17'");
                          } else {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' AND HOUR(`time`) BETWEEN '05' AND '17'");
                          }
                          foreach ($sql as $value) {
                           echo "{ y: " . $value['sent'] . " , label: \"" . $value['date'] . "\" },";
                          }
                          ?>
                        ]
                      },
                    <?php } ?>]
                  };

                  var options3 = {
                    animationEnabled: true,
                    title:{
                      text: "Received Bandwith Monitoring 18:00 WIB"   
                    },
                    axisY:{
                      title:"Received Bandwith"
                    },
                    toolTip: {
                      shared: true,
                      reversed: true
                    },
                    data: [<?php
                    foreach ($bandwith as $data) {?>
                      {
                        type: "stackedColumn",
                        name: "<?php echo $data['id_unit'];?>",
                        showInLegend: "true",
                        yValueFormatString: "#,##0 Kbit/s",
                        dataPoints: [<?php
                          if ($start != '' || $end != '') {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '{$start}' AND '{$end}' AND HOUR(`time`) BETWEEN '17' AND '23'");
                          } else {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' AND HOUR(`time`) BETWEEN '17' AND '23'");
                          }
                          foreach ($sql as $value) {
                           echo "{ y: " . $value['receive'] . " , label: \"" . $value['date'] . "\" },";
                          }
                          ?>
                        ]
                      },
                    <?php } ?>]
                  };

                  var options4 = {
                    animationEnabled: true,
                    title:{
                      text: "Sent Bandwith Monitoring 18:00 WIB"   
                    },
                    axisY:{
                      title:"Sent Bandwith"
                    },
                    toolTip: {
                      shared: true,
                      reversed: true
                    },
                    data: [<?php
                    foreach ($bandwith as $data) {?>
                      {
                        type: "stackedColumn",
                        name: "<?php echo $data['id_unit'];?>",
                        showInLegend: "true",
                        yValueFormatString: "#,##0 Kbit/s",
                        dataPoints: [<?php
                          if ($start != '' || $end != '') {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '{$start}' AND '{$end}' AND HOUR(`time`) BETWEEN '17' AND '23'");
                          } else {
                            $sql = $this->Crud->query("SELECT * FROM `bandwith` WHERE `id_unit` = '" . $data['id_unit'] . "' AND `date` BETWEEN '" . date('Y-m-d', strtotime('-1 week')) . "' AND '" . date('Y-m-d') . "' AND HOUR(`time`) BETWEEN '17' AND '23'");
                          }
                          foreach ($sql as $value) {
                           echo "{ y: " . $value['sent'] . " , label: \"" . $value['date'] . "\" },";
                          }
                          ?>
                        ]
                      },
                    <?php } ?>]
                  };

                  $("#chartContainer").CanvasJSChart(options);
                  $("#chartContainer2").CanvasJSChart(optionsx);
                  $("#chartContainer3").CanvasJSChart(options3);
                  $("#chartContainer4").CanvasJSChart(options4);
                </script>
                </div>
              </div>
            </div>
          </div>
        </div>
<script type="text/javascript">

  $(document).on("click", "#view", function() {
    var d_1 = $("#d_1").val();
    var m_1 = $("#m_1").val();
    var y_1 = $("#y_1").val();
    var d_2 = $("#d_2").val();
    var m_2 = $("#m_2").val();
    var y_2 = $("#y_2").val();
    window.location.assign('<?php echo base_url("/dash/bandwith/");?>' + y_1 + '-' + m_1 + '-' + d_1 + '/' + y_2 + '-' + m_2 + '-' + d_2);
  });
  $(document).on("click", "#summary", function() {
    var d_1 = $("#d_1").val();
    var m_1 = $("#m_1").val();
    var y_1 = $("#y_1").val();
    var d_2 = $("#d_2").val();
    var m_2 = $("#m_2").val();
    var y_2 = $("#y_2").val();
    var unit = $("#unit").val();
    window.location.assign('<?php echo base_url("/dash/bandwith/");?>' + y_1 + '-' + m_1 + '-' + d_1 + '/' + y_2 + '-' + m_2 + '-' + d_2 + '/' + unit);
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#example, #exa, #shovel').DataTable()
});
</script>