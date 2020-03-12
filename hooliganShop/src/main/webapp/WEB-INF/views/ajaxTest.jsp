<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/lib/jquery/jquery.min.js" />" ></script>  <!-- js파일에 다운받아놓은 제이쿼리 다운로드 이용 -->
<style>
	#modifyDiv {
		width: 500px;
		height: 100px;
		background-color: gray;
		position: absolute;
		top: 20%;
		left: 30%;
		padding: 20px;
		z-index: 100;
	}
</style>

</head>
<body>
<h3>Reply REST + Ajax Test</h3>

<!-- 모달창 -->
<div id = "modifyDiv" style="display:none;">
	<span class='title-dialog'></span>번 댓글
	<div>		
		<input type="text" id="reContent" size="60">
	</div>
	
	<div align="center">
		 <button type="button" id="reModifyBtn">수정</button>
		 <button type="button" id="reDelBtn">삭제</button>
		 <button type="button" id="closeBtn">닫기</button>
	</div> 
</div>

<!-- 댓글 작성란 -->
<div>
	<div>
		작성자 : <input type="text" name="userId" id="writer"/>
	</div>
	
	<div>
		&nbsp;&nbsp;&nbsp;댓글 : <input type="text" size="50" name="replyContent" id="addReContent" />
	</div>
	
	<br/><button id="submitBtn">댓글 작성</button>
	
</div>




<h4>댓글 리스트</h4>
<ul id = "reply">
	<!-- 댓글 리스트 전체 -->
</ul>

<ul class="pgeNumList">
	<!-- 1,2,3,4,5,6,7 버튼 생김 -->
</ul>



<script type="text/javascript">
	
	var bno = 1;
	
	getPgeNum(1);
	
	//reListAll();
	// 댓글목록 전체 화면에 뿌려주기
	function reListAll(){
		/* getJSON(댓글리스트 가져오는 url, 콜백함수) */
		$.getJSON("/replies/selectAll/"+bno, function(data){ // 댓글리스트를 data로 받아옴
			// console.log(data.length);
			var str = "";
			
			$(data).each(function(){
				str +="<li data-rebno='"+this.rebno+"' class='reList'>"
					+ this.rebno + " | "+ this.replyContent
					+"<button>수정</button>"
					+"</li>";
			});
			
			$("#reply").html(str);
		});	
	} //reListAll()
	
	
	// 댓글 목록 페이징 처리
	function getPgeNum(page){
		$.getJSON("/replies/"+bno+"/"+page, function(data){ // data는 json형태의 data
			
			console.log(data.reList.length);
			console.log(data);
			
			var str="";
			
			$(data.reList).each(function(){
				str +="<li data-rebno='"+this.rebno+"' class='reList'>"
					+ this.rebno + " | "+ this.replyContent
					+"<button>수정</button>"
					+"</li>";
			});
			
			$("#reply").html(str);
			
			// 페이지 번호 출력 호출
			showPageNum(data.pagingMaker)
		});
	}//getPgeNum()
	
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
		
		$(".pgeNumList").html(str);
	} //showPageNum()
	
	// 목록페이지 번호 변수 선언, 1로 초기화
	var rePage = 1;
	
	//목록페이지 번호 클릭시 이벤트 발생
	$(".pgeNumList").on("click", "a button", function(e) { // 페이지번호 클릭 시,
	
		e.preventDefault(); // <a> 태그의 화면전환이 일어나지 않도록 하는 역할을 하는 메소드
		
				// this는 페이지번호 
		rePage = $(this).parent().attr("href");   // this는 버튼, this.parent()는 a 태그 
		
		getPgeNum(rePage); // 목록 페이지 호출
		
	});
	
	
	
	//댓글 쓴 뒤 수정버튼 클릭 시 모달창 뜨도록 ( + 해당 댓글의 댓글도 함께 나오도록)
	$("#reply").on("click", ".reList button", function(){  // 댓글 옆에 수정버튼 클릭 시 모달 창
		var li = $(this).parent(); /* li 선택 */
		var rebno = li.attr("data-rebno"); /*data-rebno값 얻어오기*/
		var reContent = li.text();
		
		//alert("댓글번호 : "+rebno+"  수정할 내용 : "+reContent);
		$(".title-dialog").html(rebno);
		$("#reContent").val(reContent);
		$("#modifyDiv").show("slow");
	});
	
	//댓글 쓰기 처리
	$("#submitBtn").on("click", function(){  // 댓글 작성 버튼 클릭 시
	/*  $("선택자").val();   // 해당 선택자의 값을 가져옴
		$("선택자").val("test"); // 해당 선택자의 값을 test로 변경
	*/
		var reWriter = $("#writer").val();
		var reContent = $("#addReContent").val();
		
		$.ajax({
			type : 'post',  // get / post방식같은 요청방식
			url : '/replies',  // url은 controller의 @RequestMapping 경로
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			
			dataType : 'text',  // dataType는 받는 타입 (서버에서 보내줄 데이터 형식)
			data :JSON.stringify({ // data는 보내는 타입(서버로 요청하는 데이터 방식)
			bno : bno,  // 오른쪽 편에 있는게 위에서 받아온 데이터
			 userId : reWriter,
			 replyContent : reContent
			}),
			
			success : function(result){ // result는 서버로부터 받아온 데이터
				if (result == 'Success'){
					// alert("댓글 등록 성공!!!")
					reListAll();
					
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
	
	var rebno = $(".title-dialog").html();
	var reContent = $("#reContent").val();
	
		$.ajax({
			type:'delete',
			url:'/replies/'+rebno,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType: 'text',
			success: function(result){
				console.log("result:" + result);
				if(result == 'Success'){
					alert("삭제 성공!!!");
					$("#modifyDiv").hide("slow");  // Modal 닫기
					reListAll(); // 댓글 목록 갱신
				}
			}
		
		});// ajax
	}); // #reDelBtn
	
	// 수정 처리
	$("#reModifyBtn").on("click", function(){
	
	var rebno = $(".title-dialog").html();
	var reContent = $("#reContent").val();
	
	console.log('test');
		$.ajax({
			type:'put',
			url:'/replies/'+rebno,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"				
			},
			data:JSON.stringify({replyContent:reContent}),
			dataType: 'text',
			success: function(result){
				console.log("result:" + result);
				if(result == 'Success'){
					alert("수정 성공!!!");
					$("#modifyDiv").hide("slow");  // Modal 닫기
					reListAll();  // 댓글 목록 갱신
				}
			}
		
		});// ajax
	}); // #reModifyBtn
	
	
	
</script>
</body>
</html>