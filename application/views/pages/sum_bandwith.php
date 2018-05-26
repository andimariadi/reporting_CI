        <!-- partial -->
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">Report Bandwith Network</h3>
          <div class="row">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                <h3 class="card-title">Graph Bandwith</h3>
                <div id="chartContainer" style="height: 370px; width: 100%; margin-bottom: 40px"></div>
                <div id="chartContainer2" style="height: 370px; width: 100%; margin-bottom: 40px"></div>
                <h3 class="card-title">Data Bandwith</h3>
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                      <thead>
                          <tr>
                              <th>Date/Time</th>
                              <th>Bandwith Receive</th>
                              <th>Bandwith Sent</th>
                              <th>SNR Rx/Tx</th>
                          </tr>
                      </thead>
                      <tfoot>
                          <tr>
                              <th>Date/Time</th>
                              <th>Bandwith Receive</th>
                              <th>Bandwith Sent</th>
                              <th>SNR Rx/Tx</th>
                          </tr>
                      </tfoot>
                      <tbody>
                      <?php
                      foreach ($bandwith as $value) {
                        ?>
                          <tr>
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
                  window.onload = function () {

                  var options = {
                    animationEnabled: true,
                    theme: "light2",
                    title:{
                      text: "Bandwith Monitoring <?php echo $unit;?>"
                    },
                    axisX:{
                      valueFormatString: "DD MMM"
                    },
                    axisY: {
                      title: "Bandwith (Kbit/s)",
                      minimum: 30
                    },
                    toolTip:{
                      shared:true
                    },  
                    legend:{
                      cursor:"pointer",
                      verticalAlign: "bottom",
                      horizontalAlign: "left",
                      dockInsidePlotArea: true,
                      itemclick: toogleDataSeries
                    },
                    data: [{
                      type: "spline",
                      showInLegend: true,
                      name: "Received",
                      markerType: "square",
                      xValueFormatString: "HH:mm DD MMM, YYYY",
                      color: "#F08080",
                      yValueFormatString: "#,##0",
                      dataPoints: [<?php
                        foreach ($bandwith as $data) {
                          echo "{ x: new Date(" . date('Y', strtotime($data['date'])) . ", " . number_format(date('n', strtotime($data['date']))-1) . ", " . date('d', strtotime($data['date'])) . ", " . date('H', strtotime($data['time'])) . ", " . date('i', strtotime($data['time'])) . "),  y: " . $data['receive'] . " },";
                        }
                      ?>
                      ]
                    },
                    {
                      type: "spline",
                      showInLegend: true,
                      name: "Sent",
                      lineDashType: "dash",
                      yValueFormatString: "#,##0",
                      dataPoints: [<?php
                        foreach ($bandwith as $data) {
                          echo "{ x: new Date(" . date('Y', strtotime($data['date'])) . ", " . number_format(date('n', strtotime($data['date']))-1) . ", " . date('d', strtotime($data['date'])) . ", " . date('H', strtotime($data['time'])) . ", " . date('i', strtotime($data['time'])) . "),  y: " . $data['sent'] . " },";
                        }
                      ?>
                      ]
                    }]
                  };

                  var snr = {
                    animationEnabled: true,
                    theme: "light2",
                    title:{
                      text: "SNR Monitoring <?php echo $unit;?>"
                    },
                    axisX:{
                      valueFormatString: "DD MMM"
                    },
                    axisY: {
                      title: "SNR Rx/Tx",
                      minimum: 0
                    },
                    toolTip:{
                      shared:true
                    },  
                    legend:{
                      cursor:"pointer",
                      verticalAlign: "bottom",
                      horizontalAlign: "left",
                      dockInsidePlotArea: true,
                      itemclick: toogleDataSeries
                    },
                    data: [{
                      type: "spline",
                      showInLegend: true,
                      name: "SNR Rx",
                      markerType: "square",
                      xValueFormatString: "HH:mm DD MMM, YYYY",
                      color: "#80a2f0",
                      yValueFormatString: "#,##0",
                      dataPoints: [<?php
                        foreach ($bandwith as $data) {
                          echo "{ x: new Date(" . date('Y', strtotime($data['date'])) . ", " . number_format(date('n', strtotime($data['date']))-1) . ", " . date('d', strtotime($data['date'])) . ", " . date('H', strtotime($data['time'])) . ", " . date('i', strtotime($data['time'])) . "),  y: " . $data['snr_rx'] . " },";
                        }
                      ?>
                      ]
                    },
                    {
                      type: "spline",
                      showInLegend: true,
                      name: "SNR Tx",
                      color: "#ffccd1",
                      lineDashType: "dash",
                      yValueFormatString: "#,##0",
                      dataPoints: [<?php
                        foreach ($bandwith as $data) {
                          echo "{ x: new Date(" . date('Y', strtotime($data['date'])) . ", " . number_format(date('n', strtotime($data['date']))-1) . ", " . date('d', strtotime($data['date'])) . ", " . date('H', strtotime($data['time'])) . ", " . date('i', strtotime($data['time'])) . "),  y: " . $data['snr_tx'] . " },";
                        }
                      ?>
                      ]
                    }]
                  };
                  $("#chartContainer").CanvasJSChart(options);
                  $("#chartContainer2").CanvasJSChart(snr);

                  function toogleDataSeries(e){
                    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                      e.dataSeries.visible = false;
                    } else{
                      e.dataSeries.visible = true;
                    }
                    e.chart.render();
                  }

                  }
                </script>
                <script type="text/javascript">
                  $(document).ready(function() {
                    $('#example, #exa, #shovel').DataTable()
                  });
                </script>
                </div>
              </div>
            </div>
          </div>
        </div>