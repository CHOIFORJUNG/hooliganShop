<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp" %>
<section id="main-content">
          <section class="wrapper">
		  		<div class="row mt" >
			  		<div class="col-lg-10" style="text-align:center; width:100%" >
                      <div class="content-panel" style="display:inline-block; width: 1000px;">
                      <br><br><h1> FOOTBALL TALK</h1><br><br>
                          <section id="unseen">
                          <%-- 	
                          <div align="center">
                           		<span class="col-md-12"> 
			                        <select name="findType">
									  <option value="N" 
									  	<c:out value="${fCri.findType == null? 'selected':''}"/>>------</option>
									  <option value="S"
									    <c:out value="${fCri.findType == 'S'? 'selected' : ''}"/>>제목</option>
									  <option value="C"
									    <c:out value="${fCri.findType == 'C'? 'selected' : ''}"/>>내용</option>
									  <option value="W"
									    <c:out value="${fCri.findType == 'W'? 'selected': ''}"/>>작성자</option>
									  <option value="SC"
									    <c:out value="${fCri.findType == 'SC'? 'selected' :''}"/>>제목+내용</option>
									  <option value="CW"
									    <c:out value="${fCri.findType =='CW'? 'selected':''}"/>>내용+작성자</option>
									  <option value="SCW"
									    <c:out value="${fCri.findType =='SCW'? 'selected':''}"/>>제목+내용+작성자</option>
									</select>
									<input type="text" name="keyword" id="findword" value="${fCri.keyword}"/>
									<button id="findBtn" class="btn btn-theme03">검색</button><br/><br/>
								</span>
                           </div> 
                             --%>
                          
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
	                              <tr>
	                                  <th>글번호</th>
	                                  <th>제목</th>
	                                  <th>작성자</th>
	                                  <th>작성일</th>
	                                  <th class="numeric">조회수</th>

	                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${list}" var="bvo">
	                              <tr style="height: 56px;">
	                                  <td>${bvo.bno}</td>
	                                  <td>
	                                  <span><img src="${bvo.boardThumbImg}" width="80" height="40" /></span>
	                                  <a href="/fboard/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&bno=${bvo.bno}">${bvo.title}</a>
	                                  <span class="badge bg-teal" style="background-color:#41CAC0;"><i class="fa fa-comment-o"></i> + ${bvo.replyCnt}</span>
	                                  </td>
	                                  <td>${bvo.userId}</td>
	                                  <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bvo.regDate}"/></td>
	                                  <td class="numeric">${bvo.hit}</td>
	                              </tr>
	                           </c:forEach>   
                              </tbody>
                          </table>
                        	
                          <div align="center">
                           		<span class="col-md-12"> 
			                        <select name="findType">
									  <option value="N" 
									  	<c:out value="${fCri.findType == null? 'selected':''}"/>>------</option>
									  <option value="S"
									    <c:out value="${fCri.findType == 'S'? 'selected' : ''}"/>>제목</option>
									  <option value="C"
									    <c:out value="${fCri.findType == 'C'? 'selected' : ''}"/>>내용</option>
									  <option value="W"
									    <c:out value="${fCri.findType == 'W'? 'selected': ''}"/>>작성자</option>
									  <option value="SC"
									    <c:out value="${fCri.findType == 'SC'? 'selected' :''}"/>>제목+내용</option>
									  <option value="CW"
									    <c:out value="${fCri.findType =='CW'? 'selected':''}"/>>내용+작성자</option>
									  <option value="SCW"
									    <c:out value="${fCri.findType =='SCW'? 'selected':''}"/>>제목+내용+작성자</option>
									</select>
									<input type="text" name="keyword" id="findword" value="${fCri.keyword}"/>
									<button id="findBtn" class="btn btn-theme03">검색</button><br/><br/>
								</span>
                           </div> 
                           
                           <div align="right">
	      			  		<br/>
							<button id="insertBtn" class="btn btn-theme btn-lg" style="background-color:#FF6C60; border: none;">글쓰기</button><br/><br/>
	                  </div> 
      			  </div>
                                
                  <div class="showback" align="center">      					
						<div class="btn-group">
							<c:if test="${pagingMaker.prev}">
							  <a href="list${pagingMaker.makeFind(pagingMaker.startPage-1)}">
							  	<button type="button" class="btn btn-theme03">◀</button>
							  </a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
							  <a href ="list${pagingMaker.makeFind(pNum)}">
								<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
							  </a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
							  <a href ="list${pagingMaker.makeFind(pagingMaker.endPage+1)}">
							    <button type="button" class="btn btn-theme03">▶ </button>
							  </a>
							</c:if>  
						</div>   
						   				
	      			  
                          </section>
                      </div>
                     </div>    
                </div>
          </section>
</section>  <%--    
<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 리스트 페이지</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> 게시판 목록</h4>
                          <section id="unseen">
                           
                           <div align="center">
                           		<span class="col-md-12"> 
			                        <select name="findType">
									  <option value="N" 
									  	<c:out value="${fCri.findType == null? 'selected':''}"/>>------</option>
									  <option value="S"
									    <c:out value="${fCri.findType == 'S'? 'selected' : ''}"/>>제목</option>
									  <option value="C"
									    <c:out value="${fCri.findType == 'C'? 'selected' : ''}"/>>내용</option>
									  <option value="W"
									    <c:out value="${fCri.findType == 'W'? 'selected': ''}"/>>작성자</option>
									  <option value="SC"
									    <c:out value="${fCri.findType == 'SC'? 'selected' :''}"/>>제목+내용</option>
									  <option value="CW"
									    <c:out value="${fCri.findType =='CW'? 'selected':''}"/>>내용+작성자</option>
									  <option value="SCW"
									    <c:out value="${fCri.findType =='SCW'? 'selected':''}"/>>제목+내용+작성자</option>
									</select>
									<input type="text" name="keyword" id="findword" value="${fCri.keyword}"/>
									<button id="findBtn" class="btn btn-theme03">검색</button><br/><br/>
								</span>
                           </div> 
                            
                          
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
	                              <tr>
	                                  <th>글번호</th>
	                                  <th>제목</th>
	                                  <th>작성자</th>
	                                  <th>작성일</th>
	                                  <th class="numeric">조회수</th>

	                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${list}" var="bvo">
	                              <tr style="height: 56px;">
	                                  <td>${bvo.bno}</td>
	                                  <td>
	                                  <span><img src="${bvo.boardThumbImg}" width="80" height="40" /></span>
	                                  <a href="/fboard/readPage${pagingMaker.makeFind(pagingMaker.cri.page)}&bno=${bvo.bno}">${bvo.title}</a>
	                                  <span class="badge bg-teal" style="background-color:#41CAC0;"><i class="fa fa-comment-o"></i> + ${bvo.replyCnt}</span>
	                                  </td>
	                                  <td>${bvo.userId}</td>
	                                  <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bvo.regDate}"/></td>
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
							  <a href="list${pagingMaker.makeFind(pagingMaker.startPage-1)}">
							  	<button type="button" class="btn btn-theme03">◀</button>
							  </a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
							  <a href ="list${pagingMaker.makeFind(pNum)}">
								<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
							  </a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
							  <a href ="list${pagingMaker.makeFind(pagingMaker.endPage+1)}">
							    <button type="button" class="btn btn-theme03">▶ </button>
							  </a>
							</c:if>  
						</div>   
						   				
	      			  <div align="center">
	      			  		<br/>
							<button id="insertBtn" class="btn btn-theme03" >글쓰기</button><br/><br/>
	                  </div> 
      			  </div>
      			  
      			  
               </div><!-- /col-lg-4 -->
               
               			
		  	</div><!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
 --%>
      <script>
      	var result = '${result}';
      	
      	if(result == 'Success'){
      		alert("정상 처리 되었습니다!!!");
      	}
      </script>
      <script type="text/javascript">
      	$(document).ready(function() {
      		$('#findBtn').on("click", function(e){
      			self.location ="list"+"${pagingMaker.makeURI(1)}"
      				+"&findType="
      				+$("select option:selected").val()
      				+"&keyword="+$("#findword").val();
      		});
      		
      		$('#insertBtn').on("click", function(e){
      			self.location ="insert";
      		});
      		
      		
      	});
      </script>
      
<%@include file="../include/footer.jsp" %>
