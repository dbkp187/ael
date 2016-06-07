<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="userList.title"/></title>
    <meta name="menu" content="AdminMenu"/>
</head>

<c:if test="${not empty searchError}">
    <div class="alert alert-danger alert-dismissable">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="${searchError}"/>
    </div>
</c:if>

<div class="col-sm-10">
    <h2><fmt:message key="userList.heading"/></h2>

    <div id="actions" class="btn-group">
        <a class="btn btn-primary" href="<c:url value='/userform?method=Add&from=list'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></a>

<%--         <a class="btn btn-default" href="<c:url value='/home'/>"> --%>
<%--             <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a> --%>
    </div>

      
    <table id="userList" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th><fmt:message key="user.username"/></th>
                <th><fmt:message key="activeUsers.fullName"/></th>
                <th><fmt:message key="user.email"/></th>
                <th><fmt:message key="user.enabled"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="user.username"/></th>
                <th><fmt:message key="activeUsers.fullName"/></th>
                <th><fmt:message key="user.email"/></th>
                <th><fmt:message key="user.enabled"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${userList}" var="user" varStatus="idx">
        	<tr>
                <td>${user.username}</td>
              	<td>${user.fullName}</td>
              	<td>${user.email}</td>
                <td>
                	<input type="checkbox" disabled="disabled" <c:if test="${user.enabled}">checked="checked"</c:if>/>
                </td>
                <td>
                	<a href="<c:url value='/userform?from=list&id=${user.id}'/>" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script>
    	$('#userList').dataTable();
    </script>
</div>
