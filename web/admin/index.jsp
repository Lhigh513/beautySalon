<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>美容院管理系统demo</title>

    <!------------------------------必要的css格式资源---------------------------------------------------------------->
    <link href="../vendor/datatables-extensions/Select/css/select.bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>



<!------------------------------------模版的格式代码------------------------------------------------------------->



<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="index.do"><i class="fa fa-dashboard fa-fw"></i> 导航页</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table fa-fw"></i> 基础数据<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./customer.do">客户信息</a>
                        </li>
                        <li>
                            <a href="./vip.do">会员客户信息</a>
                        </li>
                        <li>
                            <a href="./category.do">商品类别信息</a>
                        </li>
                        <li>
                            <a href="./product.do">产品信息</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="./chart.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>销售图表</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit fa-fw"></i>订单<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./newOrder.do">新订单</a>
                        </li>
                        <li>
                            <a href="./showPreOrder.do">未完成订单</a>
                        </li>
                        <li>
                            <a href="./showDoneOrder.do">已完成订单</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-user fa-fw"></i>用户<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="./employee.do">员工信息</a>
                        </li>
                        <li>
                            <a href="./logout.do">退出登录</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</nav>
<!------------------------------------------模版格式代码--------------------------------------------------------->

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">美容院管理系统demo</h1>
                    </div>
                    <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-edit fa-fw fa-5x"></i>
                                </div>
                                <div class="col-xs-15 text-right">
                                    <div class="huge">新建订单</div>
                                </div>
                            </div>
                        </div>
                        <a href="./order.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-send fa-5x"></i>
                                </div>
                                <div class="col-xs-15 text-right">
                                    <div class="huge">会员预约</div>
                                </div>
                            </div>
                        </div>
                        <a href="./vip.do">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bar-chart-o fa-5x"></i>
                                </div>
                                <div class="col-xs-15 text-right">
                                    <div class="huge">销售报表</div>
                                </div>
                            </div>
                        </div>
                        <a href="./chart.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-file fa-5x"></i>
                                </div>
                                <div class="col-xs-20 text-right">
                                    <div class="huge">处理订单</div>
                                </div>
                            </div>
                        </div>
                        <a href="./showPreOrder.do">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h4>已完成功能说明</h4> </div>
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <p>1.本项目是后端基于springmvc+spring+mybatis搭建的基础web应用</p>
                                <p>2.本项目前端模版是基于bootstrap-sb-admin2模版开发,项目github地址:<a href="https://github.com/BlackrockDigital/startbootstrap-sb-admin-2">https://github.com/BlackrockDigital/startbootstrap-sb-admin-2</a>
                                </p>
                                <p>3.本项目主要实现的功能模块为上面所示的四个主要模块</p>
                                <p>4.本项目利用spring mvc的拦截器功能实现登陆校验及权限控制功能</p>
                                <p>5.本项目实现的其他功能有用户授权,退出登陆等</p>

                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>





                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h4>未完成功能及不足</h4> </div>
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <p>1.本项目数据库的订单表单设计存在缺陷</p>
                                <p>2.未完成个人中心模块,因此只能在系统内部创建用户,不能修改密码</p>
                                <p>3.未实现会员会员卡积分消费功能</p>
                                <p>4.本项目报表只能显示2018年度的销售额</p>
                                <p>5.未完成成本,管理费用等模块</p>
                                <!--<p>5.本系统还有很多不足,请老师手下留情😭,本人为了此项目已经熬的快秃头了</p>-->
                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

<!--------------------------------必要的js文件--------------------------------------------------------------------------->
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../vendor/metisMenu/metisMenu.min.js"></script>
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="../vendor/datatables-extensions/Select/js/dataTables.select.min.js"></script>
<script src="../layer/src/layer.js"></script>
<script src="../dist/js/sb-admin-2.js"></script>
<script src="../vendor/jquery/jquery.form.js"></script>
<script src="../vendor/jquery/jquery.validate.min.js"></script>

</body>

</html>
