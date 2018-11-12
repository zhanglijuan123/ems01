<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#editUserInputForm").form('load','${pageContext.request.contextPath}/emp/queryOne?id=${param.id}');
    });
</script>
<div style="text-align: center;">
    <form id="editUserInputForm" class="easyui-form" method="post">
        <input type="hidden" name="id">
        <div style="margin-top: 70px;">
            姓名: <input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            年龄: <input type="text" name="age"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            性别:
            <select class="easyui-combobox" name="sex"  data-options="width:160">
                <option value="man">男</option>
                <option value="wuman">女</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            生日: <input type="text" name="birthday"  class="easyui-datebox">
        </div>

    </form>
</div>