<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>@yield('title') - {{ option('site_name') }}</title>
    <link rel="shortcut icon" href="{{ assets('images/favicon.ico') }}">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- App Styles -->
    {!! bs_header('admin') !!}

    @yield('style')
</head>

<?php $user = app('users')->get(session('uid')); ?>

<body class="hold-transition {{ option('color_scheme') }} sidebar-mini">
    <div class="wrapper">

        <!-- Main Header -->
        <header class="main-header">

            <!-- Logo -->
            <a href="{{ option('site_url') }}" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"> <i class="fa fa-bookmark"></i> </span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">{{ option('site_name') }}</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        @include('vendor.language')

                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs nickname">{{ bs_nickname($user) }}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="{{ avatar($user, 128) }}" alt="User Image">
                                    <p>{{ $user->email }}</p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="{{ url('user/profile') }}" class="btn btn-default btn-flat">{{ trans('general.profile') }}</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="javascript:logout();" class="btn btn-default btn-flat">{{ trans('general.logout') }}</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">

                <!-- Sidebar user panel (optional) -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="{{ avatar($user, 45) }}" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p class="nickname">{{ bs_nickname($user) }}</p>
                        <i class="fa fa-circle text-success"></i> {{ trans('general.online') }}
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <ul class="sidebar-menu">
                    <li class="header">{{ trans('general.admin-panel') }}</li>
                    {!! bs_menu('admin') !!}

                    <li class="header">{{ trans('general.back') }}</li>
                    <li><a href="{{ url('user') }}"><i class="fa fa-user"></i> <span>{{ trans('general.user-center') }}</span></a></li>
                </ul><!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>

        @yield('content')

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- YOU CAN NOT MODIFIY THE COPYRIGHT TEXT W/O PERMISSION -->
            <div class="pull-right hidden-xs">
                {!! bs_copyright() !!}
            </div>
            <!-- Default to the left -->
            {!! bs_custom_copyright() !!}
        </footer>

    </div><!-- ./wrapper -->

    <!-- App Scripts -->
    {!! bs_footer('admin') !!}

    @if (option('check_update') == '1')
    <script>
        $(document).ready(function() {
            // check for updates
            $.getJSON("{{ url('admin/update/check') }}", function(data) {
                if (data.available == true) {
                    $('[href="{{ url('admin/update') }}"]').append('<span class="label label-primary pull-right">v'+data.latest+'</span>');
                }
            });
        });
    </script>
    @endif

    @yield('script')
</body>
</html>
