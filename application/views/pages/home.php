        <!-- partial -->
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">Dashboard</h3>
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-danger">
                        <i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Jigsaw Monthly Problem</p>
                      <h4 class="bold-text"><?php echo $count_jigsaw_monthly;?></h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-exclamation-circle mr-1" aria-hidden="true"></i> 
                    <?php
                    $count = $percent_jigsaw_monthly;
                    if ($count <= 10) {
                    	echo "$count% very good!";
                    } elseif($count <= 50) {
                    	echo "$count% good!";
                    } elseif($count <= 80) {
                    	echo "$count% bad!";
                    } else {
                    	echo "$count% very bad!";
                    }
                    ?>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-warning">
                        <i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Network Monthly Problem</p>
                      <h4 class="bold-text"><?php echo $count_network_monthly;?></h4>
                                          </div>
                                        </div>
                                        <p class="text-muted">
                                          <i class="fa fa-exclamation-circle mr-1" aria-hidden="true"></i> 
                                          <?php
                                          $count = $percent_network_monthly;
                                          if ($count <= 10) {
                                            echo "$count% very good!";
                                          } elseif($count <= 50) {
                                            echo "$count% good!";
                                          } elseif($count <= 80) {
                                            echo "$count% bad!";
                                          } else {
                                            echo "$count% very bad!";
                                          }
                                          ?>
                                        </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-success">
                        <i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">Average Problem Monthly</p>
                      <h4 class="bold-text"><?php echo $percent_average_monthly . ' %'; ?></h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-calendar mr-1" aria-hidden="true"></i> Data Problem Monthly
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 mb-4">
              <div class="card card-statistics">
                <div class="card-body">
                  <div class="clearfix">
                    <div class="float-left">
                      <h4 class="text-info">
                        <i class="fa fa-bar-chart-o highlight-icon" aria-hidden="true"></i>
                      </h4>
                    </div>
                    <div class="float-right">
                      <p class="card-text text-dark">All Problem</p>
                      <h4 class="bold-text">
                        <?php echo $all_problem;?>
                      </h4>
                    </div>
                  </div>
                  <p class="text-muted">
                    <i class="fa fa-repeat mr-1" aria-hidden="true"></i> Now Updated
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Relay Jigsaw Statistik</h5>
                  <div class="row">
                    <div class="col-12">
                      <div class="custom-legend-container w-75 mx-auto">
                    <canvas id="ChartRelay" height="150"></canvas>
                  </div>
                  <script type="text/javascript">
                  var ctx = document.getElementById("ChartRelay").getContext('2d');
                  var myChart = new Chart(ctx, {
                      type: 'horizontalBar',
                      data: {
                        labels: [
                        <?php
                        foreach ($relay as $data) {
                          if ($data['relay'] == 1) {
                            $name = 'Relay RFU';
                          } elseif ($data['relay'] == 2) {
                            $name = 'Relay not RFU';
                          } else {
                            $name = 'No Relay';
                          }
                          echo '"' . substr(trim(preg_replace('/\s\s+/', ' ', $name)), 0, 15) . '..", ';
                        }
                        ?>],
                          datasets: [{
                              label: 'Votes',
                              data: [
                              <?php
                              foreach ($relay as $data) {
                                echo ''. $data['count'] . ', ';
                              }
                              ?>
                              ],
                              backgroundColor: [<?php
                                echo "'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',";
                                ?>
                              ],
                              borderColor: [<?php
                                    echo "'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',";
                                ?>
                              ],
                              borderWidth: 1
                          }]
                      },
                      options: {
                          scales: {
                              yAxes: [{
                                  ticks: {
                                      beginAtZero:true
                                  }
                              }]
                          }
                      }
                  });
                  </script>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Statistik Locked Connector</h5>
                  <div class="row">
                    <div class="col-12">
                      <div class="custom-legend-container w-75 mx-auto">
                    <canvas id="ChartLocked" height="150"></canvas>
                  </div>
                  <script type="text/javascript">
                  var ctx = document.getElementById("ChartLocked").getContext('2d');
                  var myChart = new Chart(ctx, {
                      type: 'horizontalBar',
                      data: {
                        labels: [
                        <?php
                        foreach ($locked as $data) {
                          if ($data['locked'] == 1) {
                            $name = 'Locked All Connector';
                          } else {
                            $name = 'No Locked';
                          }
                          echo '"' . substr(trim(preg_replace('/\s\s+/', ' ', $name)), 0, 15) . '..", ';
                        }
                        ?>],
                          datasets: [{
                              label: 'Votes',
                              data: [
                              <?php
                              foreach ($locked as $data) {
                                echo ''. $data['count'] . ', ';
                              }
                              ?>
                              ],
                              backgroundColor: [<?php
                                echo "'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',";
                                ?>
                              ],
                              borderColor: [<?php
                                    echo "'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',";
                                ?>
                              ],
                              borderWidth: 1
                          }]
                      },
                      options: {
                          scales: {
                              yAxes: [{
                                  ticks: {
                                      beginAtZero:true
                                  }
                              }]
                          }
                      }
                  });
                  </script>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Statistik Problem Jigsaw</h5>
                  <div class="row">
                    <div class="col-12">
                      <?php

                      foreach ($statistik_problem_jigsaw as $value) {
                        $no++;
                        if ($no == 1) { $class = 'bg-danger';}
                        elseif($no == 2) { $class = 'bg-warning';}
                        elseif($no == 3) { $class = 'bg-primary';}
                        elseif($no == 4) { $class = 'bg-info';}
                        else { $class = 'bg-success';}
                        echo '<div class="mb-4">';
                          echo '<p class="card-text text-muted mb-2">' . $value['problem'] . '</p>';
                          echo '<div class="progress progress-slim">';
                            echo '<div class="progress-bar ' . $class . '" role="progressbar" style="width: ' . number_format(($value['count']/$count_stastistik_jigsaw)*100, 2). '%" aria-valuenow="' . number_format($value['count']/$count_stastistik_jigsaw). '" aria-valuemin="0" aria-valuemax="100"></div>';
                          echo '</div>';
                        echo '</div>';
                      }
                      ?>
                    </div>
                    <div class="col-12">
                      <p class="text-muted mb-0">
                        Note: Statistik get from all reporting technician
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Statistik Problem Network</h5>
                  <div class="row">
                    <div class="col-12">
                      <?php
                      $no = 0;
                      foreach ($statistik_problem_network as $value) {
                        $no++;
                        if ($no == 1) { $class = 'bg-danger';}
                        elseif($no == 2) { $class = 'bg-warning';}
                        elseif($no == 3) { $class = 'bg-primary';}
                        elseif($no == 4) { $class = 'bg-info';}
                        else { $class = 'bg-success';}
                        echo '<div class="mb-4">';
                          echo '<p class="card-text text-muted mb-2">' . $value['problem'] . '</p>';
                          echo '<div class="progress progress-slim">';
                            echo '<div class="progress-bar ' . $class . '" role="progressbar" style="width: ' . number_format(($value['count']/$count_stastistik_network)*100, 2). '%" aria-valuenow="' . number_format($value['count']/$count_stastistik_network). '" aria-valuemin="0" aria-valuemax="100"></div>';
                          echo '</div>';
                        echo '</div>';
                      }
                      ?>
                    </div>
                    <div class="col-12">
                      <p class="text-muted mb-0">
                        Note: Statistik get from all reporting technician
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Monthly Problem Jigsaw</h5>
                  <div class="custom-legend-container w-75 mx-auto">
                    <canvas id="myChart" width="400" height="400"></canvas>
                  </div>
<script type="text/javascript">
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: [
      <?php
      $jumlah = count($data_monthly_jigsaw);
      foreach ($data_monthly_jigsaw as $data) {
        echo '"' . substr(trim(preg_replace('/\s\s+/', ' ', $data['problem'])), 0, 15) . '..", ';
      }
      ?>],
        datasets: [{
            label: 'Votes',
            data: [
            <?php
            foreach ($data_monthly_jigsaw as $data) {
              echo ''. $data['count'] . ', ';
            }
            ?>
            ],
            backgroundColor: [<?php
              for ($i=0; $i <= $jumlah; $i+=6) { 
                  echo "'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)',";
              }?>
            ],
            borderColor: [<?php
              for ($i=0; $i <= $jumlah; $i+=6) { 
                  echo "'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)',";
              }?>
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
                </div>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Monthly Problem Network
                  </h5>
                  <div class="custom-legend-container w-75 mx-auto">
                    <canvas id="myChart1" width="400" height="400"></canvas>
                  </div>
<script type="text/javascript">
var ctx = document.getElementById("myChart1").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
      labels: [
      <?php
      $jumlah = count($data_monthly_network);
      foreach ($data_monthly_network as $data) {
        echo '"' . substr(trim(preg_replace('/\s\s+/', ' ', $data['problem'])), 0, 15) . '..", ';
      }
      ?>],
        datasets: [{
            label: 'Votes',
            data: [
            <?php
            foreach ($data_monthly_network as $data) {
              echo ''. $data['count'] . ', ';
            }
            ?>
            ],
            backgroundColor: [<?php
              for ($i=0; $i <= $jumlah; $i+=6) { 
                  echo "'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)',";
              }?>
            ],
            borderColor: [<?php
              for ($i=0; $i <= $jumlah; $i+=6) { 
                  echo "'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)',";
              }?>
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Unit Population</h5>
                  <div class="table-responsive table-sales">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>
                            Name
                          </th>
                          <th class="text-right">
                            Count
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        foreach ($unit_population as $data) { ?>
                          <tr>
                          <td><?php echo $data['name'];?></td>
                          <td class="text-right">
                            <?php echo $data['count'];?>
                          </td>
                        </tr>
                          <?php
                        } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Unit Installed</h5>
                  <div class="table-responsive table-sales">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>
                            Name
                          </th>
                          <th class="text-right">
                            Count
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        foreach ($unit_population_installed as $data) { ?>
                          <tr>
                          <td><?php echo $data['type'];?></td>
                          <td class="text-right">
                            <?php echo $data['count'];?>
                          </td>
                        </tr>
                          <?php
                        } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Weekly Problem Jigsaw</h5>
                  <div class="table-responsive table-sales">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>
                            Name
                          </th>
                          <th class="text-right">
                            Count
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        if (count($weekly_problem_jigsaw) > 0) {
                          foreach ($weekly_problem_jigsaw as $data) { ?>
                          <tr>
                          <td><?php echo $data['problem'];?></td>
                          <td class="text-right">
                            <?php echo $data['count'];?>
                          </td>
                        </tr>
                          <?php
                          }
                        } else {
                          echo '<tr><td colspan="2">No Problem on the week</td></tr>';
                        } ?>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-3 mb-4">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Weekly Problem Network</h5>
                  <div class="table-responsive table-sales">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>
                            Name
                          </th>
                          <th class="text-right">
                            Count
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        if (count($weekly_problem_network) > 0) {
                          foreach ($weekly_problem_network as $data) { ?>
                          <tr>
                          <td><?php echo $data['problem'];?></td>
                          <td class="text-right">
                            <?php echo $data['count'];?>
                          </td>
                        </tr>
                          <?php
                          }
                        } else {
                          echo '<tr><td colspan="2">No Problem on the week</td></tr>';
                        } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card-deck">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                <h5 class="card-title">Last Billings Jigsaw</h5>
                <div class="table-responsive" style="overflow-x: scroll;">
                  <table class="table center-aligned-table">
                    <thead>
                      <tr class="text-primary">
                        <th>Date</th>
                        <th>ID Unit</th>
                        <th>Problem</th>
                        <th>Activity</th>
                        <th>Start Action</th>
                        <th>End Action</th>
                        <th>PIC</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      foreach ($last_jigsaw as $data) {
                        echo '<tr class="">';
                          echo '<td>' . date('d-m-Y', strtotime($data['date'])) . '</td>';
                          echo '<td>' . $data['id_unit'] . '</td>';
                          echo '<td>' . $data['problem'] . '</td>';
                          echo '<td>' . $data['activity'] . '</td>';
                          echo '<td>' . $data['start_action'] . '</td>';
                          echo '<td>' . $data['end_action'] . '</td>';
                          echo '<td>' . $data['pic'] . '</td>';
                          echo '<td><a href="' . base_url('dash/report/' . strtolower($data['name_device']) . '/' . date('Y', strtotime($data['date'])) . '/' . date('m', strtotime($data['date'])) ) . '" class="btn btn-outline-success btn-sm">View Report</a></td>';
                        echo '</tr>';
                      }?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="card-deck">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                <h5 class="card-title">Last Billings Network</h5>
                <div class="table-responsive" style="overflow-x: scroll;">
                  <table class="table center-aligned-table">
                    <thead>
                      <tr class="text-primary">
                        <th>Date</th>
                        <th>ID Unit</th>
                        <th>Problem</th>
                        <th>Activity</th>
                        <th>Start Action</th>
                        <th>End Action</th>
                        <th>PIC</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      foreach ($last_network as $data) {
                        echo '<tr class="">';
                          echo '<td>' . date('d-m-Y', strtotime($data['date'])) . '</td>';
                          echo '<td>' . $data['id_unit'] . '</td>';
                          echo '<td>' . $data['problem'] . '</td>';
                          echo '<td>' . $data['activity'] . '</td>';
                          echo '<td>' . $data['start_action'] . '</td>';
                          echo '<td>' . $data['end_action'] . '</td>';
                          echo '<td>' . $data['pic'] . '</td>';
                          echo '<td><a href="' . base_url('dash/report/' . strtolower($data['name_device']) . '/' . date('Y', strtotime($data['date'])) . '/' . date('m', strtotime($data['date'])) ) . '" class="btn btn-outline-success btn-sm">View Report</a></td>';
                        echo '</tr>';
                      }?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>