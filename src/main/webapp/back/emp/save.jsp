<%@page pageEncoding="UTF-8" isELIgnored="false" %>

<div style="text-align: center;">
    <form id="saveUserInputForm" class="easyui-form" method="post" data-options="validType:'uname'">
        <div style="margin-top: 70px;">
            姓名: <input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            年龄: <input type="text" name="age"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            性别:
            <select class="easyui-combobox" name="sex"  data-options="width:159">
                <option value="man">男</option>
                <option value="wuman">女</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            生日: <input type="text" name="birthday"  class="easyui-datebox">
        </div>

    </form>
</div>