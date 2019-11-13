<%@ tag import="ru.itis.web_project.utils.MenuUtil" %>
<%@ tag import="java.util.List" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<%
    List<String> list = MenuUtil.getCategoryList();
    for (String str : list) {
%>
<option value="<%=str%>"><%=str%>
</option>
<%
    }
%>