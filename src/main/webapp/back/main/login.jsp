<%@page pageEncoding="utf-8" contentType="text/html; utf-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="p" class="easyui-panel" title="登录界面"
     style="width:500px;height:150px;padding:10px;background:#fafafa;" >
    <div style="margin-left:145px;">
    <form action="" method="post">
        用户名：<input  class="easyui-textbox" ><br/><br/>
        密&nbsp;&nbsp;&nbsp;码：<input class="easyui-passwordbox"><br>
        <a  class=easyui-linkbutton">提交</a>
    </form>
    </div>
</div>
</body>
</html>