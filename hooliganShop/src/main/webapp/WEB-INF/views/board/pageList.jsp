<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

<%@include file="../include/header.jsp" %>


      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 리스트 목록</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> 게시판 목록</h4>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>번호</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  <th class="numeric">조회수</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${list}" var="bvo">
                              <tr>
                                  <td>${bvo.bno}</td>
                                  <td><a href="/board/readPage${pagingMaker.makeURI(pagingMaker.cri.page)}&bno=${bvo.bno}">${bvo.title}</a></td>
                                  <td>${bvo.userId}</td>
                                  <td><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${bvo.regDate}"/></td>
                                  <td class="numeric">${bvo.hit}</td>
                              </tr>
                             </c:forEach>
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel --> 
                  
                  
                  	<div class="showback" align="center">
						<div class="btn-group">
							<c:if test="${pagingMaker.prev}">
							  <a href="pageList${pagingMaker.makeURI(pagingMaker.startPage-1)}">
							  	<button type="button" class="btn btn-theme03">◀</button>
							  </a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
							  <a href ="pageList${pagingMaker.makeURI(pNum)}">
								<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
							  </a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
							  <a href ="pageList${pagingMaker.makeURI(pagingMaker.endPage+1)}">
							    <button type="button" class="btn btn-theme03">▶ </button>
							  </a>
							</c:if> 
							<div class="col-sm-12" align="right">
				                <button type="submit" class="btn btn-primary">글쓰기</button>
             				</div>      	
						</div>
			
      				</div><!-- /showback -->
      				
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		</section><!-- /wrapper -->
      </section>
      
      <script>
      	var result = '${result}';
      	console.log('result: ' + result);
      	if(result == 'Success'){
      		alert("정상처리되었습니다!!");
      	}
      </script>
      
      <%@include file="../include/footer.jsp" %>

		<script>
			$(document).ready(function() {
				var frmObj = $("form[role='form']");
				console.log("폼태그입니다....");
				$(".btn-primary").on("click", function() {
					self.location = "/board/userId";
				});
			});
		</script>