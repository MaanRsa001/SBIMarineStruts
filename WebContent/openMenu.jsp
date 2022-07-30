<script>
function change_class(val) { 
	document.getElementById(val).className='buttonsMenuBlueMOvar';
}
function RevertClass(val) {
	document.getElementById(val).className='buttonsMenuBlue';
}
</script>
<div class="table0">
	<div class="tablerow">
		<%		
			String productName="";
			String openCoverMississippiNo="";
			String openCoverCustomerName="";
			
			String s1=""+session.getAttribute("mode");
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		%>
	</div>
	<div class="tablerow">
		<div class="layoutHeader">
			<div class="pullLeft">
				 <div style="width:155px;background-color:white;padding:5px;margin-top: 7px;margin-left: 10px;border-radius: 11px;">
		   		<img src="${pageContext.request.contextPath}/images/logonew.png" border="0" width="165px">
		   </div>
			</div>
			<div class="pullRight" style="color: #000000;">
				<font color="red" style="font: bold;font-size: 30px;"><s:property value="#session.userLoginMode"/>&nbsp;&nbsp;Environment</font> <br/>
				<span style="font-size: 12px;">
					<a href="<%=request.getContextPath()%>/HomeUser.action">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;			
					<a href="<%=request.getContextPath()%>/Loginout.action?loginType=Broker">Sign Out</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<%	if(s1.trim().equals("s")) {	%>
				 		<font style="font-weight: bold;color:#000000"> LoginId&nbsp;:&nbsp;&nbsp;<%=(String)session.getAttribute("RSAUSER")%>&nbsp;&nbsp;- <%=productName%> </font>
				 	<%	} else { %>
				 		<font style="font-weight: bold;color:#000000"> LoginId&nbsp;:&nbsp;&nbsp;<%=(String)session.getAttribute("user")%>&nbsp;- <%=productName%></font>
				 	<%	} %>
				</span>
			</div>
			<br class="clear"/>
		</div>
	</div>	
</div>
