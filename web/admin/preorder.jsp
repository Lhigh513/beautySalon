
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
        <div class="col-lg-12">

            <div class="panel-body">
                <button id="btn-done" type="button" class="btn btn-info">完成订单并确认支付</button>
                <button id="btn-del" type="button" class="btn btn-danger">删除未完成订单</button>
            </div>

        </div>
        <!-- /.row -->


        <!--页面的代码-->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        未完成订单
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="list">
                            <thead data-checkbox="true">
                            <tr>
                                <th>id</th>
                                <th>输入日期</th>
                                <th>服务技师</th>
                                <th>服务项目</th>
                                <th>单项服务应收金额</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach  items="${preOrder}" var="preOrder">
                                <tr>
                                    <td><c:out value="${preOrder.id}"></c:out></td>
                                    <td><c:out value="${preOrder.date}"></c:out></td>
                                    <td><c:out value="${preOrder.name}"></c:out></td>
                                    <td><c:out value="${preOrder.productName}"></c:out></td>
                                    <td><c:out value="${preOrder.money}"></c:out></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        未完成订单组应付金额
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="list1">
                            <thead data-checkbox="true">
                            <tr>
                                <th>订单组首个编号</th>
                                <th>订单组总金额</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach  items="${tempMoney}" var="tempMoney">
                                <tr>
                                    <td><c:out value=" ${tempMoney.id}"></c:out></td>
                                    <td><c:out value=" ${tempMoney.money}"></c:out></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                         未完成的会员预约
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="list2">
                            <thead data-checkbox="true">
                            <tr>
                                <th>订单组首个编号</th>
                                <th>会员ID</th>
                                <th>会员姓名</th>
                                <th>会员联系方式</th>
                                <th>预约时间</th>
                                <th>订单组总金额</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach  items="${vipOrder}" var="vipOrder">
                                <tr>
                                    <td><c:out value="${vipOrder.orderId}"></c:out></td>
                                    <td><c:out value="${vipOrder.vipId} "></c:out></td>
                                    <td><c:out value="${vipOrder.name}"></c:out></td>
                                    <td><c:out value="${vipOrder.phone}"></c:out></td>
                                    <td><c:out value="${vipOrder.time}"></c:out></td>
                                    <td><c:out value="${vipOrder.money}"></c:out></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="myfirstchart" style="height: 250px;"></div>


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
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>



    <!-- 当前页面的js代码 -->
    <script>


        /**datatable插件**/
        $(document).ready(function() {
            var table = $('#list').DataTable({
                language: {
                    "url": "../vendor/datatables/i18n/Chinese.json"
                },
                responsive: true,
                select: true
            })

            var table1=$('#list1').DataTable({
                language: {
                    "url": "../vendor/datatables/i18n/Chinese.json"
                },
                responsive: true,

            })


            var table2=$('#list2').DataTable({
                language: {
                    "url": "../vendor/datatables/i18n/Chinese.json"
                },
                responsive: true,

            })





            $('#btn-done').click(function () {
                var rowData=table.rows({selected:true}).data().toArray();
                var data=rowData[0][0].toString();
                if(rowData.length==1){
                    layer.msg('确定支付吗?',{time:0,btn:['确定','取消'],yes:function () {

                            $.ajax({
                                type : "post",
                                url : "/beautySalon/admin/changeStatus.do",
                                contentType :"application/json ",
                                data:JSON.stringify(data),
                                success : function() {
                                    layer.msg('操作成功!', {time: 1000, icon:1});
                                    window.location.reload();

                                },
                                error : function() {
                                    layer.msg('系统出错!', {time: 1000, icon:2});
                                }
                            });
                        }})
            }})



            /**重置输入框**/


            /**修改操作**/


            /**更新产品的表单提交操作**/

            /**添加产品的表单提交操作**/


            /**删除按钮删除**/

            $('#btn-del').click(function () {
                var rowData=table.rows({selected:true}).data().toArray();
                var data=rowData[0][0].toString();
                if(rowData.length==1){
                    layer.msg('确定删除该订单吗?',{time:0,btn:['确定','取消'],yes:function () {

                            $.ajax({
                                type : "post",
                                url : "/beautySalon/admin/deletePreOrder.do",
                                contentType :"application/json ",
                                data:JSON.stringify(data),
                                success : function() {
                                    layer.msg('操作成功!', {time: 1000, icon:1});
                                    window.location.reload();

                                },
                                error : function() {
                                    layer.msg('系统出错!', {time: 1000, icon:2});
                                }
                            });
                        }})
                }})

        })



    </script>

        <!--
        <script>

            new Morris.Line({
                // ID of the element in which to draw the chart.
                element: 'myfirstchart',
                // Chart data records -- each entry in this array corresponds to a point on
                // the chart.
                data: [
                    { year: '2008', value: 20 },
                    { year: '2009', value: 10 },
                    { year: '2010', value: 5 },
                    { year: '2011', value: 5 },
                    { year: '2012', value: 20 }
                ],
                // The name of the data record attribute that contains x-values.
                xkey: 'year',
                // A list of names of data record attributes that contain y-values.
                ykeys: ['value'],
                // Labels for the ykeys -- will be displayed when you hover over the
                // chart.
                labels: ['Value']
            });
        </script>-->
</body>

</html>




