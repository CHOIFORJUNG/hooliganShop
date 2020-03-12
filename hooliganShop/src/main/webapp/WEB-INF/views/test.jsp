<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <div class="container" style="width: 100%; text-align: center;">

      <div class="row mt" style="margin-top: 20px; width: 60%; text-align: center; margin:auto;">
                <div class="col-lg-12" style="margin:auto;">
                  <div class="form-panel">
                       <h3 class="mb" style="text-align:center;"><b>회원가입</b></h3><br/>
                      <form  role="form" class="form-horizontal style-form" action="/user/register" method="post" autocomplete="off">
                          
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>아이디</b></label>
                              <div class="col-sm-9">
                                  <input type="text"  class="form-control" name="userId" id="userId" placeholder="아이디는 4~12자로 입력해주세요." required>
                                   <b><span class="help-block" style="color:red;" id="msg_idCheck"></span></b>
                              </div>
                          </div>
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>비밀번호</b></label>
                              <div class="col-sm-9">
                                  <input type="password"  class="form-control" name="userPw"  id="userPw" placeholder="비밀번호는 4~12자로 입력해주세요." required="required">
                                  <b><span class="help-block" id="msg_userPw"></span></b>
                              </div>
                          </div>
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>비밀번호 확인</b></label>
                              <div class="col-sm-9">
                                  <input type="password"  class="form-control"  id="userPw2" placeholder="비밀번호는 4~12자로 입력해주세요." required="required">
                                  <b><span class="help-block" id="msg_userPw2"></span></b>
                              </div>
                          </div>
                          
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>이름</b></label>
                              <div class="col-sm-9">
                                  <input type="text" name="userName" class="form-control"  id="userName" required>
                                  <b><span class="help-block" id="msg_userName"></span></b>
                              </div>
                          </div>
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>이메일</b></label>
                              <div class="col-sm-9">
                                  <input type="email" class="form-control" name="userEmail"  id="userEmail" placeholder="abc@naver.com" required>
                                   <b><span class="help-block" id="msg_userEmail"></span></b>
                              </div>
                          </div>
                          <div class="form-group" style="margin-left: 20px;">
                              <label class="col-sm-2 col-sm-2 control-label"><b>연락처</b></label>
                              <div class="col-sm-9">
                                  <input type="text"  class="form-control" name="userPhone" id="userPhone"  autocomplete="off" placeholder="'-' 없이 입력해주세요. " required>
                                   <b><span class="help-block" id="msg_userPhone"></span></b>
                              </div>
                          </div>
                          <!-- 
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">우편번호</label>
                              <div class="col-sm-10">
                                  <input type="text"  class="form-control" name="userAddCode" required="required">
                                   <button type="button" style="width:60px; height:32px;" id="btn_findAddCode">주소찾기</button>
                              </div>
                          </div>
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">주소</label>
                              <div class="col-sm-10">
                                  <input type="text"  class="form-control" name="userAddress1" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">상세주소</label>
                              <div class="col-sm-10">
                                  <input type="text"  class="form-control" name="userAddress2">
                              </div>
                          </div> 
                          -->
                          
                          <div class="form-group" style="margin-left: 20px;">
                             <label class="col-sm-2 col-sm-2 control-label"><b>우편번호</b></label>
                             <div class="col-sm-7">
                           <input type="text" class="form-control" id="sample3_postcode" placeholder="우편번호" autocomplete="off" required="required">
                     </div>
                     <div class="col-sm-3">   
                           <span><button type="button" class="btn btn-theme" onclick="sample3_execDaumPostcode()">우편번호 찾기</button></span>
                     </div>
                   </div>
                    <div class="form-group" style="margin-left: 20px;">
                      <label class="col-sm-2 col-sm-2 control-label"><b>주소</b></label>
                     <div class="col-sm-4">
                           <input type="text" class="form-control" name="userAddCode" style="width=230px;" id="sample3_address" placeholder="주소"><br>
                     </div>   
                     <div class="col-sm-5">
                           <input type="text" class="form-control" name="userAddress1" style="width=280px;" id="sample3_detailAddress" placeholder="상세주소">
                           <input type="hidden"  name="userAddress2" style="display=none;" id="sample3_extraAddress" placeholder="참고항목">
                           <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                           <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                           </div>
                           <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                           <script>
                               // 우편번호 찾기 찾기 화면을 넣을 element
                               var element_wrap = document.getElementById('wrap');
                               function foldDaumPostcode() {
                                   // iframe을 넣은 element를 안보이게 한다.
                                   element_wrap.style.display = 'none';
                               }
                               function sample3_execDaumPostcode() {
                                   // 현재 scroll 위치를 저장해놓는다.
                                   var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
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
                                               document.getElementById("sample3_extraAddress").value = extraAddr;
                                           
                                           } else {
                                               document.getElementById("sample3_extraAddress").value = '';
                                           }
                                           // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                           document.getElementById('sample3_postcode').value = data.zonecode;
                                           document.getElementById("sample3_address").value = addr;
                                           // 커서를 상세주소 필드로 이동한다.
                                           document.getElementById("sample3_detailAddress").focus();
                                           // iframe을 넣은 element를 안보이게 한다.
                                           // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                           element_wrap.style.display = 'none';
                                           // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                           document.body.scrollTop = currentScroll;
                                       },
                                       // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                                       onresize : function(size) {
                                           element_wrap.style.height = size.height+'px';
                                       },
                                       width : '100%',
                                       height : '100%'
                                   }).embed(element_wrap);
                                   // iframe을 넣은 element를 보이게 한다.
                                   element_wrap.style.display = 'block';
                               }
                           </script>
                        </div> <!-- daum address api -->
                     </div>
                             <center><button type="submit" class="btn btn-success btn-lg" style="text-align:center; width:50%;">회원가입</button></center>
                      </form>
                          </div>
                  </div>
                </div><!-- col-lg-12-->         
             </div><!-- /row -->
      <br /> <br />

   </div>

<script>
$(document).ready(function() {
      var formObj = $("form[role='form']");
      
      // 회원가입 하기 버튼 클릭
      $(".btn-success").on("click", function() {
         formObj.submit();
      });
      
      
      
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
      
      $("#userId").blur(function() {  // focus 이후 cursor를 밖으로 위치할 때
            
            var userId = $('#userId').val();
            console.log("중복검사 할 아이디:" + userId);
            
            $.ajax({
               url : '/user/idCheck?userId='+userId,
               type: 'get',
               success : function(data) {
                  console.log("1은 중복, 0은 사용가능한 아이디 : " + data);
                  if(data == 1) {
                     $('#msg_idCheck').text('이미 사용중인 아이디입니다.');
                     $('#msg_idCheck').css("color", "red");
                     $('.btn-success').attr("disabled", true);
                     
                  } else {
                     if(userId == "") {
                        $('#msg_idCheck').text('아이디를 입력해주세요.');
                         $('#msg_idCheck').css("color", "red");
                         $('.btn-success').attr("disabled", true);
                     } else if (idJ.test(userId)) {
                        $('#msg_idCheck').parent('div.form-group').addClass(' has-success');
                        $('#msg_idCheck').text('사용가능한 아이디입니다.');
                         $('#msg_idCheck').css("color", "green");
                         $('.btn-success').attr("disabled", false);
                     } else {
                        $('#msg_idCheck').text('아이디는 소문자와 4~12자리만 가능합니다.');
                         $('#msg_idCheck').css("color", "red");
                         $('.btn-success').attr("disabled", true);
                     }
                  
                  }
               }  // success
            }); // ajax
         });  // #userId
      
         $("#userPw").blur(function() {
            var userPw = $('#userPw').val();
            if(pwJ.test($('#userPw').val())) {
            $('.btn-success').attr("disabled", false);
            } else {
               $('#msg_userPw').text('숫자 or 문자로만 4~12자리 비밀번호를 입력해주세요.');
            $('#msg_userPw').css("color", "red");
            $('.btn-success').attr("disabled", true);
            }
         
         }); // #userPw
         
         $("#userPw2").blur(function() {
            if($('#userPw').val() != $(this).val()) {
               $('#msg_userPw2').text('비밀번호가 일치하지 않습니다.');
            $('#msg_userPw2').css("color", "red");
            $('.btn-success').attr("disabled", true);
            } else {
               $('#msg_userPw2').text('비밀번호가 일치합니다.');
            $('#msg_userPw2').css("color", "green");
            $('.btn-success').attr("disabled", false);
            }
            
         });
         
         $("#userName").blur(function() {
            if (nameJ.test($(this).val())) {
            console.log(nameJ.test($(this).val()));
            $("#msg_userName").text('사용 가능합니다.');
            $('#msg_userName').css("color", "green");
            $('.btn-success').attr("disabled", false);
         } else {
            $('#msg_userName').text('이름을 확인해주세요');
            $('#msg_userName').css('color', 'red');
            $('.btn-success').attr("disabled", true);
         }
         }); // #userName
         
         $("#userEmail").blur(function() {
            if (mailJ.test($(this).val())) {
            console.log(mailJ.test($(this).val()));
            $("#msg_userEmail").text('사용 가능합니다.');
            $('#msg_userEmail').css("color", "green");
            $('.btn-success').attr("disabled", false);
         } else {
            $('#msg_userEmail').text('올바른 이메일 주소 형식이 아닙니다.');
            $('#msg_userEmail').css('color', 'red');
            $('.btn-success').attr("disabled", true);
         }
         }); // #userEmail
         
         $("#userPhone").blur(function() {
            if (phoneJ.test($(this).val())) {
            console.log(phoneJ.test($(this).val()));
            $("#msg_userPhone").text('사용 가능합니다.');
            $('#msg_userPhone').css("color", "green");
            $('.btn-success').attr("disabled", false);
         } else {
            $('#msg_userPhone').text(' "-"를 제외하고 연락처를 입력해주세요');
            $('#msg_userPhone').css('color', 'red');
            $('.btn-success').attr("disabled", true);
         }
         }); // #userPhone
});
</script>

  </body>
</html>