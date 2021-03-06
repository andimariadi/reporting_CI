<body>
  <div class="container-scroller">
  	<div class="container-fluid">
	  <div class="row">
	    <div class="content-wrapper full-page-wrapper d-flex align-items-center auth-pages">
	      <div class="card col-lg-4 mx-auto">
	        <div class="card-body px-5 py-5">
	        <?php 
	        	if ($this->session->flashdata('msg') != '') {
	        		echo '<div class="alert alert-danger" role="alert">' . $this->session->flashdata('msg') . '</div>';
	        	}

	        	if (date('Y-m-d') > date('Y-m-d', strtotime('2018-05-25')) AND date('Y-m-d') < date('Y-m-d', strtotime('2018-06-05'))) {
	        		echo '<div class="alert alert-info" role="alert">Demi keamanan system dan menghindari "Hacker <b>Samsudin, S.Kom</b>", encryption password kami ubah sehingga password kembali ke default (username).<br />Mohon untuk merubah password di menu "<b>Change Password</b>". Terimakasih!<br /><br />Regard, <i>Administrator</i></div>';
	        	}
	        ?>
	          <h3 class="card-title text-left mb-3">Login</h3>
	          <form method="post" action="<?php echo base_url('Auth/action');?>">
	            <div class="form-group">
	              <input type="text" class="form-control p_input" placeholder="Username" name="user" />
	            </div>
	            <div class="form-group">
	              <input type="password" class="form-control p_input" placeholder="Password" name="pass" />
	            </div>
	            <div class="text-center">
	              <button type="submit" name="login" class="btn btn-primary btn-block enter-btn">LOG IN</button>
	            </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  </div>
</body>