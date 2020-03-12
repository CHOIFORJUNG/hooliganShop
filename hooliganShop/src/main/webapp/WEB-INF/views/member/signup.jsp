<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="../include/header.jsp"%>
<style>
.orderInfo .inputArea #sample2_address { width:230px; }
.orderInfo .inputArea #sample2_detailAddress { width:280px; }
.orderInfo .inputArea #sample2_extraAddress { display:none; }
</style>
<script type="text/javascript">
	var isCheckId = 0;
	function duplicationId () {
		var inputId = $("#userId").val();
		console.log("inputId:" + inputId );
		$.ajax({
			async: false, //비동기식 방식X 동기식 방식으로 돌려서 if문을 처리하기 위해서 
			type: "get",
			//@RequestParam은 url을 signup?inputId=testId 식으로 받아 오니까ajax에서 url: "/member/idCheck?inputId="+inputId,로 보내준다
			url: "/member/idCheck?inputId="+inputId,
			data: inputId, //여기서 controller서버로 보내주고
			success: function (data) { //여기서 data 받아와서 아래 if 돌려지게 된다.
				if(data == 0) {
					alert("사용가능한 아이디입니다.");
					
					$("#divInputId").addClass("has-success")
					$("#divInputId").removeClass("has-error")
					
					$("#userPw").focus();
					isCheckId = 1;
				} else {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					
					$("#divInputId").addClass("has-error")
					$("#divInputId").removeClass("has-success")
					
					$("#userId").focus();
				}
			},
			error: function(req, status, errThrown) {
				alert("network error occur");
			}
		});
	}
	
	function DosignUp() {
		
		var inputId = $("#userId").val();
		var inputPwd = $("#userPw").val();
		var inputPwdCfm = $("#userPwCfm").val();
		var inputCpnName = $("#signUpUserCompanyName").val();
		var inputCpnTelNo = $("#signUpUserTelNo").val();
		var inputCpnEmail = $("#signUpUserEmail").val();
		var inputCpnNo = $("#signUpUserCompanyNo").val();
		var inputCpnAddr1 = $("#signUpUserPostNo").val();
		var inputCpnAddr2 = $("#signUpUserCompanyAddress").val();
		var inputCpnAddr3 = $("#signUpUserCompanyAddressDetail").val();
		
		if(inputId.length == 0) { alert("아이디를 입력해 주세요."); $("#userId").focus(); return; }
		if(isCheckId == 0) { alert("아이디 중복 체크를 해주세요."); $("#userId").focus(); return; }
		
		if(inputPwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#userPw").focus(); return; }
		if(inputPwd != inputPwdCfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#userPw").focus(); return; }
		
		if(inputCpnName.length == 0) { alert("회사명을 입력해 주세요."); $("#signUpUserCompanyName").focus(); return; }
		
		if(inputCpnTelNo.length == 0) { alert("전화번호를 입력해 주세요."); $("#signUpUserTelNo").focus(); return; }
		
		if(inputCpnEmail.length == 0) { alert("이메일을 입력해 주세요."); $("#signUpUserEmail").focus(); return; }
		
		if(inputCpnNo.length == 0) { alert("사업자번호를 입력해 주세요."); $("#signUpUserCompanyNo").focus(); return; }
		
		if(inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0 || inputCpnAddr3.length == 0) { 
			alert("주소를 입력해 주세요."); $("#signUpUserCompanyAddressDetail").focus();  return;
		}

		if(confirm("회원가입을 하시겠습니까?")) {
			alert("가입!");
			
			location.href= "...do";
			
			
		}
	}
	
	function CheckCompanyNo() {
		
	}
</script>
<!DOCTYPE html>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="width: 50%">
                <div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="signup" method="post">
                        <!-- <form role="form"> -->
                            <fieldset>
                            	<div class="form-group" id="divInputId">
                            		<label>아이디</label>
                            		<input class="form-control" style="margin-bottom: 5px;" placeholder="아이디" name="userId" id="userId" type="text" />
                            		<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationId();" />
                            		<div class="formCheck"></div>
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호</label>
                            		<input class="form-control" placeholder="비밀번호" name="userPw" id="userPw" type="password" required/>
                            		<div class="formCheck2"></div>
                            	</div>
                            	<div class="form-group">
                            		<label>이름</label>
                            		<input class="form-control" placeholder="이름" name="userName" id="userName" type="text" required/>
                            		<div class="formCheck3"></div>
                            	</div>
                            	<div class="form-group">
                            		<label>전화번호</label>
                            		<input class="form-control" placeholder="전화번호" name="userPhone" id="userPhone" type="text" required/>
                            		<div class="formCheck4"></div>
                            	</div>
                            	<div class="form-group">
                            		<label>이메일</label>
                            		<input class="form-control" placeholder="이메일" name="userEmail" id="userEmail" type="text" required/>
                            		<div class="formCheck5"></div>
                            	</div>
                            	<input type="text" id="sample2_postcode" placeholder="우편번호">
								<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" name="userAdd1" id="sample2_address" placeholder="주소"><br>
								<input type="text" name="userAdd2" id="sample2_detailAddress" placeholder="상세주소">
								<input type="text" name="userAdd3" id="sample2_extraAddress" placeholder="참고항목">
								<div class="social-auth-links text-center">
									<p>- 또는 -</p>
									<a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
										<i class="fa fa-facebook"></i> 페이스북으로 가입
									</a>
									<a href="#" class="btn btn-block btn-social btn-google btn-flat">
										<i class="fa fa-google-plus"></i> 구글 계정으로 가입
									</a>
								</div>
								<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
								<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
								
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								    // 우편번호 찾기 화면을 넣을 element
								    var element_layer = document.getElementById('layer');
								
								    function closeDaumPostcode() {
								        // iframe을 넣은 element를 안보이게 한다.
								        element_layer.style.display = 'none';
								    }
								
								    function sample2_execDaumPostcode() {
								        new daum.Postcode({
								            oncomplete: function(data) {
								                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								
								                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
								                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								                var addr = ''; // 주소 변수
								                var extraAddr = ''; // 참고항목 변수
								
								                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								                    addr = data.roadAddress;
								                } else { // 사용자가 지번 주소를 선택했을 경우(J)
								                    addr = data.jibunAddress;
								                }
								
								                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								                if(data.userSelectedType === 'R'){
								                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
								                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								                        extraAddr += data.bname;
								                    }
								                    // 건물명이 있고, 공동주택일 경우 추가한다.
								                    if(data.buildingName !== '' && data.apartment === 'Y'){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								                    if(extraAddr !== ''){
								                        extraAddr = ' (' + extraAddr + ')';
								                    }
								                    // 조합된 참고항목을 해당 필드에 넣는다.
								                    document.getElementById("sample2_extraAddress").value = extraAddr;
								                
								                } else {
								                    document.getElementById("sample2_extraAddress").value = '';
								                }
								
								                // 우편번호와 주소 정보를 해당 필드에 넣는다.
								                document.getElementById('sample2_postcode').value = data.zonecode;
								                document.getElementById("sample2_address").value = addr;
								                // 커서를 상세주소 필드로 이동한다.
								                document.getElementById("sample2_detailAddress").focus();
								
								                // iframe을 넣은 element를 안보이게 한다.
								                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								                element_layer.style.display = 'none';
								            },
								            width : '100%',
								            height : '100%',
								            maxSuggestItems : 5
								        }).embed(element_layer);
								
								        // iframe을 넣은 element를 보이게 한다.
								        element_layer.style.display = 'block';
								
								        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
								        initLayerPosition();
								    }
								
								    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
								    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
								    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
								    function initLayerPosition(){
								        var width = 300; //우편번호서비스가 들어갈 element의 width
								        var height = 400; //우편번호서비스가 들어갈 element의 height
								        var borderWidth = 5; //샘플에서 사용하는 border의 두께
								
								        // 위에서 선언한 값들을 실제 element에 넣는다.
								        element_layer.style.width = width + 'px';
								        element_layer.style.height = height + 'px';
								        element_layer.style.border = borderWidth + 'px solid';
								        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
								        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
								        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
								    }
								</script>
<!--                             	<div class="form-group">
                            		<label style="display: block;" >회사주소</label>
                            		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="userAdd1" id="userAdd1" type="text" readonly="readonly" required>
                            		<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">우편번호 서비스</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<label>주소 입력</label>
	                                        	<div class="form-group input-group">
		                                           <input type="text" class="form-control" name="dlgSearchAddress" onclick="execPostCode();">
			                                           <span class="input-group-btn">
			                                               <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
			                                               </button>
			                                           </span>
		                                       </div>
	                                            <p class="help-block">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
	                                            <p class="help-block">도로명 + 건물번호</p>
	                                            <p class="text-primary">예) 판교역로 235, 제주 첨단로 242</p>
	                                            <p class="help-block">지역명(동/리) + 번지</p>
	                                            <p class="text-primary">예) 삼평동 681, 제주 영평동 2181</p>
	                                            <p class="help-block">지역명(동/리) + 건물명(아파트명)</p>
	                                            <p class="text-primary">예) 분당 주공, 연수동 주공3차</p>
	                                            <p class="help-block">사서함명 + 번호</p>
	                                            <p class="text-primary">예) 분당우체국사서함 1~100</p>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                                            <button type="button" class="btn btn-primary">저장</button>
	                                        </div>
	                                    </div>
	                                    /.modal-content
	                                </div>
	                                /.modal-dialog
	                            </div>
                            	</div> -->
<!--                             	<div class="form-group">
                            		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="userAdd2" id="userAdd2" type="text" readonly="readonly" required/>
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" placeholder="상세주소" name="userAdd3" id="userAdd3" type="text"  required/>
                            	</div> -->
                            	<button class="btn btn-lg btn-success btn-block" id="registerBtn">회원가입</button>
                            	<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  <script>
  	var result = '${result}';
  	
  	if(result == 'success'){
  		alert("회원가입을 축하드립니다!!!");
  	}
  	
  	
  	/* 회원가입 유효성 : JavaScript 정규표현식을 이용한 유효성 검사 */
  	   
      //모든 공백 체크 정규식
      var empJ = /\s/g;
      //아이디 정규식
      var idJ = /^[a-z0-9]{4,12}$/;
      // 비밀번호 정규식
      var pwJ = /^[A-Za-z0-9]{4,12}$/;   // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호 설정 가능
      // 이름 정규식
      var nameJ = /^[가-힣]{2,6}$/; // 한글로 이뤄진 문자만으로 2~6자리 이름을 적어야 함
      // 이메일 검사 정규식
      var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      // 휴대폰 번호 정규식
      var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
  	
      
      //아이디 정규식 처리
      $("#userId").blur(function() {
          if (idJ.test($(this).val())) {
          console.log(idJ.test($(this).val()));
          $(".formCheck").text('사용 가능한 아이디입니다.');
          $('.formCheck').css("color", "green");
          $('#registerBtn').attr("disabled", false);
       } else {
          $('.formCheck').text("아이디는 4~12자로 입력해주세요.");
          $('.formCheck').css('color', 'red');
          $('#registerBtn').attr("disabled", true);
       }
       });
      
      //비밀번호 정규식 처리
      $("#userPw").blur(function() {
          if (pwJ.test($(this).val())) {
          console.log(pwJ.test($(this).val()));
          $(".formCheck2").text('사용 가능한 비밀번호입니다.');
          $('.formCheck2').css("color", "green");
          $('#registerBtn').attr("disabled", false);
       } else {
          $('.formCheck2').text("비밀번호는 영문,숫자 4~12자로 입력해주세요.");
          $('.formCheck2').css('color', 'red');
          $('#registerBtn').attr("disabled", true);
       }
       });      
      
      //이름 정규식 처리
      $("#userName").blur(function() {
          if (nameJ.test($(this).val())) {
          console.log(nameJ.test($(this).val()));
          $(".formCheck3").text('사용 가능한 이름입니다.');
          $('.formCheck3').css("color", "green");
          $('#registerBtn').attr("disabled", false);
       } else {
          $('.formCheck3').text("이름은 2~6자로 입력해주세요.");
          $('.formCheck3').css('color', 'red');
          $('#registerBtn').attr("disabled", true);
       }
       });      
      
      //아이디 정규식 처리
      $("#userEmail").blur(function() {
          if (mailJ.test($(this).val())) {
          console.log(mailJ.test($(this).val()));
          $(".formCheck5").text('사용 가능한 이메일입니다.');
          $('.formCheck5').css("color", "green");
          $('#registerBtn').attr("disabled", false);
       } else {
          $('.formCheck5').text("이메일 형식을 확인해주세요.");
          $('.formCheck5').css('color', 'red');
          $('#registerBtn').attr("disabled", true);
       }
       });

      //아이디 정규식 처리
      $("#userPhone").blur(function() {
          if (phoneJ.test($(this).val())) {
          console.log(phoneJ.test($(this).val()));
          $(".formCheck4").text('사용 가능한 전화번호입니다.');
          $('.formCheck4').css("color", "green");
          $('#registerBtn').attr("disabled", false);
       } else {
          $('.formCheck4').text("올바른 전화번호를 입력해주세요.");
          $('.formCheck4').css('color', 'red');
          $('#registerBtn').attr("disabled", true);
       }
       });
      
      
  </script>

<%@ include file="../include/footer.jsp"%>

</body>

<!-- </html> -->
