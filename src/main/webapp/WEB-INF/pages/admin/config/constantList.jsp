<%@ include file="/common/taglibs.jsp" %>
<%@ page import="com.vn.ael.enums.ConfigurationType" %>

<head>
    <title><fmt:message key="configuration.title"/></title>
    <meta name="menu" content="AdminMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="configuration.heading"/></h2>
 	<div id="actions" class="btn-group">
        <a class="btn btn-primary" href="<c:url value='constantForm?method=Add&from=list'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></a>

        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="constants" class="display datatable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="configuration.value"/></th>
                <th><fmt:message key="configuration.description"/></th>
                <th><fmt:message key="configuration.type"/></th>
<%--                 <th><fmt:message key="configuration.enabled"/></th> --%>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="configuration.value"/></th>
                <th><fmt:message key="configuration.description"/></th>
                <th><fmt:message key="configuration.type"/></th>
<%--                 <th><fmt:message key="configuration.enabled"/></th> --%>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${configurationList}" var="cons" varStatus="idx">
        	<tr>
        		<td>${idx.index+1}</td>
                <td>${cons.value}</td>
              	<td>${cons.description}</td>
              	<td><fmt:message key="${cons.textType}"/></td>
<!--               	<td> -->
<%--               		<input type="checkbox" disabled="disabled" <c:if test="${cons.enabled}">checked="checked"</c:if>/> --%>
<!--               	</td> -->
              	<td>
              		<c:if test="${cons.enabled}">
                		<a href="constantForm?id=${cons.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                	</c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

