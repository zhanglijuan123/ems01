<%@page pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/js/easyui-lang-zh_CN.js"></script>

    <script>
        $(function () {
           $.post("${pageContext.request.contextPath}/back/main/menu.json",function (menu) {
             //遍历一级菜单5
                       $.each(menu,function (index, m) {
                       //同时遍历出二级菜单
                       var content="<div style='text-align: center'>";
                         $.each(m.children,function (idx,child) {
                             content +="<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"');\" style='width:150px;margin:  10px 0;border:1px solid #00bbee'class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>"
                         });
                       content+="</div>";
                       $('#menu').accordion('add',{
                           title:m.name,
                           iconCls:m.iconCls,
                           content:content,
                   });
               });
           });
        });

        //追加选项卡
        function addTabs(title,iconCls,href) {
            //先判断，不能一直追加,判断是否点击过这个title,没点击添加这个选项卡
            //点击过就不用追加
            if(!$("#tabs").tabs('exists',title)){
                $('#tabs').tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    closable:true,
                    href:'${pageContext.request.contextPath}'+href,
                });
            }else{
                $('#tabs').tabs('select',title);
            }

        }
    </script>
</head>

<body class="easyui-layout">
    <!--上-->
    <div data-options="href:'${pageContext.request.contextPath}/back/main/head.jsp',region:'north',split:false" style="height:100px;"></div>
    <!--下边-->
    <div data-options="href:'${pageContext.request.contextPath}/back/main/footer.jsp',region:'south',split:false" style="height:100px; text-align: center"></div>
    <!--左边-->
    <div data-options="region:'west',title:'系统部门',split:false" style="width:220px;">
        <div  id="menu" class="easyui-accordion" data-options="fit:true"></div>
    </div>
    <!--中间-->
    <div data-options="region:'center',split:true" >
        <!--选项卡-->
        <div id="tabs" class="easyui-tabs" data-options="fit:true"></div>
    </div>


</body>
</html>