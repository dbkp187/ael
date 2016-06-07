<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="inlandList.title"/></title>
    <meta name="menu" content="DocsMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="inlandList.heading"/></h2>
    <jsp:include page="fragment/inland/searchInland.jsp"></jsp:include>    
    <div id="actions" class="btn-group">
    	 <a class="btn btn-primary" href="<c:url value='inland?method=Add&from=list'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.addInland"/></a>
         <a class="btn btn-primary" href="<c:url value='inland?method=Add&from=list&type=sealand'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.addSealand"/></a>
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="inlandList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="inland.jobNo"/></th>
                <th><fmt:message key="inland.customerCode"/></th>
                <th><fmt:message key="inland.typeOfContainer"/></th>
                <th><fmt:message key="configuration.typeOfImport"/></th>
                <th><fmt:message key="inland.inlandsealand"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                 <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="inland.jobNo"/></th>
                <th><fmt:message key="inland.customerCode"/></th>
                <th><fmt:message key="inland.typeOfContainer"/></th>
                <th><fmt:message key="configuration.typeOfImport"/></th>
                <th><fmt:message key="inland.inlandsealand"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${inlandList}" var="inland" varStatus="idx">
        	<tr class="${inland.docsgeneral.doDelivery ? '':'impress' }">
                <td>${idx.index+1}</td>
              	<td>${inland.docsgeneral.jobNo}</td>
              	<td>${inland.docsgeneral.customer.code}</td>
              	<td>${inland.docsgeneral.typeOfContainer.value}</td>
              	<td>${inland.typeOfInland.value}</td>
              	<td>
              		<c:if test="${inland.isInland == false}"><fmt:message key='inland.sealand'/></c:if>
     				<c:if test="${inland.isInland != false}"><fmt:message key='inland.inland'/></c:if>
              	</td>
              	<td>
              		<c:if test="${inland.docsgeneral.doDelivery}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="inland?id=${inland.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

