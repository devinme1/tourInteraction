<%@page import="com.tourInteraction.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=contextPath%>/resource/css/common/tourCss.css">
<link rel="stylesheet"
	href="<%=contextPath%>/resource/css/article/web.css">
	<link rel="stylesheet"
		  href="<%=contextPath%>/resource/css/article/entry-search.css">
<style type="text/css">
.top_menu {
	background: gold
}

.header {
	position: fixed;
	width: 100%;
	z-index: 100;
	background-color: white;
	border-bottom-color: darkkhaki;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}
#div_loginup:hover > .dropdown-menu{
	display:block;
}

.dropdown-menu i{
	margin-right: 15px;
    font-size: 18px; 
    color: #ea6f5a; 
    vertical-align: middle; 
}

</style>

</head>
<body>
	<!-- floatmenu -->
	<jsp:include page="floatmenu.jsp"></jsp:include>
	<!-- floatmenu -->
	<div class="header">
		<div class="container" style="margin-left: 2%;width: 96%;">
			<div class="header-grids">
				<div class="logo">
					<h1>
						<a href="<%=contextPath%>/page/homeDisplay"><span>Tour</span>Interaction</a>
					</h1>
				</div>

			</div>
			<div class="nav-top">
				<div class="top-nav">
					<span class="menu"><img
						src="<%=contextPath%>/resource/images/menu.png" alt="" /></span>
					<ul class="nav1">
						<li id="li_index"
							style="width: 15%; margin-right: 2%; margin-left: 0%"><a
							href="<%=contextPath%>/page/homeDisplay"
							style="text-align: center;" class="top_menu">首页</a></li>
						<li id="li_interaction"
							style="width: 15%; margin-right: 2%;  margin-left: 0% "><a
							href="<%=contextPath%>/page/interactionModel"
							style="text-align: center;" class="top_menu">互动区</a></li>
						<li id="li_article"
							style="width: 15%; margin-right: 2%; margin-left: 0% "><a
							href="<%=contextPath%>/page/article" style="text-align: center;"
							class="top_menu">知识区</a></li>
						<li style="width: 40%; margin-left: 0% ">
							<div class="wrap">
								<input id="input_search" type="text" placeholder="开始输入吧">
								<a id="a_to_search" style="border:none;"><i class="iconfont ic-search"></i></a>
								<div id="navbar-search-tips" style="">
									<div class="search-trending">
										<div class="search-trending-header clearfix"><span>热门搜索</span> <a id="recommend_search_head"><i class="iconfont ic-search-change" style="transform: rotate(0deg);"></i> 换一批</a></div>
										<ul class="search-trending-tag-wrap">
											<%--<li><a href="" target="_blank">考研</a></li>--%>
										</ul>
									</div>
									<div class="search-recent">
										<!---->
										<ul class="search-recent-item-wrap">
											<%--<li><a href="" target="_blank"><i class="iconfont ic-search-history"></i> <span>致我们单纯的小美好</span> <i class="iconfont ic-unfollow"></i></a></li>--%>
										</ul>
									</div>
								</div>

							</div>

						</li>

					</ul>
					<div class="clearfix"></div>
					<!-- script-for-menu -->
					<script>
						$("span.menu").click(function() {
							$("ul.nav1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>
					<!-- /script-for-menu -->
				</div>

				<div class="dropdown-grids" style="top: 3px;position: fixed;right: 3%;">
					<div id="div_loginup" class="user" hidden>
						<div data-hover="dropdown">
							<a class="avatar nav-noti-link-1" id="a_noti_icon"><img id="nav_user_icon"
								src=""
								alt="120">
								<%--<div class="nav-noti-counter-1 nav-noti-counter-red">41</div>--%>
							</a>
						</div>
						<ul class="dropdown-menu" style="margin-top:0px; left:auto;right:0px;top:auto;min-width:120px">
							<li><a href="<%=contextPath %>/page/userPage"> <i
									class="iconfont ic-navigation-profile"></i><span>我的主页</span>
							</a></li>
							<li>
								<!-- TODO bookmarks_path --> <a href="<%=contextPath %>/page/userPage#li_liked_article"> <i
									class="iconfont ic-navigation-mark"></i><span>我的的知识</span>
							</a>
							</li>
							<li><a href="<%=contextPath %>/page/userPage#li_liked_article"> <i
									class="iconfont ic-navigation-like"></i><span>喜欢的知识</span>
							</a></li>
							<li>
							<li><a href="<%=contextPath %>/page/userCenter"> <i
									class="iconfont ic-navigation-settings"></i><span>设置</span>
							</a></li>
							<li><a href="<%=contextPath %>/page/newsCenter" class="nav-noti-link" id="a_noti_msg"> <i
									class="iconfont ic-navigation-feedback"></i><span>消息</span>
								<%--<div class="nav-noti-counter-2 nav-noti-counter-red">41</div>--%>
							</a></li>
							<li><a id="btn_loginup" rel="nofollow">
									<i class="iconfont ic-navigation-signout"></i><span>退出</span>
							</a></li>
						</ul>
					</div>

					<input type="hidden" id="userId" value="${user.getId()}" />
					<div id="loginContainer">
						<a id="loginButton"><span>登录</span></a>
						<div id="loginBox">
							<form id="loginForm" method="post">
								<div class="login-grids">
									<div class="login-grid-left">
										<fieldset id="body">
											<fieldset>
												<label for="name">用户名</label> <input type="text" name="name"
													id="name" value="" maxlength="10">
											</fieldset>
											<fieldset>
												<label for="password">密码</label> <input type="password"
													name="password" id="password" value="" maxlength="16">
											</fieldset>
											<input type="button" id="login" value="登录">
											<label
												for="checkbox_save_password">
												<input type="checkbox" style="box-shadow:none;vertical-align: middle;width: 20px"
												name="checkbox_save_password" id="checkbox_save_password">
												<i>自动登录</i>
											</label>
										</fieldset>
										<span><a href="#">忘记密码?</a></span>
										<div class="or-grid">
											<p>或</p>
										</div>
										<div class="social-sits">
											<div class="facebook-button">
												<a href="#">Connect with Facebook</a>
											</div>
											<div class="chrome-button">
												<a href="#">Connect with Google</a>
											</div>
											<div class="button-bottom">
												<p>
													创建新账号? <a href="<%=contextPath%>/page/register">注册</a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="header_hide"></div>

</body>
<!--pop-up 登录弹窗-->
<script src="<%=contextPath%>/resource/js/menu_jquery.js"></script>
<!--//pop-up-->
<script src="<%=contextPath%>/resource/js/modernizr.custom.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/getPath.js"></script>

<script src="<%=contextPath%>/resource/js/jquery-ui.js"></script>
<script src="<%=contextPath%>/resource/js/jquery.form.js"></script>

<script type="text/javascript"
	src="<%=contextPath%>/resource/js/script.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/resource/js/common/isPhone.js"></script>
<script src="<%=contextPath%>/resource/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/resource/js/webSocket/NotifyWebSocket.js" type="text/javascript"></script>
<script type="text/javascript">
var head = {
    data:{
		search_url:getRootPath()+"/page/search",
		checked:true,
		unchecked:false,
        history_search_name : "history_search_name",
		history_search_local_max_display_count:5
    },
    history_search_condition:{
        limit:0,
        offset:10
    },
	init:function () {
		head.method.otherSetting();
		head.method.isLogined();
        head.method.device_distinguish();
        head.method.loadClickEvent();
        head.method.getSearchHistory(head.history_search_condition);
		head.method.getLocalHistorySearch(head.data.history_search_name);
		if($("#userId").val() != ""){
		    head.method.getMsgNotiCount();
		}
    },
	method:{
        otherSetting:function () {
            // reset header's height
            $("#header_hide").css({
                'height' : $('.header').height()
            });
        },
        isLogined:function () {
            // whether have logining is true or false for set others
            <%User user = new User();
            user = (User) session.getAttribute("user");%>

            if("<%if (user != null)
				out.print(user.getUserName());%>".trim() != "" && "<%if (user != null)
				out.print(user.getUserName());%>".trim() != null) {

                $('#loginContainer').hide();
                $('#div_loginup').show();
                $("#nav_user_icon").attr('src','<%if (user != null) out.print(contextPath+user.getUserIconPath());%>'.trim());

            } else {

                $('#loginContainer').show();
                $('#div_loginup').hide();
                $('.dropdown-grids').css({'top': 'auto','position': 'fixed'});

            }
        },
        device_distinguish:function () {
            if (!isPhone()) {
                $(".header-dropdown").removeClass("hidden");
                $(".avatar").css({'width': '49px','height':'46px','right':'10px'});
            } else {
                $(".header").css({
                    'position' : 'fixed',
                    'z-index' : '1',
                    'background-color' : 'cadetblue',
                    'width' : '100%',
                    'min-height' : '0px'
                });
                $(".header-grids").hide();
                $(".nav-top").css({
                    'margin-top' : '-15px',
                    'margin-bottom' : '5px'
                });
                $(".container").css({
                    'padding-left' : '0px',
                    'padding-right' : '0px'
                });

                $("#loginContainer").css({
                    'top' : '6px'
                });

                $("ul.nav1").css({'position':'fixed'});
                $("li .wrap").addClass("hidden");

            }
        },
		loadClickEvent:function () {
            //登录
            $("#login").click(function(){
                $.post("<%=contextPath%>/signTour/loginIn.do",
                    {
                        name:$("#name").val(),
                        password:$("#password").val(),
                        checkbox_save_password:$("#checkbox_save_password").is(":checked")?head.data.checked:head.data.unchecked
                    },
                    function(result){
                        result = eval(result);
                        if(result == "success"){
                            window.location.reload()

                        }else{
                            toastr.error("用户名或密码错误！请重新登录！");
                        }
                    });
                <%-- 	$.ajax({
                            url:"<%=contextPath%>/signTour/loginIn.do",
                            type: 'post',
                            data:{name:$("#name").val(),
                                  password:$("#password").val(),
                                  checkbox_save_password:$("#checkbox_save_password").val()
                                   },
                            dataType: 'json',
                            error: function (obj, msg) {

                            },
                            complete: function () {

                            },
                            success: function (result) {
                                window.location.reload()
                            }

                        }); --%>
            });

            //注销
            $("#btn_loginup").click(function() {
                $.ajax({
                    url:"<%=contextPath%>/signTour/signup.do",
                    type: 'post',
                    data:{sin:"<%out.print(session);%>"},
                    dataType: 'text',
                    error: function (obj, msg) {

                    },
                    complete: function () {

                    },
                    success: function (result) {

                    }

                });
                window.location.reload()
            });

            //According user's device,locating a proper url;
            $("#loginButton").click(function(){
                if(isPhone()){
                    window.location.href = "<%=contextPath%>/page/appWebLogin"
                }
            });

            //Click searching button for query
            $("#a_to_search").on('click',function () {
                var search_value = "?search_value=" + $("#input_search").val();
                window.location.href = head.data.search_url+search_value;
            });

            //Enter's event for query
            $("#input_search").keyup(function (event) {
				if (event.keyCode == 13){
                    var search_value = "?search_value=" + $(this).val();
                    window.location.href = head.data.search_url+search_value;
				}
            });

            //更换搜索推荐
			$("#recommend_search_head").on('click',function () {
				head.method.getSearchHistory(head.history_search_condition);
			});
        },
        getSearchHistory:function (condition) {
            $(".search-trending-tag-wrap").empty();
            $.post(getRootPath()+"/historySearch/getHistorySearchList.do",condition,function (data,status) {
                data = eval(data);
//                console.log(data);
                $.each(data,function (index,elem) {
                    $(".search-trending-tag-wrap").each(function () {
                        head.method.appendHistorySearchNode(elem,$(this))
                    });
                })
            },'json');
        },
        appendHistorySearchNode:function (elem,target) {
            var html="<li>" +
                "<a href=\""+getRootPath()+"/page/search?search_value="+elem.hitorySearchValue+"\" target=\"_blank\">"+elem.hitorySearchValue+"</a></li>";
            target.append(html);
        },
		getLocalHistorySearch:function (name) {
            $(".search-recent-item-wrap").empty();
            $(".search-recent-item-wrap").empty();
            var start = document.cookie.indexOf(name+'=');
            if (start == -1){
                return;
            }
            start = start+name.length+1;
            var end = document.cookie.indexOf(';', start);
            if (end == -1)
                end=document.cookie.length;
            var cookieValue = document.cookie.substring(start, end);
            cookieValue = decodeURIComponent(cookieValue);
            if(cookieValue == '' || cookieValue == null){
                return;
			}
            var values = cookieValue.split("|||");
            for (var i=0;i<values.length;i++) {
                if(i >= head.data.history_search_local_max_display_count){
                    break;
                }

                if(values[i] != "" && values[i] != null){
                    var html = "<li><a href=\""+getRootPath()+"/page/search?search_value="+values[i]+"\"><i class=\"iconfont ic-search-history\"></i> <span>"+values[i]+"</span> <i onclick=\"return false;\" class=\"iconfont ic-unfollow\"></i></a></li>";
                    $(".search-recent-item-wrap").each(function () {
                        $(this).append(html);
                    });
				}

            }

            $(".ic-unfollow").on('click',function () {
                console.log(234324234)
                head.method.clearSingleHistorySearch(head.data.history_search_name,$(this).prev().text().trim())
            })
        },
        clearSingleHistorySearch:function (name,opValue) {
            var start = document.cookie.indexOf(name+'=');
            start = start+name.length+1;
            var end = document.cookie.indexOf(';', start);
            if (end == -1)
                end=document.cookie.length;
            var cookieValue = document.cookie.substring(start, end);
            cookieValue = decodeURIComponent(cookieValue);
            var values = cookieValue.split("|||");
            cookieValue = '';
            for (var i=0;i<values.length;i++) {
               if(values[i] != opValue){
                   cookieValue = cookieValue + values[i];
                   if(i != values.length - 1 ){
                       cookieValue = cookieValue + "|||";
                   }
			   }
            }
            document.cookie = name + "="+ encodeURIComponent(cookieValue)
            head.method.getLocalHistorySearch(head.data.history_search_name)

        },
		getMsgNotiCount:function () {
			$.post(getRootPath()+"/messageRemind/getMessageRemindCount.do",{},function (data,status) {
				data = eval(data);
				if(data>0){
                    $("#a_noti_msg").append("<div class=\"nav-noti-counter-2 nav-noti-counter-red\">"+data+"</div>");
                    $("#a_noti_icon").append("<div class=\"nav-noti-counter-1 nav-noti-counter-red\">"+data+"</div>");
				}
            },'text');
        }

	}
};
	head.init();

</script>

</html>