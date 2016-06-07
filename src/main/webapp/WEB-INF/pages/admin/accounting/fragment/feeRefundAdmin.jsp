<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="feeRefundAcc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>


	<h2><fmt:message key="feeRefundAcc.heading"/></h2>
    <jsp:include page="searchFeeRefundAdmin.jsp"></jsp:include>
    <table id="refundList" class="display nestedDatatable" cellspacing="0" width="100%" 
    	childDetailURL="/admin/accounting/feeRefundDetail" 
    	emptyMessage="accounting.fees.detailFailed"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="packageInfo.masterFee" />,<fmt:message key="packageInfo.feeName" />,<fmt:message key="packageInfo.feevalue" />,<fmt:message key="packageInfo.feevavat" />,<fmt:message key="packageIngo.total" />,<fmt:message key="accounting.approval" />,<fmt:message key="accounting.approvalDate" />,<fmt:message key="accounting.feeAdminApproval" />,<fmt:message key="accounting.changeApproval" />"
    	detailTableMapping="masterFee.value,name.value,amount[money],vat[money],total[money],approvedText[Key],dateChange[Date],checkByAdminText[Key]"
    	editDetail="/admin/accounting/changeApproval"
    	actionCheck = "checkByAdmin:false,null"
    	successLoadMessage="accounting.fees.detailLoaded"
    	>
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="refund.date"/></th>
                <th><fmt:message key="refund.type"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="refund.date"/></th>
                <th><fmt:message key="refund.type"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${refundList}" var="refund" varStatus="idx">
        	<tr params="refundId=${refund.id}">
                <td>${idx.index+1}</td>
              	<td>${refund.employee.firstName}&nbsp;${refund.employee.lastName}</td>
              	<td><fmt:formatDate value="${refund.date}" pattern="yyyy-MM-dd"/></td>
              	<td>
              		<c:if test="${refund.isAdmin}">
              			<fmt:message key="refund.adminFee"/>
              		</c:if>
              		<c:if test="${!refund.isAdmin}">
              			<fmt:message key="refund.manifestFee"/>
              		</c:if>
              	</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>