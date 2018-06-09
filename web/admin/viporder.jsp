<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
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

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">新建订单</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <form   action="./getVipOrder.do" id="form">
                                    <div class="form-group">
                                        <label>订单id</label>
                                        <input id="orderId" class="form-control" value="${orderId}"   name="orderId" >
                                        <p class="help-block">订单id自动生成,会员级别越高,id越小,不建议修改</p>
                                    </div>
                                    <div class="form-group">
                                        <label>会员id</label>
                                        <input id="vipId" class="form-control" value="${vipId}"   name="vipId" >

                                    </div>
                                    <div class="form-group">
                                        <label>会员姓名</label>
                                        <input id="vipName" class="form-control" value="${vipName}"   name="vipName" >

                                    </div>
                                    <div class="form-group">
                                        <label>会员电话</label>
                                        <input id="vipPhone" class="form-control" value="${vipPhone}"   name="vipPhone" >

                                    </div>
                                    <div class="form-group">
                                        <label>输入日期</label>
                                        <input class="form-control" placeholder="请输入订单日期" id="date" name="date">
                                        <p class="help-block">建议格式:YYYY-MM-DD HH:MM</p>
                                    </div>

                                    <div class="form-group">
                                        <label>服务技师</label>
                                        <select class="form-control" id="employee" name="employee">
                                            <c:forEach  items="${employeeName}" var="employeeName">
                                                <option class="form-control"><c:out value="${employeeName}"></c:out></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>服务项目</label>
                                        <select multiple="true" class="form-control"  id="productList" name="productList">
                                            <c:forEach  items="${productName}" var="productName">
                                                <option class="form-control" ><c:out value="${productName}"></c:out></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <p class="help-block" >若选择多项服务项目将会生成以该订单id为始,数目为所选项目的数目的id递增订单组</p>
                                    <button type="submit" class="btn btn-default" id="btn-submit">
                                        生成订单&订单组
                                    </button>
                                </form>
                            </div>
                            <!-- /.col-lg-6 (nested) -->

                        </div>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->


    <!-- /#wrapper -->

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
    <script>
        /**
         $("#btn-submit").click(function () {

            var data=[1,2,3]

            $.post({
                url:"/beautySalon/admin/getOrder.do",
                data:JSON.stringify(data),
                contentType:"application/json"
            })


        })**/


    </script>

    </body>


</html>
