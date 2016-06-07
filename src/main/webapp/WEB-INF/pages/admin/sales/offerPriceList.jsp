<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="offerPriceList.title"/></title>
    <meta name="menu" content="SalesMenu"/>
</head>

<div class="col-sm-12">
    <h2><fmt:message key="offerPriceList.heading"/></h2>
    <div id="actions" class="btn-group">
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="offerPriceList" class="display nestedDatatable" cellspacing="0" width="100%"
    	childDetailURL="/admin/sales/offerItemList/list" 
    	emptyMessage="customer.offerItems.empty"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="offerItem.nameOfService"/>,<fmt:message key="offerItem.feeWithVAT"/>,<fmt:message key="offerItem.feeNoVAT"/>,<fmt:message key="offerItem.currency"/>,<fmt:message key="offerItem.feeUnit"/>"
    	detailTableMapping="nameOfService.value,feeWithVAT[money],feeNoVAT[money],currency.value,feeUnit.value"
    	editDetail=""
    	successLoadMessage="customer.offerItems.loaded"
    	>
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="customer.code"/></th>
                <th><fmt:message key="customer.name"/></th>
                <th><fmt:message key="offerPrice.typeOfService"/></th>
                <th><fmt:message key="offerPrice.dateOffer"/></th>
                <th><fmt:message key="offerPrice.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/>
                <th><fmt:message key="customer.code"/></th>
                <th><fmt:message key="customer.name"/></th>
                <th><fmt:message key="offerPrice.typeOfService"/></th>
                <th><fmt:message key="offerPrice.dateOffer"/></th>
                <th><fmt:message key="offerPrice.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${offerPriceList}" var="offerPrice" varStatus="idx">
        	<tr params="offerId=${offerPrice.id}">
                <td colType="index">${idx.index+1}</td>
              	<td>${offerPrice.customer.code}</td>
              	<td>${offerPrice.customer.name}</td>
              	<td><fmt:message key="${offerPrice.typeOfServiveText}"/></td>
              	<td><fmt:formatDate value="${offerPrice.dateOffer}" pattern="yyyy-MM-dd"/></td>
              	<td class="centerText">
              		<c:if test="${offerPrice.isValid}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="offerPrice?id=${offerPrice.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

