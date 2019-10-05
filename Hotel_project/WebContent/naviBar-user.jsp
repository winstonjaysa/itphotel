<%@page import="com.lx.Beans.*"%>
<%@page import="com.lx.Dao.*"%>
<%@page import="java.util.*"%>
<div class="naviBar">
	     <div class="logo">
		       <span class="logoRed">A</span>urora
	     </div>
	<div class="hiddenNaviIcon" onclick="openNav()" id="naviopen">&#9776</div>
	<div class="hiddenNaviIcon" onclick="closeNav()" id="naviclose">&times</div>
	<div class="resNavi" id="resNavi">
	
	<%
	UserBean sessionUserBean=(UserBean) session.getAttribute("currentSessionUser");
	//String sessionRole=sessionUserBean.getRole();
	TransManageDao sessionDao=new TransManageDao();	

	 if(sessionUserBean==null){
			
		String lastUrl=request.getParameter("PgUrl");
	%>
	<nav>
		<a href="index.jsp">HOME</a><span class="division"> |</span>
		<a href="admin.jsp">Event</a><span class="division"> |</span>
		<a href="travel.jsp">tour</a><span class="division"> |</span>
		<a href="user-reservation.jsp">ROOMs</a>
	</nav>
	<div class="sign-reg-div">
		<a href="login.jsp" class="navi-login">login</a>
		<a href="reg.jsp" class="navi-signup">signup</a>
	</div>
	<% 
		}
		else if(sessionUserBean!=null && sessionUserBean.getRole().equals("user")){
			int uid_for_propic=sessionUserBean.getUid();
	%>
	<nav>
		<a href="index.jsp">HOME</a><span class="division"> |</span>
		<a href="admin.jsp">Features</a><span class="division"> |</span>
		<a href="travel.jsp">tour</a><span class="division"> |</span>
		<a href="user-reservation.jsp">ROOMs</a><span class="division"> |</span>
		<a href="user-laundry.jsp">laundry</a>
	</nav>
	<div class="acc_dropdown" >
		<div class="acc_ico" >
			
					<img src="user-propic.jsp?uid=<%=uid_for_propic %>" onclick="functionAcc()" id="acc-img">
			
		</div>
		<div class="acc_ico-content" id="accDropdown">
			<a href="user-profile.jsp">
				<div class="acc-card">
					<span>
						<i class="fas fa-user-alt"></i>
					</span>
					<span class="title">Profile</span>
				</div>
			</a>
			<div class="acc-card">
				<span>
					<i class="fas fa-envelope"></i>
				</span>
				<span class="title">Inbox</span>
			</div>
			<a href="UserHandler?action=logout" >
				<div class="acc-card">
					<span>
						<i class="fas fa-power-off"></i>
					</span>
					<span class="title">Logout</span>
				</div>
			</a>
		</div>
	</div>
	<% 
		}
		else if(sessionUserBean!=null && sessionUserBean.getRole().equals("admin")){
			
			int uid_for_propic=sessionUserBean.getUid();
	%>
	<nav>
		<a href="index.jsp">HOME</a><span class="division"> |</span>
		<% if(sessionUserBean.getAdmin_role_type().equals("travel")){ %>
			<a href="admin-travel.jsp">ADMIN</a><span class="division"> |</span>
		<% }
		else if(sessionUserBean.getAdmin_role_type().equals("pay")) {%>
			<a href="admin-payment.jsp">ADMIN</a><span class="division"> |</span>
		<% }
		else if(sessionUserBean.getAdmin_role_type().equals("prop")) {%>
			<a href="admin-property.jsp">ADMIN</a><span class="division"> |</span>
		<%
		   } 
		else if(sessionUserBean.getAdmin_role_type().equals("cont")) {%>
			<a href="admin-contactus.jsp">ADMIN</a><span class="division"> |</span>
		<%
			} 
		else if(sessionUserBean.getAdmin_role_type().equals("emp")) {%>
			<a href="admin-employee.jsp">ADMIN</a><span class="division"> |</span>
		<%
			} 
		else if(sessionUserBean.getAdmin_role_type().equals("laun")) {%>
			<a href="admin-laundry.jsp">ADMIN</a><span class="division"> |</span>
		<%
			}
		else if(sessionUserBean.getAdmin_role_type().equals("reservation")) {%>
			<a href="admin-reservation.jsp">ADMIN</a><span class="division"> |</span>
		<%
			} 
		%>
		<a href="admin.jsp">Features</a><span class="division"> |</span>
		<a href="travel.jsp">tour</a><span class="division"> |</span>
		<a href="user-reservation.jsp">ROOM</a><span class="division"> |</span>
		<a href="user-laundry.jsp">laundry</a>
	</nav>
	<div class="acc_dropdown" >
		<div class="acc_ico" >
		<!-- 	<img src="img/user2-160x160.jpg" onclick="functionAcc()" id="acc-img"> -->
			<img src="user-propic.jsp?uid=<%=uid_for_propic %>" onclick="functionAcc()" id="acc-img">
		</div>
		<div class="acc_ico-content" id="accDropdown">
			<a href="user-profile.jsp">
				<div class="acc-card">
					<span>
						<i class="fas fa-user-alt"></i>
					</span>
					<span class="title">Profile</span>
				</div>
			</a>
			<div class="acc-card">
				<span>
					<i class="fas fa-envelope"></i>
				</span>
				<span class="title">Inbox</span>
			</div>
			<a href="UserHandler?action=logout" onclick="clearSession()">
				<div class="acc-card">
					<span>
						<i class="fas fa-power-off"></i>
					</span>
					<span class="title">Logout</span>
				</div>
			</a>
		</div>
	</div>
	<%
	if(sessionUserBean.getAdmin_role_type().equals("travel")){
		List<TransManageBeans> msNotify=sessionDao.getAllTravelMessageList(5,"unread");
		%>
		<div class="notify">
			<div class="notifybox">
				<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-envelope"></i>
					<span class="notifyNumber"><%=sessionDao.reportChartTidCount("unread") %></span>	
				</span>
				
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<%
				
				for(TransManageBeans msNot:msNotify){
					
				%>
			
					<div class="notifyCard">
						<div>
							<div class="uNotifyImg">
								<img src="user-propic.jsp?uid=<%=msNot.getUid() %>" onclick="functionAcc()" id="acc-img">
							</div>
							<div class="notifyTitle">
								<span>
									<%=msNot.getUname() %>
									<small>
										<i class="fa fa-clock-o"><%=msNot.getDatetime() %></i>
									</small>
								</span><br>
								<small><span class="lightFont"> @Tid<%=msNot.getTid() %> </span></small>
								<%
								if(msNot.getStatus().equals("unread")){
								%>
								<small><span class="fontBold"><%=msNot.getUserMessage() %></span></small> 
								<%}else if(msNot.getStatus().equals("read")){ %>
								<small><span><%=msNot.getUserMessage() %></span></small> 
								<%
								}
								%>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<a href="https://www.facebook.com"><p class="more">See All Messages</p></a>
				</div>
			</div>
		</div>
		
	<%}
		}
	%>
	</div>
</div>

<script>

var x=0;

function openNav() {
	
	document.getElementById("resNavi").style.display="flex";
  document.getElementById("naviopen").style.display="none";
  document.getElementById("naviclose").style.display="block";
  //document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  x=1;

	
}

function closeNav() {
  document.getElementById("resNavi").style.display="none";
  document.getElementById("naviopen").style.display="block";
  document.getElementById("naviclose").style.display="none";
  
}

function clearSession(){
	//sessionStorage.clear();
	sessionStorage.removeItem("currentTab");
}

function resizeNavi(){
	 if (screen.width < 1000){
		document.getElementById("resNavi").style.display="none";
		document.getElementById("naviopen").style.display="block";
		document.getElementById("naviclose").style.display="none";
	}
	 
	 if(x==1){
		 if (screen.width > 1000){
				document.getElementById("resNavi").style.display="block";
				document.getElementById("naviclose").style.display="none";
				document.getElementById("naviopen").style.display="none";
				x=0;
		}
	 }
}

function functionAcc() {
	document.getElementById("accDropdown").classList.toggle("show");
	}
window.onclick = function(event) {
	if (!event.target.matches('#acc-img')) {
		var dropdowns = document.getElementsByClassName("acc_ico-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

</script>