<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="packageInfoList.title"/></title>
    <meta name="menu" content="DocsMenu"/>
</head>
<div class="col-sm-10">
    <h2><fmt:message key="packageInfoList.heading"/></h2>
    <jsp:include page="fragment/packageInfo/searchPackageInfo.jsp"></jsp:include>
    <div id="actions" class="btn-group">
    	 <a class="btn btn-primary" href="<c:url value='packageInfo?method=Add&from=list'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></a>
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="packageInfoList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="packageInfo.jobNo"/></th>
                <th><fmt:message key="packageInfo.customerCode"/></th>
                <th><fmt:message key="configuration.typeOfImport"/></th>
                <th><fmt:message key="packageInfo.typeOfContainer"/></th>
                <th><fmt:message key="packageInfo.cusDecOnNo"/></th>
                <th><fmt:message key="packageInfo.doRelease"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="packageInfo.jobNo"/></th>
                <th><fmt:message key="packageInfo.customerCode"/></th>
                <th><fmt:message key="configuration.typeOfImport"/></th>
                <th><fmt:message key="packageInfo.typeOfContainer"/></th>
                <th><fmt:message key="packageInfo.cusDecOnNo"/></th>
                <th><fmt:message key="packageInfo.doRelease"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${packageinfoList}" var="packageInfo" varStatus="idx">
        	<tr class="${packageInfo.docsgeneral.doDelivery ? '':'impress' }">
                <td>${idx.index+1}</td>
              	<td>${packageInfo.docsgeneral.jobNo}</td>
              	<td>${packageInfo.docsgeneral.customer.code}</td>
              	<td>${packageInfo.docsgeneral.typeOfImport.value}</td>
              	<td>${packageInfo.docsgeneral.typeOfContainer.value}</td>
              	<td>${packageInfo.cusDecOnNo}</td>
              	<td>
              		<c:if test="${packageInfo.doRelease}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
              	<td>
              		<c:if test="${packageInfo.docsgeneral.doDelivery}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="packageInfo?id=${packageInfo.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

