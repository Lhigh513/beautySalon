
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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">


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
<!-------------------------------------------模版格式代码--------------------------------------------------------->

<div id="page-wrapper">
    <div class="row">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">销售图表</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                   2018年每月营业额(/元)
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="myfirstchart" style="height: 250px;"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    各产品的销售量(/次)
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="donut" style="height: 250px;"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#wrapper -->
</div>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>




<script>
    /**datatable插件**/
    $(document).ready(function() {

        $.ajax({
                type : "post",
                url : "/beautySalon/admin/chart.do",
                success:function(data){
                    var linedata=[];
                    function update() {
                        for (var i=0;i<data.monthChart.length;i++){
                            linedata.push({month:data.monthChart[i].month,value:data.monthChart[i].money})
                        }return linedata;
                    }
                    morrisLine= Morris.Line({
                        element: 'myfirstchart',
                        data:update(),
                        xkey: ['month'],
                        ykeys: ['value'],
                        labels: ['销售额']
                    });
                }
            }
        )



        $.ajax({
                type : "post",
                url : "/beautySalon/admin/productChart.do",
                success:function(data){
                    var linedata=[];
                    function update() {
                        for (var i=0;i<data.productChart.length;i++){
                            linedata.push({label:data.productChart[i].name,value:data.productChart[i].count})
                        }return linedata;
                    }


                    morrisDonut= Morris.Donut({

                        element: 'donut',

                        data:update(),


                    });
                }
            }
        )













    });


</script>

</body>

</html>




