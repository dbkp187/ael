<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>


	<h2><fmt:message key="feeNhathauTableAcc.heading"/></h2>
    <jsp:include page="searchFeeNhathauTables.jsp"></jsp:include>    
    <table id="truckingList1" class="display nestedDatatable" cellspacing="0" width="100%" 
    	childDetailURL="/admin/accounting/feeNhathauDetail" 
    	emptyMessage="accounting.fees.detailFailed"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="packageInfo.masterFee" />,<fmt:message key="packageInfo.feeName" />,<fmt:message key="packageInfo.feevalue" />,<fmt:message key="packageInfo.feevavat" />,<fmt:message key="packageIngo.total" />,<fmt:message key="accounting.kt.approval" />,<fmt:message key="accounting.approvalDate" />,<fmt:message key="accounting.feeAdminApproval" />,<fmt:message key="accounting.changeApproval" />"
    	detailTableMapping="masterFee.value,name.value,amount[money],vat[money],total[money],approvedText[Key],dateChange[Date],checkByAdminText[Key]"
    	editDetail="/admin/accounting/changeApproval"
    	actionCheck = "checkByAdmin:false,null"
    	successLoadMessage="accounting.fees.detailLoaded"
    	>
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="accounting.nhathau"/></th>
                <th><fmt:message key="contseal.noOfCont" /></th>
                <th><fmt:message key="contseal.typeOfCont" /></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="accounting.nhathau"/></th>
                <th><fmt:message key="contseal.noOfCont" /></th>
                <th><fmt:message key="contseal.typeOfCont" /></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.typeOfContainer"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${truckingdetailList}" var="trucking" varStatus="idx">
        	<tr params="truckId=${trucking.id}">
                <td>${idx.index+1}</td>
              	<td>${trucking.truckingservice.docsgeneral.jobNo}</td>
                <td>${trucking.nhathau.code }</td>
              	<td>${trucking.consteal.noOfCont }</td>
              	<td>${trucking.consteal.typeOfCont.value}</td>
              	<td><fmt:message key="${trucking.truckingservice.docsgeneral.typeOfDocs.textKey}"/></td>
              	<td>${trucking.truckingservice.docsgeneral.typeOfContainer.value}</td>
              	<td><fmt:formatDate value="${trucking.dateDev}" pattern="dd/MM/yyyy"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>