<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%--引入jstl的c标签--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入jstl的格式化--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--获取当前项目的路径--%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+path+"/";
    //将path放到页作用域中,方便使用el表达式调用
    pageContext.setAttribute("app_path",path);
%>
<html>
<head>
    <title>项目首页</title>
    <%--引入前框架bootstrap的样式--%>
    <link rel="stylesheet" type="text/css" href="${app_path}/static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <%--引入jQuery的js包--%>
    <script type="text/javascript" src="${app_path}/static/js/jquery-3.2.1.js"></script>
    <%--引入前框架bootstrap的js包
      必须在jQuery的js包引用后面(bootstrap的js包会依赖jQuery的js包)--%>
    <script type="text/javascript" src="${app_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<%--用于修改弹出的模态框--%>
<div class="modal fade" id="projectInfoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"><div class="modal-dialog" role="document">
    <div class="modal-content">
        <%-- 头部--%>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabelupdate">项目申报</h4>
        </div>
        <%-- 中间的内容--%>
        <div class="modal-body">
            <%-- 表单效果--%>
            <form class="form-horizontal">
                <%-- 项目名 --%>
                <div class="form-group">
                    <label for="projectName_update_static" class="col-sm-2 control-label">ProjectName</label>
                    <div class="col-sm-10">
                    <p class="form-control-static" id="projectName_update_static"></p>
                    </div>
                </div>
                <%-- 项目起始时间--%>
                <div class="form-group">
                    <label for="startDate_update_input" class="col-sm-2 control-label">startDate</label>
                    <div class="col-sm-10">
                        <input type="date" name="piStartdate" class="form-control" id="startDate_update_input" placeholder="起始时间">
                    </div>
                </div>
                <%-- 项目结束时间--%>
                <div class="form-group">
                    <label for="endDate_update_input" class="col-sm-2 control-label">EndDate</label>
                    <div class="col-sm-10">
                        <input type="date" name="piEnddate" class="form-control" id="endDate_update_input" placeholder="结束时间">
                    </div>
                </div>
                <%-- 申报状态--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="piStatus">
                            <option value="0">已申报</option>
                            <option value="1">审核中</option>
                            <option value="2">未申报</option>
                        </select>
                    </div>
                </div>
                <%-- 申报人--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Applicant</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="acid">
                        
                        </select>
                    </div>
                </div>
            </form>
        </div>
        <%-- 底部--%>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="projectInfo_update_btn">更新</button>
        </div>
    </div>
</div>
</div>



<%--用于添加的弹框--%>
<div class="modal fade" id="projectInfoAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"><div class="modal-dialog" role="document">
    <div class="modal-content">
        <%-- 头部--%>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">项目申报</h4>
        </div>
        <%-- 中间的内容--%>
        <div class="modal-body">
            <%-- 表单效果--%>
            <form class="form-horizontal">
                <%-- 项目名 --%>
                <div class="form-group">
                    <label for="projectName_add_input" class="col-sm-2 control-label">ProjectName</label>
                    <div class="col-sm-10">
                        <input type="text" name="piProjectname" class="form-control" id="projectName_add_input" placeholder="项目名">
                        <%-- 用来显示错误信息的span标签 --%>
                        <span id="helpBlock" class="help-block"></span>
                    </div>
                </div>
                <%-- 项目起始时间--%>
                <div class="form-group">
                    <label for="startDate_add_input" class="col-sm-2 control-label">startDate</label>
                    <div class="col-sm-10">
                        <input type="date" name="piStartdate" class="form-control" id="startDate_add_input" placeholder="起始时间">
                    </div>
                </div>
                <%-- 项目结束时间--%>
                <div class="form-group">
                    <label for="endDate_add_input" class="col-sm-2 control-label">EndDate</label>
                    <div class="col-sm-10">
                        <input type="date" name="piEnddate" class="form-control" id="endDate_add_input" placeholder="结束时间">
                    </div>
                </div>
                <%-- 申报状态--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="piStatus">
                            <option value="0">已申报</option>
                            <option value="1">审核中</option>
                            <option value="2">未申报</option>
                        </select>
                    </div>
                </div>
                <%-- 申报人--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Applicant</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="acid">

                        </select>
                    </div>
                </div>
            </form>
        </div>
        <%-- 底部--%>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="projectInfo_save_btn">保存</button>
        </div>
    </div>
</div>
</div>


<%--  最外层的架子--栅格系统-根据自己的需求自由组合格子的大小  --%>
<div class="container">
    <%-- 第一行：标题行--%>
    <div class="row">
        <%--标题占一行12个格子--%>
        <div class="col-md-12">
            <h1>SSM-项目申报-Mrli</h1>
        </div>
    </div>
    <%-- 第二行：新增标题行 --%>
    <div class="row">
        <%-- 占2个格子 偏移10个格子 --%>
        <div class="col-md-2 col-md-offset-10">
        <button type="button" class="btn btn-success" id="projectInfo_add_btn">新增</button>
        <button type="button" class="btn btn-danger" id="projectInfo_delete_all_btn">删除</button>
        </div>
    </div>
    <%-- 第三行：数据显示行 --%>
    <div class="row">
        <%-- 条纹状表格 + 鼠标悬停--%>
        <table class="table table-striped table-hover" id="projectInfos_table">
            <%-- 头部行 --%>
            <thead>
                <%-- 行  --%>
                <tr>
                    <%-- 格子--%>
                        <td>
                           <input type="checkbox" id="check_all">
                        </td>
                        <td>项目编号(#)</td>
                        <td>项目名</td>
                        <td>开始日期</td>
                        <td>结束日期</td>
                        <td>申报状态</td>
                        <td>申报人</td>
                        <td>性别</td>
                        <td>工作年限</td>
                        <td>操作</td>
                </tr>
            </thead>
            <tbody>
                <%-- 依靠js代码添加内容--%>
    
            </tbody>
        </table>
    </div>
    <%-- 第四行：分页信息行 --%>
    <div class="row">
        <%--分页文字显示--%>
        <div class="col-md-4 col-md-offset-2" id="page_info_area"></div>
        <%-- 分页导航条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
</body>
</html>
<%--引入js脚本--%>
<script type="text/javascript">
    /*1.页面刚开始加载，直接发送Ajax异步请求，拿到分页数据*/
    $(function (){
        /*调用分页查询方法，默认传参为1，代表访问第一页数据*/
        to_page(1);
    })
    
    /*分页查询的方法，参数为页码*/
    function to_page(pn) {
        /*发送Ajax请求*/
        $.ajax({
            url:"${app_path}/projectInfos",
            data:"pn="+pn,
            type:"GET",
            success:function (result){/*上面的请求成功之后返回的结果*/
                /*在前台里面输出内容*/
                console.log(result);
                // 1.解析json数据并显示在表格当中 展示项目信息和员工信息
                build_projectInfos_table(result);
                // 2.解析并显示分页的文字提示信息
                build_page_info(result);
                // 3.解析并显示分页的导航条信息
                build_page_nav(result);
                
            }
        });
    }
    // 1.解析json数据并显示在表格当中 的函数
    function build_projectInfos_table(result) {
        // 0.创建表格数据之前,把原本的内容清空
        $("#projectInfos_table tbody").empty();
    
        // 1.解析传参的result,拿到其中的extend中的pageInfo中的List集合
        var projectInfos = result.extend.pageInfo.list;
        // 循环遍历展示集合中的数据 projectInfos:遍历的集合 index:下标 item:集合中的每一项
        $.each(projectInfos, function (index, item) {
            // 复选框
            var checkBoxTd=$("<td> <input type='checkbox' class='check_item'> </td>");
            // 编号格子
            var piIdTd = $("<td></td>").append(item.piId);
            // 项目名格子
            var piProjectnameTd =  $("<td></td>").append(item.piProjectname);
            // 开始日期格子
            var piStardateTd =  $("<td></td>").append(dateFarmat("yyyy-MM-dd",new Date(item.piStartdate)));
            // 结束日期格子
            var piEnddateTd =  $("<td></td>").append(dateFarmat("yyyy-MM-dd",new Date(item.piEnddate)));
            var StatusResult;
            if (item.piStatus=="0"){
                StatusResult="已申报";
            }else if (item.piStatus=="1"){
                StatusResult="审核中";
            }else if (item.piStatus=="2"){
                StatusResult="未申报";
            };
            // 状态格子
            var piStatusTd =  $("<td></td>").append(StatusResult);
            // 申报人格子
            var acNameTd =  $("<td></td>").append(item.applicant.acName);
            // 性别格子
            var acSexTd =  $("<td></td>").append(item.applicant.acSex==1?"男":"女");
            // 工作年限格子
            var workinglifeTd =  $("<td></td>").append(item.applicant.workinglife);
    
            // 编辑按钮 <button type="button" class="btn btn-primary">（首选项）Primary</button>
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            
            //为编辑按钮添加一个自定义的属性,标识当前操作项的id
            editBtn.attr("edit-id",item.piId);
            
            // 删除按钮 <button type="button" class="btn btn-danger">（危险）Danger</button>
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            
            //为删除按钮添加一个自定义的属性，标识当前操作项(删除)的id
            delBtn.attr("del-id", item.piId);
        
            //将编辑和删除按钮放在一个格子
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
    
            //组合 将所有td单元格放到tr行中
            $("<tr></tr>").append(checkBoxTd)
                    .append(piIdTd)
                    .append(piProjectnameTd)
                    .append(piStardateTd)
                    .append(piEnddateTd)
                    .append(piStatusTd)
                    .append(acNameTd)
                    .append(acSexTd)
                    .append(workinglifeTd)
                    .append(btnTd)
                    .appendTo("#projectInfos_table tbody");
    
        });
    }
    function build_page_info(result){
        //创建表格数据之前,把原本的内容清空
        $("#page_info_area").empty();
        
        //构建分页信息
        $("#page_info_area").append(
                "当前第"+result.extend.pageInfo.pageNum+
                "页,总共"+result.extend.pageInfo.pages+
                "页,共有"+result.extend.pageInfo.total+
                "条记录");
        //全局参数,totalCount,currentPage
        totalCount = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
    };
    
    //显示分页导航条信息  page_nav_area
    function build_page_nav(result) {
        //创建表格数据之前,把原本的内容清空
        $("#page_nav_area").empty();
        
        //先创建外面的ul标签并添加样式
        var ul=$("<ul></ul>").addClass("pagination");
        
        //首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"))
        //上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"))
        //当前页面处于第一页的时候,没有上一页和首页
        //判断是否处于第一页
        if (result.extend.pageInfo.hasPreviousPage==false){//没有上一页
            //给首页按钮添加类样式
            firstPageLi.addClass("disabled");
            //上一页按钮添加禁用类样式
            firstPageLi.addClass("disabled");
        }else{
            firstPageLi.click(function (){
                to_page(1);
            })
            prePageLi.click(function (){
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }
    
    
        //下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"))
        //末页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"))
        //当前页面处于第一页的时候,没有上一页和首页
        //判断是否处于第一页
        if (result.extend.pageInfo.hasNextPage==false){//没有下一页
            //给首页按钮添加类样式
            nextPageLi.addClass("disabled");
            //上一页按钮添加禁用类样式
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function (){
                to_page(result.extend.pageInfo.pageNum+1);
            })
            lastPageLi.click(function (){
                to_page(result.extend.pageInfo.pages);
            });
        }
        
        //现将首页和上一页放到
        ul.append(firstPageLi).append(prePageLi);
        //遍历中间的数据
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
            //创建li
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            //判断当前项是否是显示的页面数字,如果是,添加bootstrap背景样式active
            if (item == result.extend.pageInfo.pageNum){
                numLi.addClass("active");
            }
            
            //每一个li添加点击
            numLi.click(function (){
                to_page(item);
            });
            // 循环添加中间的几个页码数字
            ul.append(numLi);
        });
        
        //最后将下一页 和 末页添加到ul中
        ul.append(nextPageLi).append(lastPageLi);
        //将整个ul放到nav中
        var navele=$("<nav></nav>").append(ul);
        
        //将nav放到指定位置
        navele.appendTo("#page_nav_area");
    }

    //
    function dateFarmat(fmt,date) {
        var o = {
            "M+" : date.getMonth()+1,                 //月份
            "d+" : date.getDate(),                    //日
            "h+" : date.getHours(),                   //小时
            "m+" : date.getMinutes(),                 //分
            "s+" : date.getSeconds(),                 //秒
            "q+" : Math.floor((date.getMonth()+3)/3), //季度
            "S"  : date.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
    /*
    *  添加按钮的单击效果
    *  1.主页点击新增
    *  2.弹出对话框
    *  3.在数据库中查询出申报人的姓名，以下拉列表形式展示
    *  4.使用Ajax进行异步访问，校验项目名是否重复(在前端校验用户名是否合理)
    *  5.后端保证数据安全，再次校验 JSR303(数据校验)
    *  6.添加到数据库中
    * */

    //新增按钮添加点击事件
    $("#projectInfo_add_btn").click(function (){
        // 清除表单数据,重置(包括数据,表单的样式)
        clear_add_form("#projectInfoAddModal form");
        
        // 发送Ajax请求，查询申报人有哪些，并展示在下拉框中
        getApplicants("#projectInfoAddModal select[name=acid]");
        //弹出模态框
        $('#projectInfoAddModal').modal({
            backdrop: 'static'
        });
    });
    
    function clear_add_form(ele) {
        //重置
        $(ele)[0].reset();
        //清空样式
        
        //清空校验的提示信息
        
        
    };
    
    
    
    // 查询申报人的函数
    function getApplicants(ele) {
        //先清空ele(下拉框中)数据
        $(ele).empty();
        
        //再异步查询申报人
        $.ajax({
            url:"${app_path}/applicants",
            type: "GET",
            success:function (result){
                //输出结果
                console.log(result);
                // 将result结果进行解析
                $.each(result.extend.applicants,function (){
                    // 创建option节点
                    var optionele =  $("<option></option>").append(this.acName).attr("value",this.acId);
                    // 将option节点添加到指定的ele(下拉框)中
                    optionele.appendTo(ele);
                });
            }
        });
    };
    
    $("#projectInfo_save_btn").click(function (){
       //数据校验
        if (!validate_add_form()){//如果校验不成功
            return false;//结束掉当前添加按钮
        }
       //验证是否存在项目名
       
       //请求保存
        $.ajax({
            url:"${app_path}/projectInfo",
            type: "POST",
            data: $("#projectInfoAddModal form").serialize(),// 将数据序列化
            success:function (result){
                if (result.code == 200){
                    //关闭模态框
                    $("#projectInfoAddModal").modal('hide');
                    //跳转到最后一页,查看数据
                    to_page(totalCount);
                }else {//失败
                
                }
            }
        });
    });
    
    //给项目输入框添加重复名验证,输入框内容发生变化就进行验证
    $("#projectName_add_input").change(function (){
       //获取输入框的值
       var projectName = this.value;
       console.log(projectName);
       //校验
       if (!validate_add_form()) {//如果校验不成功
           return false;//结束掉当前输入框重名验证
       }
       $.ajax({
          url:"${app_path}/checkProjectInfo",
          data:"projectName="+ projectName,
          type:"POST",
          success:function (result){
              //判断返回的结果
              if(result.code == 200){//成功
                  show_validate_msg("#projectName_add_input","success","√ 可用");
                  //携带成功的信息
                  $("#projectInfo_save_btn").attr("ajax_validate_projectName","success");
              }else {//失败
                  show_validate_msg("#projectName_add_input","error",result.extend.validate_msg);
                  //携带失败信息
                  $("#projectInfo_save_btn").attr("ajax_validate_projectName","error");
              }
          }
       });
    });
    
    //前端校验
    function validate_add_form() {
        //1.拿到项目名的输入框里面的值
        var projectName = $("#projectName_add_input").val();
        //2.创建匹配规则,正则表达式 2~32位中文,或者6~64位大小写字母,数字,下划线,横杠
        var regName = /(^[a-zA-Z0-9_-]{6,64}$)|(^[\u4e00-\u9fa5]{2,32}$)/;
        //判断验证
        if(!regName.test(projectName)){
            //显示不符合信息
            show_validate_msg("#projectName_add_input","error","项目名为2~32位中文,或者6~64位大小写字母,数字,下划线,横杠");
            return false;
        }else{
            //显示正常信息
            show_validate_msg("#projectName_add_input","success","");
        }
        return true;
    }
    
    //项目名是否合理存在
    function show_validate_msg(ele,status,msg){
        //先把默认样式清除掉
        $(ele).parent().removeClass("has-success has-error");
        //根据节点附加的属性信息,判断是否添加正确或者错误的样式
        if (status == "success"){
            $(ele).parent().addClass("has-success");//添加绿色正确样式
        }else if (status == "error"){
            $(ele).parent().addClass("has-error");//添加红色错误样式
        }
        //显示错误信息
        $(ele).next("span").text(msg);
    }
    
    //全选&全不选
    $("#check_all").click(function (){
        //将父级的按钮的选择状态同步设置给子级按钮
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    
    //子级全选,父级也选中
    $(document).on("click",".check_item",function (){
        //子级选中的长度个数 是否 等于子级的个数 ; 如果相等,结果为true(勾选)
        var flag = $(".check_item:checked").length == $(".check_item").length
        //将结果同步给父级
        $("#check_all").prop("checked", flag);
    });
    
    //单个删除按钮的动态绑定点击事件
    $(document).on("click",".delete_btn",function (){
       //获取要删除的项目名字
       var projectInfoName = $(this).parents("tr").find("td:eq(2)").text();
       //获取需要删除的id，删除按钮上
        var delId = $(this).attr("del-id");
        //询问
        if (confirm("确定删除"+projectInfoName+"吗？"+delId)){
          //发送Ajax请求删除单个数据
          $.ajax({
              url:"${app_path}/projectInfo/"+delId,
              type:"DELETE",
              success:function (result){
                  //成功跳转当前页面
                  to_page(currentPage);
              }
          });
        }
    });
    
    //删除选择的项
    $("#projectInfo_delete_all_btn").click(function (){
       //创建存放项目名的变量
       var projectInfoNames="";
       //创建存放删除id的变量
        var del_ids="";
        //循环遍历,把所有勾选的项里面的名称和id取出来拼接到对应变量中
        $.each($(".check_item:checked"),function (){
            //将遍历的项目名拼接到projectName中,并用","隔开
            projectInfoNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
            //将遍历的id拼接到del_ids中,并用"-"隔开
            del_ids +=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去掉最后的","
        projectInfoNames=projectInfoNames.substring(0,projectInfoNames.length-1);
        //去掉最后的"-"
        del_ids=del_ids.substring(0,del_ids.length-1);
        //判断
        if (confirm("确定删除"+projectInfoNames+"吗？")){
            //发送Ajax请求删除单个数据
            $.ajax({
                url:"${app_path}/projectInfo/"+del_ids,
                type:"DELETE",
                success:function (result){
                    //成功跳转当前页面
                    to_page(currentPage);
                }
            });
        }
        
    });
    
    $(document).on("click",".edit_btn",function (){
        //1.查询当前的这条数据
        getProjectInfo($(this).attr("edit-id"));
        //2.查询申报人
        getApplicants("#projectInfoUpdateModal select[name=acid]");
        
        //3.将需要修改的id传输模态框
        $("#projectInfo_update_btn").attr("edit-id",$(this).attr("edit-id"));
        
        //弹出模态框
        $("#projectInfoUpdateModal").modal({
            backdrop: 'static'
        });
        
    });

    //查询单个数据
    function getProjectInfo(id) {
        $.ajax({
            url:"${app_path}/projectInfo/"+id,
            type:"GET",
            success:function (result){
                console.log(result);
                //取出员工对象
                var projectInfo = result.extend.projectInfo;
                //将项目中的信息展示显示到模态框上
                $("#projectName_update_static").text(projectInfo.piProjectname);
                $("#startDate_update_input").val(dateFarmat("yyyy-MM-dd",new Date(projectInfo.piStartdate)));
                $("#endDate_update_input").val(dateFarmat("yyyy-MM-dd",new Date(projectInfo.piEnddate)));
                $("#projectInfoUpdateModal select[name=piStatus]").val([parseInt(projectInfo.piStatus)]);
                $("#projectInfoUpdateModal select[name=acid]").val([parseInt(projectInfo.acid)]);
                
            }
        });
    }
    
    //点击修改进行保存操作
    $("#projectInfo_update_btn").click(function (){
       $.ajax({
           url:"${app_path}/projectInfo/"+$(this).attr("edit-id"),
           type:"PUT",
           data:$("#projectInfoUpdateModal form").serialize(),
           success:function (result){
               //隐藏
               $("#projectInfoUpdateModal").modal("hide");
               //跳转当前页面
               to_page(currentPage);
           }
       })
    });
</script>
