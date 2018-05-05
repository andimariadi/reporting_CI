    <!-- partial:partials/_navbar.html -->
    <nav class="navbar navbar-default col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="navbar-menu-wrapper d-flex align-items-center">
        <button class="navbar-toggler navbar-toggler d-none d-lg-block navbar-dark align-self-center mr-3" id="nganu_btn" type="button" data-toggle="minimize">
          <span class="navbar-toggler-icon"></span>
        </button>
        <form class="form-inline mt-2 mt-md-0 d-none d-lg-block">
          <input class="form-control mr-sm-2 search" type="text" placeholder="Search">
        </form>
        <button class="navbar-toggler navbar-dark navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="navbar-nav ml-lg-auto d-flex align-items-center flex-row">
          <li class="nav-item">
            <a class="nav-link profile-pic" href="#"><img class="rounded-circle" src="<?php echo base_url('___/images/face.jpg');?>" alt="" /></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"><i class="fa fa-th"></i></a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- partial -->
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-right">
        <!-- partial:partials/_sidebar.html -->
        <nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
          <div class="user-info">
            <img src="<?php echo base_url('___/images/face.jpg');?>" alt="" />
            <p class="name">Awanda Rudy Prasetiyo</p>
            <p class="designation">Logged is <b><?php echo ucwords($username);?></b></p>
            <span class="online"></span>
          </div>
          <ul class="nav">
            <li class="nav-item active">
              <a class="nav-link" href="<?php echo base_url('dash/home');?>">
                <img src="<?php echo base_url('___/images/icons/1.png');?>" alt="" />
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <?php if ($level == 'supervisor') { ?>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo base_url('dash/users');?>">
                <img src="<?php echo base_url('___/images/icons/007-star.png');?>" alt="" />
                <span class="menu-title">Users</span>
              </a>
            </li>
            <?php }
            if ($level == 'administrator') { ?>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#problem" aria-expanded="false" aria-controls="sample-pages">
                <img src="<?php echo base_url('___/images/icons/005-forms.png');?>" alt="" />
                <span class="menu-title">Case Details <i class="fa fa-sort-down"></i></span>
              </a>
              <div class="collapse" id="problem">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/activity');?>">
                      Activity
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/analysis');?>">
                      Analysis
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/category');?>">
                      Category
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/cases');?>">
                      Case
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/problem');?>">
                      Problem
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <?php } ?>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#device" aria-expanded="false" aria-controls="sample-pages">
                <img src="<?php echo base_url('___/images/icons/4.png');?>" alt="" />
                <span class="menu-title">Device Units <i class="fa fa-sort-down"></i></span>
              </a>
              <div class="collapse" id="device">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/jigsaw_units');?>">
                      Detail Units Jigsaw
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/network_units');?>">
                      Detail Units Network
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <?php if ($level == 'administrator') { ?>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo base_url('dash/enum');?>">
                <img src="<?php echo base_url('___/images/icons/008-list.png');?>" alt="" />
                <span class="menu-title">Enums Tables</span>
              </a>
            </li>
            <?php } ?>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#monitoring" aria-expanded="false" aria-controls="sample-pages">
                <img src="<?php echo base_url('___/images/icons/009-layout.png');?>" alt="" />
                <span class="menu-title">Report Monitoring <i class="fa fa-sort-down"></i></span>
              </a>
              <div class="collapse" id="monitoring">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/report/jigsaw');?>">
                      Report Jigsaw
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/report/network');?>">
                      Report Network
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#grafich" aria-expanded="false" aria-controls="sample-pages">
                <img src="<?php echo base_url('___/images/icons/6.png');?>" alt="" />
                <span class="menu-title">Report Graph <i class="fa fa-sort-down"></i></span>
              </a>
              <div class="collapse" id="grafich">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/graph&jigsaw');?>">
                      Graph Jigsaw
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('dash/graph&network');?>">
                      Report Network
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo base_url('dash/password');?>">
                <img src="<?php echo base_url('___/images/icons/020-locked.png');?>" alt="" />
                <span class="menu-title">Change Password</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo base_url('Auth/logout');?>">
                <img src="<?php echo base_url('___/images/icons/exclamation-mark.png');?>" alt="" />
                <span class="menu-title">Logout</span>
              </a>
            </li>
          </ul>
        </nav>