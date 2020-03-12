<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ include file="../include/header.jsp"%>

<section id="container">

	<div id="menu">
		<%@ include file="../include/aside.jsp"%>
	</div>

	<div class="container mtb">
		<div class="row">
			<div class="col-lg-12" style="width: 100%; text-align: center;">

				<div class="hline"></div>

				<div id="container_box" style="display: inline-block;">
					<h2>상품목록</h2><br/>
					<table class="table table-dark">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>카테고리</th>
								<th>가격</th>
								<th>수량</th>
								<th>등록날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.productNo}</td>
									<td><a href="/admin/view?n=${list.productNo}">${list.productName}</a></td>
									<td>${list.cateCode}</td>
									<td><fmt:formatNumber value="${list.productPrice}"
											pattern="###,###,###" /></td>
									<td>${list.productStock}</td>
									<td><fmt:formatDate value="${list.regdate}"
											pattern="yyyy-MM-dd:HH.mm.ss" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


				</div>
			</div>
		</div>
	</div>


</section>
<%@ include file="../include/footer.jsp"%>