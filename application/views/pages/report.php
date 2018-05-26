				<!-- partial -->
				<div class="content-wrapper">
					<h3 class="page-heading mb-4">Summary Report <?php echo ucwords($dev);?></h3>

					<div class="card-deck">
						
						<div class="card col-lg-12 px-0 mb-4">
							<div class="card-body">
							<?php
								if ($y != '' OR $m != '') {
									if (($level == 'administrator') or ($level == 'supervisor')) {
										$this->load->view('report/report_admin');
									} else {
										$this->load->view('report/report_user');
									}
								} else {
									echo '<p>Tahun Report</p><ul id="year" class="reporting"></ul>';
								}
								?>
							<br /><br />
							</div>
						</div>
					</div>

					
					<!-- End CardDeck -->
				</div>


<script type="text/javascript">
	$(document).ready(function() {
		<?php
		if ($y == '' OR $m == '') { ?>
		$.getJSON('<?php echo base_url('json/report/' . $devid);?>', function(jd) {
			var vPool="";
			if (jd.data == 'empty') {
				$('#year').html('Tidak ada data');
			} else {
				$.each(jd.data, function(){
					vPool += '<li id="y-' + this['year'] + '"><span onclick="GetData(\'' + this['year'] + '\', \'y-' + this['year'] + '\')" style="cursor: pointer">Tahun: ' +this['year']+ '</span><ul id="month-' + this['year'] + '"></ul></li>';
				});
				$('#year').html(vPool);
			}
		});
		<?php } ?>
	});
	
	function GetData(year,pid) {
		var vPool="";
		$.getJSON('<?php echo base_url('json/report/' . $devid);?>/' + year, function(jd) {
			$.each(jd.data, function(i, val){		
				vPool += '<li id="y-' + this['month'] + '"><a href="<?php echo base_url("dash/report/{$dev}/");?>' + year + '/' + this['month'] + '">' + this['month'] + ' - ' + this['tmonth'] + '</a></li>';
			});
			$('#month-' + year).html(vPool);
		});
	}

	function pageloc(idinput) {
		var id = $("#" + idinput).val();
		window.location.assign('<?php echo base_url("/dash/summary/{$dev}/{$y}/{$m}/");?>' + id);
	}
	
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
	        	url: "<?php echo base_url('json/ureport');?>",
	        	success: function(response) {
	        		$(editableObj).removeAttr('style');
	        		$(editableObj).attr('data-old_value',editableObj.innerText);
	        		location.reload();
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
	        	url: "<?php echo base_url('json/ureport');?>",
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
    $(document).on('click', '#delete', function() {
    	var ai = $(this).attr('data-id');
    	//alert(ai);
      	$.ajax({
      		type: "POST",
      		data:'del=' + ai,
      		url: "<?php echo base_url('json/delrep');?>",
      		success: function(response) {
      			location.reload();
      		},
      		error: function () {
      			console.log("errr");
      		}
      	})
    });
    $("#search_dump").keypress(function(e) {
            if(e.which == 13) {
                var id = $(this).val()
                if (id != '') {
                    window.location.assign('<?php echo base_url("/dash/summary/{$dev}/{$y}/{$m}/");?>' + id);
                }
            }
        });
</script>