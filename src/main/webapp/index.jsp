
  <%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <jsp:forward page="/views/page.jsp"/> --%>


    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
        response.sendRedirect(request.getContextPath() + "/video/list");
    %>



