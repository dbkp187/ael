<%@ include file="/common/taglibs.jsp"%>
<div role="tabpanel">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
    	<a href="#home" aria-controls="home" role="tab" data-toggle="tab">
    		<fmt:message key="exhibition.feeTablesDetail" />
		</a>
	</li>
    <li role="presentation" class="hidden"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
    	<fmt:message key="exhibition.feeTablesSummary" />
    </a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<table id="refundExfeetableList" 
	class="display table table-condensed inFormTable feeTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th><fmt:message key="table.no" /></th>
			<th><fmt:message key="refund.fileCus"/></th>
			<th><fmt:message key="packageInfo.masterFee" /></th>
			<th><fmt:message key="packageInfo.feeName" /></th>
			<th><fmt:message key="packageInfo.feevalue" /></th>
			<th><fmt:message key="packageInfo.feevavat" /></th>
			<th><fmt:message key="packageInfo.feevat" /></th>
			<th><fmt:message key="packageIngo.total" /></th>
			<th><fmt:message key="inland.feeInvoiceNo" /></th>
<%-- 			<th><fmt:message key="refund.accApproved" /></th> --%>
<%-- 			<th><fmt:message key="refund.adminApproved" /></th> --%>
			<th><fmt:message key="table.action" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${refund.exfeetables}"
			var="exfeetable" varStatus="idx">
			<tr class="${exfeetable.isAdded == true ? 'hidden' :''} ${exfeetable.isDuplicated ? 'impress' : ''}" readonly="${empty exfeetable.approved or exfeetable.approved == false ? '':'readonly'}">
				<td colType="index">${idx.index+1}</td>
				<td colType="generalInfo" class="hidden"><form:hidden
						path="exfeetables[${idx.index}].id" /> <form:hidden
						path="exfeetables[${idx.index}].isAdded"
						valueType="added" /> <form:hidden
						path="exfeetables[${idx.index}].isDeleted"
						valueType="deleted" />
						 <form:hidden
						path="exfeetables[${idx.index}].approved"
						/> 
						<form:hidden
						path="exfeetables[${idx.index}].checkByAdmin" 
 						/>  
						<form:hidden
						path="exfeetables[${idx.index}].dateChange"
						/>
				</td>
				 <td>
	            		<spring:bind path="refund.exfeetables[${idx.index}].docsgeneral.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:select path="exfeetables[${idx.index}].docsgeneral.id" id="docs${idx.index}" cssClass="form-control" items="${docsSelection.selections['docs']}" empty-on-add="false"/>
					        <form:errors path="exfeetables[${idx.index}].docsgeneral.id" cssClass="help-block"/>
					    </div>
	            </td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].masterFee.id">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:select
						path="exfeetables[${idx.index}].masterFee.id"
						id="masterFee${idx.index}" 
						cssClass="form-control masterFee" empty-on-add="false"
						items="${docsSelection.selections['masterFees']}" /> <form:errors
						path="exfeetables[${idx.index}].masterFee.id"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].name.id">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="19">
					</spring:bind> <form:select path="exfeetables[${idx.index}].name.id"
						id="name${idx.index}"  cssClass="form-control" empty-on-add="false"
						items="${docsSelection.selections['exhFeeNames']}" /> <form:errors
						path="exfeetables[${idx.index}].name.id"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].amount">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].amount"
						id="amount${idx.index}" maxlength="16"  
						cssClass="form-control money amount" /> <form:errors
						path="exfeetables[${idx.index}].amount"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].vat">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].vat"
						id="vat${idx.index}" maxlength="6"  
						cssClass="form-control money vat" /> <form:errors
						path="exfeetables[${idx.index}].vat"
						cssClass="help-block" />
					</div>
				</td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].vatAmount">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].vatAmount"
						id="vatAmount${idx.index}" maxlength="16"  
						cssClass="form-control money vatAmount" /> <form:errors
						path="exfeetables[${idx.index}].vatAmount"
						cssClass="help-block" />
					</div>
				</td>
				<td>
					<form:input path="exfeetables[${idx.index}].total"
						id="total${idx.index}" maxlength="17"  
						cssClass="form-control money total"/>
				</td>
				<td><spring:bind
						path="refund.exfeetables[${idx.index}].invoiceNo">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].invoiceNo"
						id="amount${idx.index}" maxlength="45" 
						cssClass="form-control" /> <form:errors
						path="exfeetables[${idx.index}].invoiceNo"
						cssClass="help-block" />
					</div></td>
<!-- 					<td verify="true"> -->
<%-- 					<form:checkbox path="exfeetables[${idx.index}].approved" disabled="true"/> --%>
<%-- 					<security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> --%>
<%-- 				  				<c:if test="${refund.doApproval==true}"> --%>
<%-- 				  					<form:hidden path="doApproval" /> --%>
<%-- 				  				</c:if> --%>
<%-- 			  				</security:authorize> --%>
<!-- 					</td> -->
<!-- 					<td verify="true"> -->
<%-- 					<form:checkbox path="exfeetables[${idx.index}].checkByAdmin" disabled="true"/> --%>
<%-- 					<security:authorize ifNotGranted="ROLE_ADMIN"> --%>
<%-- 				  				<c:if test="${refund.doApproval==true}"> --%>
<%-- 				  					<form:hidden path="doApproval" /> --%>
<%-- 				  				</c:if> --%>
<%-- 			  				</security:authorize> --%>
<!-- 					</td> -->
					<td rowType="actions">
					<c:if test="${(empty refund.doApproval or refund.doApproval==false) and (empty exfeetable.approved or exfeetable.approved == false) }">
						<span class="iconButton removeRow"
							title="<fmt:message key='table.buttonEditTitle'/>"> <i
								class="fa fa-trash"></i>
						</span>
					</c:if>
					</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${ empty refund.doApproval or refund.doApproval==false }">
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-2">
		<span class="btn btn-primary" target-table="refundExfeetableList"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>
</c:if>
	</div>
    <div role="tabpanel" class="tab-pane" id="profile">
    	<table id="refundExfeetableListSummary" class="display table table-striped">
			<thead>
				<tr>
					<th><fmt:message key="table.no" /></th>
					<th><fmt:message key="inland.masterFee" /></th>
					<th><fmt:message key="inland.total" /></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
  </div>
</div>

<script type="text/javascript" src="<c:url value='/scripts/custom/feeTables.js'></c:url>"></script>
