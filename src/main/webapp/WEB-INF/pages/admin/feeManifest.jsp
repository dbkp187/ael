<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

	<h2><fmt:message key="feeTablesacc.heading"/></h2>
	<jsp:include page="searchFeeTables.jsp"></jsp:include>
    <table id="truckingList" class="display nestedDatatable" cellspacing="0" width="100%" 
    	childDetailURL="/admin/accounting/feesDetail" 
    	emptyMessage="accounting.fees.detailFailed"
    	detailTableInfo="<fmt:message key='table.no'/>,
    					Refcode,
    					<fmt:message key='packageInfo.masterFee' />,
    					<fmt:message key='packageInfo.feeName' />,
    					<fmt:message key='packageInfo.feevalue' />,
    					<fmt:message key='packageInfo.feevavat' />,
    					<fmt:message key='packageIngo.total' />,
    					<fmt:message key='accounting.kt.approval' />,
    			    	<fmt:message key='accounting.feeAdminApproval' />,
    					<fmt:message key='accounting.approvalDate' />,
    					<fmt:message key='accounting.voucherNo' />,
    					<fmt:message key='accounting.payDate' />" 
    	editDetail=""
    	actionCheck=""
    	detailTableMapping="refCode,masterFee.value,name.value,amount[money],vat[money],total[money],approvedText[Key],checkByAdminText[Key],dateChange[Date],voucherNo,payDate"
    	successLoadMessage="accounting.fees.detailLoaded">

        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${docsgeneralList}" var="docs" varStatus="idx">
        	<tr params="docId=${docs.id}">
                <td>${idx.index+1}</td>
              	<td>${docs.jobNo}</td>
              	<td><fmt:message key="${docs.typeOfDocs.textKey}"/></td>
              	<td>${docs.typeOfContainer.value}</td>
              	<td><fmt:formatDate value="${docs.docReceiveDate}" pattern="dd/MM/yyyy"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>