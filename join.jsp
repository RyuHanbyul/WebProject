<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="top-exam">
			</div>
			<div id="top-left">
			</div>
			<div id="top-center">
				<a href="./main.jsp"><img src="./images/logo.jpg" alt = "mainlogo"></a>
			</div>
			<div id="top-right" >
			  	<p>
					<a class="btn btn-small" href="./login.jsp">로그인</a>
          			<a class="btn btn-small" href="./join.jsp">회원가입</a>
          			<a class="btn btn-small" href="./mypage.jsp">마이페이지</a>
				</p>
			</div>
			<div id="top-exam2">
			</div>
		</div>
		<div id="content-login" >
			<form class="form-facebook">
				<div>
					<h1>Create your account</h1>
				</div>
		
			</form>
			<div style="margin:auto;">
			<form class="form-login">
				
				<div style="margin:auto;width:400px;padding:10px;clear:both;overflow:auto">

			<div id="join-left">
				<img src="http://placehold.it/160x100" alt="myPic" >
			</div>
			<div id="join-right">
				<div class="control-group">
			  		<div class="controls">
			  			<input type="text" id="userName" placeholder="Name">
			  		</div>
			  	</div>
			 	<div class="control-group">
					<div class="controls">
			    		<input type="text" id="inputEmail" placeholder="ID">
					</div>
				</div>
				<div class="control-group">
			    	<div class="controls">
				   		<input type="password" id="inputPassword" placeholder="Password">
			    	</div>
			  	</div>
			 </div><!-- div joinght-->
			</div><!-- left, rigfht-->
	
			 <div id="join-under">
			  	<div class="control-group">
			    	<div class="controls">
			      		<button type="submit" class="btn">Create Account</button>
			    	</div>
			  	</div>
			 </div>
			</form>
		</div>
		</div>
		<div id="login-exam">
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>

</html>