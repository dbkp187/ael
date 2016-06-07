<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accounting.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="accounting.heading"/></h2>
    <jsp:include page="fragment/exhibition/searchAccExhibition.jsp"></jsp:include>
    <table id="truckingList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="exhibition.devDate"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="exhibition.devDate"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${docsgeneralList}" var="trucking" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
              	<td>${trucking.jobNo}</td>
              	<td><fmt:formatDate value="${trucking.docReceiveDate}" pattern="dd/MM/yyyy"/></td>
              	<td><fmt:message key="${trucking.typeOfDocs.textKey}"/></td>
              	<td>${trucking.typeOfContainer.value}</td>
                <td>
                	<a href="exhibition?id=${trucking.exhibition.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-file-text-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

