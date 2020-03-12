<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/aside.jsp" %>
<section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 리스트 목록</h3>
		  		<div class="row mt" >
			  		<div class="col-lg-10" style="text-align:center; width:100%" >
                      <div class="content-panel" style="display:inline-block; width: 1000px;">
                      <h4><i class="fa fa-angle-right"></i> 게시판 목록</h4>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
	                              <tr>
	                                  <th>아이디</th>
	                                  <th>이름</th>
	                                  <th>이메일</th>
	                                  <th>주소</th>
	                                  <th>가입일</th>
	                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${userList}" var="UserVO">
	                              <tr style="height: 56px;">
	                                  <td>${UserVO.userId}</td>
	                                  <td>${UserVO.userName}</td>
	                                  <td>${UserVO.userEmail}</td>
	                                  <td>${UserVO.userAdd1}</td>
	                                  <td> <fmt:formatDate value="${UserVO.regDate}" pattern="yyyy.MM.dd:HH.mm"/></td>
	                              </tr>
	                           </c:forEach>   
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel --> 
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		</section><! --/wrapper -->
      </section>
      
<%@ include file="../include/footer.jsp" %>