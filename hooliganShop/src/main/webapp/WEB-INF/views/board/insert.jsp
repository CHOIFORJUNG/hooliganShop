<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>



<!-- *****************************************************************************************************************
	 CONTACT FORMS
	 ***************************************************************************************************************** -->

  <div class="container mtb">
    <div class="row">
      <div class="col-lg-12">
        <h4>Just Get In Touch!^^</h4>
        <div class="hline"></div>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
        <form class="contact-form php-mail-form" method="POST" action="/board/insert">

            <div class="form-group">
              <input type="text" name="userId" class="form-control" id="contact-name" placeholder="작성자" /><!-- data-rule="minlen:4" data-msg="Please enter at least 4 chars" --> 
              <div class="validate"></div>
            </div>
            <div class="form-group">
              <input type="text" name="title" class="form-control" id="contact-subject" placeholder="제목" /><!-- data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" -->
              <div class="validate"></div>
            </div>

            <div class="form-group">
              <textarea class="form-control" name="content" id="contact-message" placeholder="내용" rows="5"></textarea> <!-- data-rule="required" data-msg="Please write something for us" -->
              <div class="validate"></div>
            </div>
            

            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>

            <div class="form-send">
              <button type="submit" class="btn btn-large">Send Message</button>
            </div>

          </form>
      </div>
    </div>
  </div>


<script>
	$('.btn').on("click", function() {
		alert('test');
	});
</script>

<%@ include file="../include/footer.jsp" %>