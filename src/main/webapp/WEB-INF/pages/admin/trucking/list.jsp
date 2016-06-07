<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="truckingList.title"/></title>
    <meta name="menu" content="TrackingMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="truckingList.heading"/></h2>
    <jsp:include page="searchTrucking.jsp"></jsp:include>
    <table id="truckingList" class="display datatable" cellspacing="0" width="100%" order="5">
        <thead>
            <tr>
<%--             	<th><fmt:message key="table.no"/></th> --%>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.status"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="truckingservice.doDelivery"/></th>
                <th><fmt:message key="packageInfo.po"/></th>
                <th><fmt:message key="notify.lastUpdated"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
<%--                 <th><fmt:message key="table.no"/></th> --%>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.status"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="truckingservice.doDelivery"/></th>
                <th><fmt:message key="packageInfo.po"/></th>
                <th><fmt:message key="notify.lastUpdated"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${docsgeneralList}" var="trucking" varStatus="idx">
        	<tr class="${trucking.doAccounting ? '':'impress' }">
<%--                 <td>${idx.index+1}</td> --%>
              	<td>${trucking.jobNo}</td>
              	<td><fmt:message key="${trucking.typeOfDocs.textKey}"/></td>
              	<td>${trucking.typeOfContainer.value}</td>
              	<td>
              		<c:if test="${trucking.doAccounting}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
              	<td>
	              	<c:if test="${not empty trucking.truckingservice}">
              			<fmt:formatDate value="${trucking.truckingservice.createdDate}" pattern="dd/MM/yyyy"/>
              		</c:if>
              	<td>
              		<c:if test="${trucking.truckingservice.doDelivery}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
              	<td>
              		<c:if test="${trucking.packageinfo != null}">
              			${trucking.packageinfo.po}
              		</c:if>
              	</td>
              	<td>
              		<c:if test="${trucking.packageinfo != null}">
              			<fmt:formatDate value="${trucking.packageinfo.lastUpdateDate}" pattern="yyyy-MM-dd HH:mm"/>
              		</c:if>
              		<c:if test="${trucking.inland != null}">
              			<fmt:formatDate value="${trucking.inland.lastUpdateDate}" pattern="yyyy-MM-dd HH:mm"/>
              		</c:if>
              		<c:if test="${trucking.exhibition != null}">
              			<fmt:formatDate value="${trucking.exhibition.lastUpdateDate}" pattern="yyyy-MM-dd HH:mm"/>
              		</c:if>
              	</td>
                <td>
                	<a href="service?docId=${trucking.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

