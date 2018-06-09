
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
                <button id="btn-add" type="button" class="btn btn-info">添加会员信息</button>
                <button id="btn-edit" type="button" class="btn btn-warning">修改会员信息</button>
                <button id="btn-del" type="button" class="btn btn-danger">删除会员信息</button>
                <button id="btn-book" type="button" class="btn btn-success">会员预约服务</button>
            </div>

        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        会员顾客信息表
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="list">
                            <thead data-checkbox="true">
                            <tr>
                                <th>id</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>联系方式</th>
                                <th>第二联系人姓名</th>
                                <th>第二联系人电话</th>
                                <th>注册日期</th>
                                <th>积分等级</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach  items="${vip}" var="vip">
                                <tr>
                                    <td><c:out value="${vip.id}"></c:out></td>
                                    <td><c:out value="${vip.name}"></c:out></td>
                                    <td><c:out value="${vip.gender}"></c:out></td>
                                    <td><c:out value="${vip.phone}"></c:out></td>
                                    <td><c:out value="${vip.name2}"></c:out></td>
                                    <td><c:out value="${vip.phone2}"></c:out></td>
                                    <td><c:out value="${vip.regdate}"></c:out></td>
                                    <td><c:out value="${vip.level}"></c:out></td>
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
                        <h4 class="modal-title" id="myModalLabel">顾客
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
                                        <label>姓名</label>
                                        <input id="name"   class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>性别</label>
                                        <input id="gender"   class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>联系方式</label>
                                        <input id="phone"   class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>第二联系人姓名</label>
                                        <input id="name2"   class="form-control" ></input>
                                    </div>
                                    <div class="form-group">
                                        <label>第二联系人电话</label>
                                        <input id="phone2"   class="form-control" ></input>
                                    </div>
                                    <div class="form-group">
                                        <label>注册日期</label>
                                        <input id="regdate"   class="form-control" ></input>
                                    </div>
                                    <div class="form-group">
                                        <label>积分等级</label>
                                        <input id="level"   class="form-control" ></input>
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

        /**修改操作**/
        $('#btn-edit').click( function () {
            var rowData =table.rows( { selected: true } ).data().toArray();
            if(rowData.length!=0){
                $("#myModal #myModalLabel").text("修改顾客(id不可改)");
                $('#myModal').modal({keyboard: false, show: true})
                $("#myModal #id").val(rowData[0][0]);
                $("#myModal #name").val(rowData[0][1]);
                $("#myModal #gender").val(rowData[0][2]);
                $("#myModal #phone").val(rowData[0][3]);
                $("#myModal #name2").val(rowData[0][4]);
                $("#myModal #phone2").val(rowData[0][5]);
                $("#myModal #regdate").val(rowData[0][6]);
                $("#myModal #level").val(rowData[0][7]);
            }else{
                layer.msg('请选择一行!', {time: 1000, icon:7});   //layer弹出层，1000代表1秒后关闭。7为图标编号
            }
        } );

        /**重置输入框**/
        function resetForm(){
            $("#myModal #id").val("");
            $("#myModal #name").val("");
            $("#myModal #gender").val("");
            $("#myModal #phone").val("");
            $("#myModal #name2").val("");
            $("#myModal #phone2").val("");
            $("#myModal #regdate").val("");
            $("#myModal #level").val("");

        }

        /**添加按钮操作**/
        $('#btn-add').click(function () {
            $("#myModal #myModalLabel").text("添加会员顾客");
            $('#myModal').modal({keyboard: false, show: true})
            resetForm();
        });

        /**预约操作**/
        $('#btn-book').click(function () {
            var rowData=table.rows({selected:true}).data().toArray();
            var data=new Array();
            data[0]=rowData[0][0].toString();
            data[1]=rowData[0][1].toString();
            data[2]=rowData[0][7].toString();
            data[3]=rowData[0][3].toString();

            if(rowData.length==1){
                {
                        $.ajax({
                            type : "post",
                            url : "/beautySalon/admin/VipOrder.do",
                            contentType :"application/json ",
                            data:JSON.stringify(data),
                            success : function() {
                                layer.msg('操作成功!', {time: 1000, icon:1});
                                window.location.href="./showvipOrder.do";
                            },
                            error : function() {
                                layer.msg('系统出错!', {time: 1000, icon:2});
                            }
                        });
                    }
            }
        })

        /**表单提交操作**/
        $('#btn-submit').click(function () {
                var rowData =table.rows( { selected: true } ).data().toArray();
                var data=new Array()
                var id = $("#myModal #id").val()
                var name = $("#myModal #name").val()
                var gender = $("#myModal #gender").val()
                var phone = $("#myModal #phone").val()
                var name2 = $("#myModal #name2").val()
                var phone2=$("#myModal #phone2").val()
                var regdate=$("#myModal #regdate").val()
                var level=$("#myModal #level").val()
                data[0]=id
                data[1]=name
                data[2]=gender
                data[3]=phone
                data[4]=name2
                data[5]=phone2
                data[6]=regdate
                data[7]=level
                if(rowData.length==0){
                    $.ajax({
                        type:"post",
                        url:"/beautySalon/admin/addVip.do",
                        contentType :"application/json",
                        data: JSON.stringify(data),
                        success:function ( ) {
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
                        url:"/beautySalon/admin/editVip.do",
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
                                url : "/beautySalon/admin/deleteVip.do",
                                contentType :"application/json ",
                                data:JSON.stringify(data),
                                success : function() {
                                    layer.msg('删除成功!', {time: 1000, icon:1});
                                    window.location.reload();
                                },
                                error : function() {
                                    layer.msg('系统出错!', {time: 1000, icon:2});
                                }
                            });
                        }})
                }
            }

        )

    });


</script>

</body>

</html>




