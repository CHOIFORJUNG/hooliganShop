<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Interceptor 테스트 페이지
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> interceptor test</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">

            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">인터셉터 결과 데이터</h3>
                    </div>
                    <div class="box-body">
                        <a href="${path}/interceptor/doB">doB 페이지로 이동</a>
                    </div>
                    <div class="box-footer">
                        <p>결과데이터 : ${result}</p>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

