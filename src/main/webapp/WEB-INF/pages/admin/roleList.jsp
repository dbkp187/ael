<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="roleList.title"/></title>
    <meta name="menu" content="AdminMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="roleList.heading"/></h2>

    <table id="roleList" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th><fmt:message key="role.name"/></th>
                <th><fmt:message key="role.description"/></th>
<%--                 <th><fmt:message key="table.action"/></th> --%>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
               <th><fmt:message key="role.name"/></th>
                <th><fmt:message key="role.description"/></th>
<%--                 <th><fmt:message key="table.action"/></th> --%>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${roleList}" var="role" varStatus="idx">
        	<tr>
                <td>${role.name}</td>
              	<td>${role.description}</td>
<!--                 <td> -->
<%--                 	<a class="iconButton" editRole='${role.id}' title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a> --%>
<%--                 	<c:if test="${role.id>0 }"> --%>
<%--                 		<a class="iconButton" title="<fmt:message key='table.buttonRemoveTitle'/>"><i class="fa fa-trash-o"></i></a> --%>
<%--                 	</c:if> --%>
<!--                 </td> -->
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script>
    	$('#roleList').dataTable();
    </script>
</div>

