<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
       <% 
   String loginCust = (String)session.getAttribute("custId");
   String loginAdmin = (String)session.getAttribute("mngId");
   
%>

<!-- 헤더 -->
<%
   if(loginCust != null && !loginCust.equals("")) {
   //회원로그인이면 마이페이지뜨게
%>
   <%@include file="./header2.jsp" %>

<%   
   } else if(loginAdmin != null && !loginAdmin.equals("")){ 
   //관리자 로그인이면 관리자페이지 뜨게
%>
      <%@include file="./header3.jsp" %>
<%          
   } else {
   //비회원이면 그냥 헤더
%>
      <%@include file="./header.jsp" %>
<% 
   }
%>
    
 <div class='aside_menu'>
    <form name='frm' method='GET' action='./list.jsp'>
      <aside style='float: center;'>
      
        </select>
<!--          <button type='button' onclick="window.open('./create_form.jsp', '', 'width=700, height=630'); return false;"></button> -->
        <button type='submit'>검색</button>    
        <input type='text' name='word' value='' placeholder="">
      </aside> 
    </form>
    <div class='menu_line' style='clear: both;'></div>
  </div>