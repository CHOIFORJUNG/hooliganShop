<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>


<br>
<br>
<br>
<br>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인 해주세요.</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="loginCheck" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디" name="userId" id="userId" type="text" required/>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="userPw" id="userPw" type="password" value="" required/>
                                </div>
                               	<div class="social-auth-links text-center">
									<p>- 또는 -</p>
									<a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
										<i class="fa fa-facebook"></i> 페이스북으로 가입
									</a>
									<a href="#" class="btn btn-block btn-social btn-google btn-flat">
										<i class="fa fa-google-plus"></i> 구글 계정으로 가입
									</a>
								</div>
                                <div class="form-group">
                                	<button type="button" class="btn btn-outline btn-info" onclick="location.href='signup'" >회원가입</button>
                                	<button type="button" style="float: right;" class="btn btn-outline btn-warning">비밀번호 찾기</button>
                                </div>
                                <!-- <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
                                <!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-success btn-block">Login</button>
                                <!-- <a href="userSignIn.do" class="btn btn-lg btn-success btn-block">Login</a> -->
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
<br>
<br>
<br>
<br>
<%@ include file="../include/footer.jsp"%>
  <script>
  var result = '${msg}';
 	if(result == 'failure') {
 		alert('로그인 또는 비밀번호가 틀립니다. 다시 입력해주세요.');
 	}
  </script>
</body>

</html>
