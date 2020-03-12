<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<%@page import="com.spring.vo.UserVO"%>

<%-- <%
	HttpSession session3= request.getSession();
	UserVO loginUser2 = (UserVO)session2.getAttribute("loginUser");
%> --%>
<head>

<style>
table {
	width: 500px;
	height: 300px;
}

table, td, th {
	border: 1px solid black;
}

/*  div.product { position:relative; left:250; top:50px; width:350px; }
	 div.product div.productImg { position:relative; left:250; top:50px; width:350px; }
	 div.product div.productImg img { width:350px; height:350px; }
	 
	 div.product div.productInfo { float:center; width:330px; font-size:22px; }
	 div.product div.productInfo p { margin:15px 15px 20px 15px; }
	 div.product div.productInfo p span { display:inline-block; width:100px; margin-right:15px; }
	 
	 div.product div.productInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
	 div.product div.productInfo p.cartStock button { font-size:26px; border:none; background:none; }
	 div.product div.productInfo p.addToCart { text-align:center; }
	 div.product div.productDetails { font-size:18px; clear:both; padding-top:30px; } */
</style>

<!-- <script src="/resources/jquery/jquery-3.3.1.min.js"> -->
<script src="<c:url value="/resources/lib/jquery/jquery.min.js" />"></script>

</head>

<div class="container mtb">
	<div class="row">
		<div class="col-lg-6">
			<form role="form" method="post">
				<%-- <input type="hidden" name="productNo" value="${productView.productNo}" />
				 <input type="hidden" name="productNo" value="${productVO.productNo}"/> --%>

				<input type="hidden" name="c" value="${productView.cateCode}" /> <input
					type="hidden" name="l" value="2" />
			</form>
			<div class="productImg">
				<img class="img-responsive" src="${productView.productImg }" alt=""
					style="height: 400px; width: 400px; margin-right: 0; margin-left: 100px;" />
			</div>
		</div>

		<div class="col-lg-5" style="margin-left: 30px;">

			<div class="product">
				<div class="productInfo">
					<table>
						<tr>
							<p class="productName">
							<th style="text-align: center;">상품명</th>
							<td style="text-align: center;">${productView.productName}</td>
							</p>
						</tr>
						<tr>
							<p class="cateName">
							<th style="text-align: center;">카테고리</th>
							<td style="text-align: center;">${productView.cateName}</td>
							</p>
						</tr>
						<tr>
							<p class="productPrice">
							<th style="text-align: center;">가격</th>
							<td style="text-align: center;"><fmt:formatNumber
									pattern="###,###,###" value="${productView.productPrice}" /> 원</td>
							</p>
						</tr>
						<tr>
							<p class="productStock">
							<th style="text-align: center;">재고</th>
							<td style="text-align: center;"><fmt:formatNumber
									pattern="###,###,###" value="${productView.productStock}" /> 개</td>
							</p>
						</tr>
						<tr>
							<p class="productName">
							<div class="productDetails">
								<td colspan="2"  style="text-align: center;">${productView.productDetails}</td>
							</div>
							</p>
						</tr>
					</table>
					
					<p class="cartStock" style="text-align: center; margin-top: 40px;">
						<span>구입 수량</span>
						<button type="button" class="plus">+</button>
						<input type="number" class="numBox" min="1"
							max="${productView.productStock}" value="1" readonly="readonly" />
						<button type="button" class="minus">-</button>

						<script>
					  $(".plus").click(function(){
					   var num = $(".numBox").val();
					   var plusNum = Number(num) + 1;
					   
					   if(plusNum > ${productView.productStock}) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(plusNum);          
					   }
					  });
					  
					  $(".minus").click(function(){
					   var num = $(".numBox").val();
					   var minusNum = Number(num) - 1;
					   
					   if(minusNum <= 0) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(minusNum);          
					   }
					  });
					 </script>

					</p>
					<p class="addCart" style="text-align: center;">
						<br>
						<c:if test="${productView.productStock != 0}">
						<button type="button" class="btn btn-theme" id="addCartbtn">ADD
							CART</button>
						</c:if>
						<c:if test="${productView.productStock == 0}">
						<button type="button" class="btn btn-danger" >SOLD OUT</button>
						</c:if>
						<script>
			  $("#addCartbtn").click(function(){
			   var productNo = ${productView.productNo};
			   var cartStock = $(".numBox").val();
			   
			   console.log("productNo:" + productNo);
			   console.log("cartStock:" + cartStock);
			   
			   var data = {
			     productNo : productNo,
			     cartStock : cartStock
			     };
			   
			   $.ajax({
			    url : "/shop/view/addCart",
			    type : "post",
			    data : data,
			    success : function(result){
			    	if(result == 1){
			     alert("카트 담기 성공");
			     $(".numBox").val("1");
			    } else{
			    	alert("회원만 사용할수 있습니다.");
			    	$(".numBox").val("1");
			    	}
			    },	
			    error : function(){
			     alert("카트 담기 실패");
			    }
			   });
			  });
			 </script>
					</p>
				</div>
			</div>
		</div>


		<div class="form-group">
			<div class="col-sm-12" align="center">
				<button class="btn btn-info" id="toTheList">목록으로</button>
			</div>
		</div>
		<br/><br/>
		<!-- 댓글 모달창 수정 후 -->

		<div class="modal fade" id="modifyDiv">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							<span class='title-dialog'></span>번 댓글 편집창
						</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!--   Modal body -->
					<div class="modal-body">
						<input class="form-control" type="text" id="userId" size="8" readonly="readonly">
					</div>
					<div class="modal-body">
						<input class="form-control" type="text" id="regdate" size="15" readonly="readonly">
					</div>
					<div class="modal-body">
						<input class="form-control" type="text" id="reContent" size="60" name="reContent">
					</div>
					<div align="center">
						<button type="button" class="btn btn-info" id="reModifyBtn">수정</button>
						<button type="button" class="btn btn-danger" id="reDelBtn">삭제</button>
					</div>
					<!--    Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>


		<!-- /row -->

		<!-- <div class="form-group">
           	 		  	<div class="col-sm-12" align="center">	 -->
		<div class="row">
			<div align="center">
				<div class="col-lg-12">
					<br><br><h2>댓글목록</h2><br><br><hr/>
					<!-- 댓글목록 -->

					<ul id="reply">
					</ul>

					<!-- 댓글 버튼들 존재 -->
					<ul class="pagination" id="pgeNumList">
						<!-- 1,2,3,4,5,6,7 버튼 생김 -->
					</ul>
					<!-- 댓글입력창 -->
					<div class="forreplyinput">
						<h4>댓글쓰기</h4>
						<!-- 댓글입력창 -->
						<%--         <% if(loginUser2 != null) {%>
       	<% String userId = loginUser2.getUserId();	%> --%>
       	<c:if test="${sessionScope.loginUser != null }">
       					<c:if test="${sessionScope.loginUser != null}">
							<div>
							<input class="form-control" type="text" name="userId" id="writer"
								placeholder="Your Name" value="${sessionScope.loginUser.userId}"
								disabled />
							</div>	
						</c:if>
						<div>
							<textarea class="form-control" name="reContent" id="addReContent"
								placeholder="Your Message" rows="5" data-rule="required"
								data-msg="Please write something for us"></textarea>
							<div class="validate"></div>
						</div>
						<div class="loading"></div>
						<div class="error-message"></div>

						<div class="form-send">
							<button id="submitBtn" class="btn btn-large">댓글작성</button>
						</div>
			</c:if>			
            <c:if test="${sessionScope.loginUser == null }">
        	<li><a href="/member/login" class="btn btn-info" role="button">로그인하러 가기</a></li>
        	</c:if>

					</div>


					</form>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- col-lg-8 -->

		</section>
	</div>
	</section>

	<%@ include file="../include/footer.jsp"%>


	<script>

$(document).ready(function(){
	
	var cateCode = '${productView.cateCode}';
	var frmObj = $("form[role='form']");
	
	console.log("폼태그입니다....");
	
	// 목록으로 이동
	$("#toTheList").on("click", function(){
		
		/* self.location = "/bbs/list"; */
		frmObj.attr("method", "get");
		frmObj.attr("action", "/shop/list");
		frmObj.submit();
	});
	


 	var productNo = '${productView.productNo}';
	console.log('productNo 확인: ' + productNo);
	getPgeNum(1);
	
	
	
	//댓글 페이징 처리
	function getPgeNum(page){
		$.getJSON("/productReplies/"+productNo+"/"+page, function(data){ // data는 json형태의 data
			
			console.log(data.reList.length);
			console.log(data);
			
			var str="";
			
			$(data.reList).each(function(){
/* 	 			str +='<div class="row mt">'
					+ 	'<div class="col-lg-8" style="text-align: center; width: 100%">'
					+		'<div class="content-panel" style="display: inline-block; width: 1000px;">'
					+			'<section id="unseen">'
					+				'<table class="table table-bordered table-striped table-condensed">'
					+					'<thead>'
					+						'<tr>'
					+							'<th style="width: 170px; text-align: center;">'+ this.userId + '</th>'
					+							'<th style="width: 170px; text-align: center;">'+ this.regdate + '</th>'
					+							'<th style="text-align: center;">'+ this.reContent
					+								'&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifyDiv">수정</button>'
					+							'</th>'
					+						'</tr>'
					+					'</thead>'
					+				'</table>'
					+			'</section>'
					+		'</div>'
					+	'</div>'
					+'</div>'; */
			
				str +="<li data-rebnum='"+ this.rebnum +"' class='reList'>"
					+"<h4>"+ this.userId + "</h4>"
					+"<p>"+ this.regdate +"</p>"
					+"<blockquote>"+ this.reContent +"</blockquote>"
					+ "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modifyDiv'>수정</button>"
					+"</li>"
					+"<hr>";   
			// if(loginUser2 != nuill && userId == this.userId) {
			
			$("#reply").html(str);
			});  // $(data.reList)
			// 페이지 번호 출력 호출
			showPageNum(data.pagingMaker);
		});  // $getJSON
	} // getPgeNum()
	
	
	// 댓글 목록 페이지 번호 출력 함수 (1,2,3,4,5,6, 번호 출력)
	function showPageNum(pagingMaker){
		
		var str = "";
		
		// 이전 버튼 활성화
		if(pagingMaker.prev){
			str +="<li><a href='"+(pagingMaker.startPage-1)+"'>◀</a></li>";
		}

		// 페이지 번호
		for(var i=pagingMaker.startPage, end=pagingMaker.endPage; i <= end; i++){			
			str +="<a href='"+i+"'><button type='button'>"+i+"</button></a>";	
		}
		
		// 다음 버튼 활성화
		if(pagingMaker.next){
			str +="<li><a href='"+(pagingMaker.endPage+1)+"'>▶</a></li>";
		}
		
		$("#pgeNumList").html(str);
	} //showPageNum()
	
	// 목록페이지 번호 변수 선언, 1로 초기화
	var rePage = 1;
	
	//목록페이지 번호 클릭시 이벤트 발생
	$("#pgeNumList").on("click", "a button", function(e) { // 페이지번호 클릭 시,
	
		e.preventDefault(); // <a> 태그의 화면전환이 일어나지 않도록 하는 역할을 하는 메소드
		
				// this는 페이지번호 
		rePage = $(this).parent().attr("href");   // this는 버튼, this.parent()는 a 태그 
		
		getPgeNum(rePage); // 목록 페이지 호출
		
	});
	
	//댓글 쓴 뒤 수정버튼 클릭 시 모달창 뜨도록 ( + 해당 댓글의 댓글도 함께 나오도록)
	$("#reply").on("click", ".reList button", function(){  // 댓글 옆에 수정버튼 클릭 시 모달 창
		var li = $(this).parent(); /* li 선택 */
		var rebnum = li.attr("data-rebnum"); /*data-rebno값 얻어오기*/
	//	var reContent = li.text();
		
		//alert("댓글번호 : "+rebno+"  수정할 내용 : "+reContent);
		$(".title-dialog").html(rebnum);
	//	$("#reContent").val(reContent);
	//	$("#modifyDiv").show("slow"); 
		
		/*지원추가*/
	 	var userId = $(this).parent().find('h4').text();
		var regdate = $(this).parent().find('p').text();
		var reContent = $(this).prev().text();
		
		$('#userId').val(userId);
		$('#regdate').val(regdate);
		$('#reContent').val(reContent);
		
	}); 
	
	
	//댓글 쓰기 처리
	$("#submitBtn").on("click", function(){  // 댓글 작성 버튼 클릭 시
	/*  $("선택자").val();   // 해당 선택자의 값을 가져옴
		$("선택자").val("test"); // 해당 선택자의 값을 test로 변경
	*/
		var reWriter = $("#writer").val();
		var reContent = $("#addReContent").val();
		console.log(reWriter);
		$.ajax({
			type : 'post',  // get / post방식같은 요청방식
			url : '/productReplies',  // url은 controller의 @RequestMapping 경로
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			
			dataType : 'text',  // dataType는 받는 타입 (서버에서 보내줄 데이터 형식)
			data :JSON.stringify({ // data는 보내는 타입(서버로 요청하는 데이터 방식)
			productNo : productNo,  // 오른쪽 편에 있는게 위에서 받아온 데이터
			 userId : reWriter,
			 reContent : reContent
			}),
			
			success : function(result){ // result는 서버로부터 받아온 데이터
				if (result == 'Success'){
					// alert("댓글 등록 성공!!!")
					//reListAll(); // 전체리스트 출력
					getPgeNum(1);  // 페이징처리된 리스트 출력
					
					$("#writer").val("");//val()=값을 가져오는것
					$("#addReContent").val("");
					//userId.val("");  // val("")=""안에 값으로 변경
					//userId.val(""); = $("#writer").val().val("");이니까 오류
					//replyContent.val(""); // 댓글 내용 초기화
				}
			} 
			
		}); // ajax
	}); // #submitBtn
	
	// 삭제 처리
	$("#reDelBtn").on("click", function(){
	
	var rebnum = $(".title-dialog").html();
	var reContent = $("#reContent").val();
	
		$.ajax({
			type:'delete',
			url:'/productReplies/'+rebnum,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType: 'text',
			success: function(result){
				console.log("result:" + result);
				if(result == 'Success'){
					alert("삭제 성공!!!");
					
					location.reload();	
					//$("#modifyDiv").hide("slow");  // Modal 닫기
					$("#modifyDiv").modal('hide');  // Modal 닫기 (지원)
					//reListAll(); // 댓글 목록 갱신
					getPgeNum(1);
				}
			}
		
		});// ajax
	}); // #reDelBtn
	
	// 수정 처리
	$("#reModifyBtn").on("click", function(){
		
 	var rebnum = $(".title-dialog").html();
 	var reContent = $(this).parents().find('#reContent').val();  // 댓글의 내용 가져오기
	//console.log(reContent);
		$.ajax({
			type:'put',
			url:'/productReplies/'+rebnum,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"				
			},
			data:JSON.stringify({reContent:reContent}),
			dataType: 'text',
			success: function(result){
				console.log("result:" + result);
				if(result == 'Success'){
					alert("수정 성공!!!");
					//$("#modifyDiv").hide("slow"); 
					//$("#modifyDiv").modal('hide');  // Modal 닫기
					
					location.reload();		//reload!! 이런식으로 닫히고 새로고침 하게 정지원씨가 해주었음!!ㅋㅋㅋㅋㅋ
					$(".modal-dialog").modal('hide');
					//reListAll();  // 댓글 목록 갱신
					getPgeNum(1);
				}
			}
		
		});// ajax 
	}); // #reModifyBtn
}); // document ready function

</script>
	</html>