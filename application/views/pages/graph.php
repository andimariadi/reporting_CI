        <!-- partial -->
        <div class="content-wrapper">
          <h3 class="page-heading mb-4">Report Graph <?php echo ucwords($dev);?></h3>
          <div class="row">
            <div class="card col-lg-12 px-0 mb-4">
              <div class="card-body">
                <h5 class="card-title">Graph Problem</h5>
                <form>
                  <div class="form-row align-items-center">
                    Sort By date : 
                    <div class="col-auto">
                      <select class="form-control" required>
                        <option value="all">All Day</option>
                        <?php
                        for ($i=1; $i <= 31 ; $i++) { 
                          echo '<option value="' .  $i . '">' .  $i . '</option>';
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required>
                        <option value="all">All Month</option>
                        <?php
                        for ($i=1; $i <= 12 ; $i++) { 
                          echo '<option value="' .  $i . '">' .  date('F', mktime(0, 0, 0, $i, 1, date('Y'))) . '</option>';
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <select class="form-control" required>
                        <option value="all">All Year</option>
                        <?php
                        foreach ($sql as $value) {
                          echo '<option value="' .  $value['year'] . '">' .  $value['year'] . '</option>';
                        }?>
                      </select>
                    </div>
                    <div class="col-auto">
                      <button type="button" class="btn btn-default mb-2">View Report</button>
                    </div>
                  </div>
                </form>
                <div>
                  <canvas id="myChart"></canvas>
                  <script type="text/javascript">
  function getRandomColorHex() {
    var hex = "0123456789ABCDEF",
        color = "#";
    for (var i = 1; i <= 6; i++) {
      color += hex[Math.floor(Math.random() * 16)];
    }
    return color;
  }
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Problem Graph"],
        datasets: [<?php
            foreach ($sqla as $data) {
               ?>{
            label: '<?php echo substr(trim(preg_replace('/\s\s+/', ' ', $data['problem'])), 0, 15) . '..';?>',
            data: [<?php echo $data['count'];?>],
            backgroundColor: [getRandomColorHex()],
            borderColor: "#999",
            borderWidth: 1
        },<?php }
            ?>]
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