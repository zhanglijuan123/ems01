<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $('#empDg').datagrid({
            url:"${pageContext.request.contextPath}/emp/findAll",
            pagination:true,//显示分页工具栏
            pageNumber:1,//当前页
            pageSize:2,//每页显示记录数
            pageList:[2,3,4,5,6,7],
            striped:true,
            rowumbners:true,
            singleSelect:false,
            ctrlSelect:true,
            //开启分页
            pagination:true,
            pagePosition:'bottom',
            resizable:false,
            toolbar:[
                {
                   text:'添加员工',
                    iconCls:'icon-add',
                    //点击添加按钮，执行后面操作
                    handler:function () {
                        $('#addEmp').dialog({
                            href:'${pageContext.request.contextPath}/back/emp/save.jsp',
                            width:600,
                            height:500,
                            title:'添加员工对话框',
                            buttons:[
                                {
                                    text:'保存',
                                    iconCls:'icon-save',
                                    handler:function () {
                                        $("#saveUserInputForm").form('submit',{
                                            url:"${pageContext.request.contextPath}/emp/insert",
                                            success:function (result) {
                                                $.messager.show({title:'提示框',msg:'用户添加成功！！！'});
                                                //关闭对话框
                                                $("#addEmp").dialog('close');
                                                //刷新展示页面
                                                $("#empDg").datagrid('reload');
                                            }
                                        });
                                    }
                                },
                                {
                                    text:'关闭',
                                    iconCls:'icon-save',
                                    iconCls:'icon-cancel',
                                    handler:function(){
                                        $("#addEmp").dialog('close');
                                    }
                                }]

                        });
                    }
                },{
                    text:'批量删除',
                    iconCls:'icon-remove',
                    handler:function () {
                    var rows=$("#empDg").datagrid('getSelections');
                    if(rows.length<=0){
                        $.messager.show({title:'提示框',msg:'至少选中一行！！！'});
                    }else{
                        var ids=[];
                        for(var i=0;i<rows.length;i++){
                            console.log(rows[i].id);
                            ids.push(rows[i].id);
                        }
                       $.ajax({
                           url:"${pageContext.request.contextPath}/emp/deleteList",
                           type:'POST',
                           traditional:true,
                           data:{id:ids},
                           success:function () {
                               $.messager.show({title:'提示框',msg:'删除成功！！！'});
                               $("#empDg").datagrid('reload');

                           }
                       });
                    }
                    }
                }
            ],
            columns:[[
                {title:'cks',field:"cks",checkbox:true, fixed: false,},
                {title:'id',field:'id',width:120, fixed: false,},
                {title:'name',field:'name',width:120, fixed: false,},
                {title:'age',field:'age',width:120,sortable:true, fixed: false,},
                {title:'sex',field:'sex',width:120,sortable:true, fixed: false,},
                {title:'birthday',field:'birthday',width:120,sortable:true, fixed: false,},
                {title:'options',field:'options',width:200, fixed: false,
                    formatter:function(value,row,index){
                       return "<a  href='javascript:;' class='options'onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove'\">删除</a>&nbsp;&nbsp;" +
                           "<a href='javascript:;' class='options' onclick=\"updateRow('"+row.id+"')\" data-options=\"iconCls:'icon-edit'\">修改</a>"
                    }
                }
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            }
        });
    });

    //删除一行记录
    function delRow(id) {
       //获取id值，删除一行数据
        $.post("${pageContext.request.contextPath}/emp/delete",
            {"id":id},
            function (result) {
            $("#empDg").datagrid('reload');//调用数据表格的reload方法，刷新展示页面
        });

    }

    //修改一条记录
    function updateRow(id) {
        $("#udateEmp").dialog({
            width:600,
            height:500,
            title:'修改用户',
            href:'${pageContext.request.contextPath}/back/emp/edit.jsp?id='+id,
            buttons:[
                {
                    text:'修改',
                    iconCls:'icon-save',
                    handler:function () {
                        $("#editUserInputForm").form('submit',{
                          url:"${pageContext.request.contextPath}/emp/update",
                            success:function (result) {
                                $("#udateEmp").dialog('close');
                                $("#empDg").datagrid('reload'),
                                $.messager.show({title:'提示框',msg:'用户修改成功！！！'});
                            }
                        });
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function () {
                        $("#editUserInputForm").form('close');
                            }
                }]
        });
    }
</script>
<table id="empDg" class="easyui-datagrid" data-options="fit:true">

</table>
<!--添加员工-->
<div id="addEmp"></div>
<!--修改员工-->
<div id="udateEmp"></div>