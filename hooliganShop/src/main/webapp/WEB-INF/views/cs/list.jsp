<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<%@page import="com.spring.vo.CsVO" %>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<%-- <%
	HttpSession session4= request.getSession();
	UserVO loginUser3 = (UserVO)session2.getAttribute("loginUser");
	
	CsVO title = (CsVO)session2.getAttribute("title");
/* 	OrderDetailVO loginUser */
%> --%>
<section id="main-content">
          <section class="wrapper">
		  		<div class="row mt" >
			  		<div class="col-lg-10" style="text-align:center; width:100%" >
                      <div class="content-panel" style="display:inline-block; width: 1000px;">
                      <br><br><h1>고객센터</h1><br><br>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>번호</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  <th class="numeric">답변여부</th>
                              </tr>
                              </thead>
                              <tbody>
                              
                              <c:forEach items="${list}" var="cvo">
                              <tr>
                                  <td>${cvo.csNo}</td>
                                  
      								<%-- <% String userName = loginUser4.getUserName();%>  --%>
      							<c:if test="${sessionScope.loginUser.userId.equals('admin') || sessionScope.loginUser.userId == cvo.userId }">	 
                                  <td><a href="/cs/read${pagingMaker.makeURI(pagingMaker.cri.page)}&csNo=${cvo.csNo}">${cvo.csTitle}</a>
                                  <span class="badge bg-info" style="background-color:#41CAC0;"><i class='fas fa-comment-dots'></i> + ${cvo.csReplycnt}</span>
                                  </td>
                               </c:if>
                               <c:if test="${sessionScope.loginUser.userId != cvo.userId && sessionScope.loginUser.userId != 'admin'}">	 
                               <td>
                                  <b><i style='font-size:20px' class='fas'>&#xf023;</i>&nbsp;비밀글입니다.</b>
                               	  </td>
                               </c:if>
                               	  <%-- <span class="badge bg-teal"><i class="fa fa-comment-o"></i> + ${cvo.csReplycnt}</span> --%>
                                  <td>${cvo.userId}</td>
                                  <td><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${cvo.regDate}"/></td>
                               <c:if test="${cvo.csReplycnt != 0}">
                                  <td class="numeric">답변완료</td>
                               </c:if>
                              <c:if test="${cvo.csReplycnt == 0}">
                                  <td class="numeric">답변대기</td>
                               </c:if>
                              </tr>
                             </c:forEach>
                              </tbody>
                          </table>
                          </section>
                         </section>
                  <div class="showback" align="center">      					
						<div class="btn-group">
							<c:if test="${pagingMaker.prev}">
							  <a href="list${pagingMaker.makeURI(pagingMaker.startPage-1)}">
							  	<button type="button" class="btn btn-theme03">◀</button>
							  </a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
							  <a href ="list${pagingMaker.makeURI(pNum)}">
								<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
							  </a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
							  <a href ="list${pagingMaker.makeURI(pagingMaker.endPage+1)}">
							    <button type="button" class="btn btn-theme03">▶ </button>
							  </a>
							</c:if>  
						</div>   
						   				
	      			  <div align="center">
	      			  		<br/>
							<button id="insertBtn" class="btn btn-theme03 btn-lg" >글쓰기</button><br/><br/>
	                  </div> 
      			  </div>  
                  </div><!-- /content-panel --> 
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		</section><! --/wrapper -->
      </section>
      
<%@ include file="../include/footer.jsp" %>

		<script>
			$(document).ready(function() {
				var frmObj = $("form[role='form']");
				console.log("폼태그입니다....");
				$("#insertBtn").on("click", function() {
					self.location = "/cs/insert";
				});
				
				var msg = '${result}';
				if(msg == 'deleteSuccess') {
					alert('정상적으로 삭제되었습니다.');
				} else if(msg == 'insertSuccess') {
					alert('정상적으로 문의글 입력 되었습니다.');
				}
			});
		</script>
		
</html>	