<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ tag import="java.util.List" %>
<%@ tag import="ru.itis.web_project.utils.RoleUtil" %><%
    List<String> list = RoleUtil.getRoleNames();
    if (list != null) {
        for (String str : list) {
            if (!str.equals("Пользователь")) {
%>
<option value="<%=str%>"><%=str%></option>
<%
            }
        }
    }
%>