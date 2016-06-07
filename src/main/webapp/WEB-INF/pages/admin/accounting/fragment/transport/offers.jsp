<%@ include file="/common/taglibs.jsp" %>

<div class="col-sm-12">
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
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${sales}" var="offerPrice" varStatus="idx">
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
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

