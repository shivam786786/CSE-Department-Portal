<%@page import="modulecatalog.dto.SubjectsDTO"%>
<%
 System.out.println("in subject panel");
SubjectsDTO subject=(SubjectsDTO)request.getAttribute("subject");
out.println("*"+subject.getSubject1()+"*"+subject.getSubject2()+"*"+subject.getSubject3()+"*"+subject.getSubject4()+"*"+subject.getSubject5());    
%>
