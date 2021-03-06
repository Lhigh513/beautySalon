
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
<!-------------------------------------------模版格式代码--------------------------------------------------------->

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel-body">
                <button id="btn-add" type="button" class="btn btn-info">添加商品类别</button>
                <button id="btn-edit" type="button" class="btn btn-warning">修改商品类别</button>
                <button id="btn-del" type="button" class="btn btn-danger">删除商品类别</button>
            </div>

        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        商品类别表
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="list">
                            <thead data-checkbox="true">
                            <tr>
                                <th>id</th>
                                <th>商品类别名</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach  items="${category}" var="category">
                                <tr>
                                    <td><c:out value="${category.id}"></c:out></td>
                                    <td><c:out value="${category.categoryName}"></c:out></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <!-- /.table-responsive -->

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">商品类别
                        </h4>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form">
                                    <div class="form-group">
                                        <label>id</label>
                                        <input id="id" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>商品类别名</label>
                                        <input id="categoryName"   class="form-control">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btn-submit" type="submit" class="btn btn-default">提交</button>
                        <button id="btn-reset" type="reset" class="btn btn-default">重置</button>
                        <button type="button-close" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div><!-- /.modal-content -->
            </div>
        </div><!-- /.row -->
    </div>
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
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    /**datatable插件**/
    $(document).ready(function() {
        var table=$('#list').DataTable({
            language:{
                "url":"../vendor/datatables/i18n/Chinese.json"
            },
            responsive: true,
            select: true
        })

        /**添加按钮操作**/
        $('#btn-add').click(function () {
            $("#myModal #myModalLabel").text("添加顾客");
            $('#myModal').modal({keyboard: false, show: true})
            resetForm();
        });

        /**重置输入框**/
        function resetForm(){
            $("#myModal #id").val("");
            $("#myModal #categoryName").val("");

        }

        /**修改操作**/
        $('#btn-edit').click( function () {
            var rowData =table.rows( { selected: true } ).data().toArray();
            if(rowData.length!=0){
                $("#myModal #myModalLabel").text("修改商品类别表(id不可改)");
                $('#myModal').modal({keyboard: false, show: true})
                $("#myModal #id").val(rowData[0][0]);
                $("#myModal #categoryName").val(rowData[0][1]);
            }else{
                layer.msg('请选择一行!', {time: 1000, icon:7});   //layer弹出层，1000代表1秒后关闭。7为图标编号
            }
        } );



        /**表单提交操作**/
        $('#btn-submit').click(function () {
                var rowData =table.rows( { selected: true } ).data().toArray();
                var data=new Array()
                var id = $("#myModal #id").val()
                var categoryName = $("#myModal #categoryName").val()

                data[0]=id
                data[1]=categoryName

                if(rowData.length==0){
                    $.ajax({
                        type:"post",
                        url:"/beautySalon/admin/addCategory.do",
                        contentType :"application/json",
                        data: JSON.stringify(data),
                        success:function () {
                            resetForm();
                            $("#myModal").modal('hide');
                            layer.msg("操作成功",{time:1000,icon:1})
                            window.location.reload();
                        },error:function ( ) {
                            resetForm();
                            $("#myModal").modal('hide');
                            layer.msg("操作失败",{time: 1000, icon:2})
                        }
                    })
                }
                else {
                    $.ajax({
                        type:"post",
                        url:"/beautySalon/admin/editCategory.do",
                        contentType :"application/json",
                        data: JSON.stringify(data),
                        success:function () {
                            resetForm();
                            $("#myModal").modal('hide');
                            layer.msg("操作成功",{time:1000,icon:1})
                            window.location.reload();
                        },error:function ( ) {
                            resetForm();
                            $("#myModal").modal('hide');
                            layer.msg("操作失败",{time: 1000, icon:2})
                        }
                    })

                }

            }
        )


        $('#btn-del').click(function () {
            var rowData=table.rows({selected:true}).data().toArray();
            var data=rowData[0][0].toString();
            if(rowData.length==1){
                layer.msg('确定删除该记录吗?',{time:0,btn:['确定','取消'],yes:function () {

                        $.ajax({
                            type : "post",
                            url : "/beautySalon/admin/deleteCategory.do",
                            contentType :"application/json ",
                            data:JSON.stringify(data),
                            success : function(data) {
                                layer.msg('删除成功!', {time: 1000, icon:1});
                                window.location.reload();
                            },
                            error : function() {
                                layer.msg('系统出错!', {time: 1000, icon:2});
                            }
                        });
                    }})
            }
        })

    })

</script>

</body>

</html>




