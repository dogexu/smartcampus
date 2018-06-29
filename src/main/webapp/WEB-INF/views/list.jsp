<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>商品列表页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script>

        $(document).ready( function () {
            $('#goods').DataTable({
                    "aLengthMenu":false,
                    "searching":false,//禁用搜索（搜索框）
                    "paging":false,
                    "info":false
                }
            );
        } );
    </script>
    <style type="text/css">
        table{
            word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
        <%--table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */--%>
        }
        <%--/*td{*/--%>
        <%--/*width:100%;*/--%>
        <%--/*word-break:keep-all;!* 不换行 *!*/--%>
        <%--/*white-space:nowrap;!* 不换行 *!*/--%>
        <%--/*overflow:hidden;!* 内容超出宽度时隐藏超出部分的内容 *!*/--%>
        <%--/*text-overflow:ellipsis;!* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*!*/--%>
        <%--/*}*/--%>
    </style>

</head>
<body>
<!-- 导航栏 -->
<%@ include file="./include/header.jsp"%>
<br/>
<div class="container">
    <div class="table-responsive">
        <table class="table" id="goods">
            <thead>
            <tr>
                <th style="text-align: center;">商品编号</th>
                <th style="text-align: center;">商品名称</th>
                <th style="text-align: center;">商品价格</th>
                <th style="text-align: center;">客户来源</th>
                <th style="text-align: center;">条形码</th>
                <%--<th style="text-align: center;">商品图片</th>--%>
                <%--<th style="text-align: center;">商品缩略图</th>--%>
                <%--<th style="text-align: center;">商品描述</th>--%>
                <%--<th style="text-align: center;">商品详情</th>--%>
                <%--<th style="text-align: center;">商品状态</th>--%>
                <%--<th style="text-align: center;">商家表ID</th>--%>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.main.beanList}" var="goods">
                <tr class="text-center">
                    <td title=${goods.id}>${goods.id}</td>
                    <td title=${goods.g_name}>${goods.g_name}</td>
                    <td title=${goods.g_price}>${goods.g_price}</td>
                    <td title=${goods.g_ly}>${goods.g_ly}</td>
                    <td title=${goods.g_vid}>${goods.g_vid}</td>
                        <%--<td title=${goods.g_img}>${goods.g_img}</td>--%>
                        <%--<td title=${goods.g_simg}>${goods.g_simg}</td>--%>
                        <%--<td title=${goods.g_label}>${goods.g_label}</td>--%>
                        <%--<td title=${goods.g_details}>${goods.g_details}</td>--%>
                        <%--<td title=${goods.g_state}>${goods.g_state}</td>--%>
                        <%--<td title=${goods.s_i_uuid}>${goods.s_i_uuid}</td>--%>
                    <td>
                        <a href="#" onclick="return edit(${goods.id})" style="text-decoration: none;">
                            <button type="button" class="btn btn-info"
                                    data-toggle="button"> 编辑
                            </button>                        </a>
                        <a href="#" onclick="return trash(${goods.id})" style="text-decoration: none;" data-toggle="modal" data-target="#trashModal">
                            <button type="button" class="btn btn-danger"
                                    data-toggle="button"> 删除
                            </button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <form class="listForm" method="post" action="<%=basePath%>/goods/findByPage.do">
        <div class="row">
            <div class="form-inline">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.main.totalCount}</b>条记录，共<b>${requestScope.main.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="10"
                                <c:if test="${requestScope.main.pageSize == 10}">selected</c:if> >10
                        </option>
                        <option value="15"
                                <c:if test="${requestScope.main.pageSize == 15}">selected</c:if> >15
                        </option>
                        <option value="20"
                                <c:if test="${requestScope.main.pageSize == 20}">selected</c:if> >20
                        </option>
                        <option value="30"
                                <c:if test="${requestScope.main.pageSize == 30}">selected</c:if> >30
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="main" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/goods/findByPage.do?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.main.pageCode > 15}">
                            <a href="<%=basePath%>/goods/findByPage.do?pageCode=${requestScope.main.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.main.totalPage <= 30}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.main.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.main.pageCode - 9}"/>
                            <c:set var="end" value="${requestScope.main.pageCode + 20}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="30"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.main.totalPage}">
                                <c:set var="begin" value="${requestScope.main.totalPage -29}"/>
                                <c:set var="end" value="${requestScope.main.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.main.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.main.pageCode}">
                            <li>
                                <a href="<%=basePath%>/goods/findByPage.do?pageCode=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <c:if test="${requestScope.main.pageCode < requestScope.main.totalPage}">
                            <a href="<%=basePath%>/goods/findByPage.do?pageCode=${requestScope.main.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/goods/findByPage.do?pageCode=${requestScope.main.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>

    <!-- 删除的模态框 -->
    <div class="modal fade" id="trashModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模糊框头部 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title">警告！</h4>
                </div>
                <!-- 模糊框主体 -->
                <div class="modal-body">
                    <strong>你确定要删除吗？</strong>
                </div>
                <!-- 模糊框底部 -->
                <div class="modal-footer">
                    <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 编辑的模态框 -->
    <form method="post" action="<%=basePath%>/goods/update.do"
          id="form_edit">
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-inline">
                            <label>商品名称：</label>
                            <input type="text" name="g_name" class="form-control" id="g_name"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品价格：</label>
                            <input type="text" name="g_price" class="form-control" id="g_price"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品来源：</label>
                            <input type="text" name="g_ly" class="form-control" id="g_ly"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>条形码：</label>
                            <input type="text" name="g_vid" class="form-control" id="g_vid"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品图片：</label>
                            <input type="text" name="g_img" class="form-control" id="g_img"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品缩略图：</label>
                            <input type="text" name="g_simg" class="form-control" id="g_simg"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品描述：</label>
                            <input type="text" name="g_label" class="form-control" id="g_label"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品详情：</label>
                            <input type="text" name="g_details" class="form-control" id="g_details"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商品状态：</label>
                            <input type="text" name="g_state" class="form-control" id="g_state"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>商家ID：</label>
                            <input type="text" name="s_i_uuid" class="form-control" id="s_i_uuid"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="editSure btn btn-info" data-dismiss="modal">修改</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


</body>
<%--<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>--%>
<%--<script src="<%=basePath%>/js/bootstrap.min.js"></script>--%>
<script type="text/javascript">
    // 删除信息的方法
    function trash(id){
        if(!id){
            alert("error");
        }else{
            $(".delSure").click(function(){
                $.ajax({
                    url: '<%=basePath%>/goods/delete.do?id='+id,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }


    // 编辑信息的方法
    function edit(id){
        if(!id){
            alert("error");
        }else{
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/goods/findById.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function(data){
                    $("#id").val(data.id);
                    $("#g_name").val(data.g_name);
                    $("#g_price").val(data.g_price);
                    $("#g_ly").val(data.g_ly);
                    $("#g_vid").val(data.g_vid);
                    $("#g_img").val(data.g_img);
                    $("#g_simg").val(data.g_simg);
                    $("#g_label").val(data.g_label);
                    $("#g_details").val(data.g_details);
                    $("#g_state").val(data.g_state);
                    $("#s_i_uuid").val(data.s_i_uuid);
                    $("#editModal").modal('show');
                },
                error: function(){
                    alert("错误");
                }
            });
        }
    }


    //提交表单的方法
    $(".editSure").click(function(){
        $("#form_edit").submit();
    });


</script>
</html>
