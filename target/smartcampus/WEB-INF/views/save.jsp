<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2018/6/26
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<head>
    <title>添加商品功能页面</title>
</head>
<body>
<!-- 导航栏 -->
<div class="sidebar text-left">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">智慧校园</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="<%=basePath%>/goods/toSavePage.do"><strong>添加商品</strong></a></li>
                    <li><a href="<%=basePath%>/goods/toListPage.do"><strong>查询商品</strong></a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <h1 class="text-center">商品信息添加页面</h1>
    <hr/>
    <br/>
    <form class="form-inline text-center" action="<%=basePath%>/goods/save.do" method="post">
        <div class="form-group form-inline">
            <label>商品名称：</label>
            <input type="text" name="g_name" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品价格：</label>
            <input type="text" name="g_price" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品来源：</label>
            <input type="text" name="g_ly" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>条形码：</label>
            <input type="text" name="g_vid" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品图片：</label>
            <input type="text" name="g_img" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品缩略图：</label>
            <input type="text" name="g_simg" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品描述：</label>
            <input type="text" name="g_label" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品详情：</label>
            <input type="text" name="g_details" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品状态：</label>
            <input type="text" name="g_state" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商家ID：</label>
            <input type="text" name="s_i_uuid" class="form-control"/>
        </div>
        <br/>
        <br/>
        <br/>
        <input type="submit" class="btn btn-info text-center"/>
        <input type="reset" class="btn btn-info text-center"/>
    </form>
</div>

</body>
</html>
