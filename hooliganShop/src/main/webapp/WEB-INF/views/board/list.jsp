<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>

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
                                  <td><a href="/board/read?bno=${bvo.bno}">${bvo.title}</a></td>
                                  <td>${bvo.userId}</td>
                                  <td><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${bvo.regDate}"/></td>
                                  <td class="numeric">${bvo.hit}</td>
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