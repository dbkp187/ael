<%@ include file="/common/taglibs.jsp"%>
<h3>
	<fmt:message key="exhibition.feeTables" />
</h3>
<hr>
<div role="tabpanel">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
    	<a href="#home" aria-controls="home" role="tab" data-toggle="tab">
    		<fmt:message key="exhibition.feeTablesDetail" />
		</a>
	</li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
    	<fmt:message key="exhibition.feeTablesSummary" />
    </a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<table id="exfeetableList" 
	class="display table table-condensed inFormTable feeTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th><fmt:message key="table.no" /></th>
			<th><fmt:message key="inland.masterFee" /></th>
			<th><fmt:message key="inland.feeName" /></th>
			<th><fmt:message key="inland.feevalue" /> <fmt:message key="(USD)" /></th>
			<th><fmt:message key="inland.feevavat" /></th>
			<th><fmt:message key="inland.total" /> <fmt:message key="(USD)" /></th>
			<th><fmt:message key="VND" /></th>
			<th><fmt:message key="table.action" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${exhibition.exfeetables}"
			var="exfeetable" varStatus="idx">
			<tr class="${exfeetable.isAdded == true ? 'hidden' :''}">
				<td colType="index">${idx.index+1}</td>
				<td colType="generalInfo" class="hidden"><form:hidden
						path="exfeetables[${idx.index}].id" /> <form:hidden
						path="exfeetables[${idx.index}].isAdded"
						valueType="added" /> <form:hidden
						path="exfeetables[${idx.index}].isDeleted"
						valueType="deleted" /></td>
				<td><spring:bind
						path="exhibition.exfeetables[${idx.index}].masterFee.id">
						<div addUrl="/admin/config/constant" type="25"
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:select empty-on-add="false"
						path="exfeetables[${idx.index}].masterFee.id"
						id="masterFee${idx.index}" autofocus="true"
						cssClass="form-control masterFee"
						items="${docsSelection.selections['exhmasterFeesReport']}" /> <form:errors
						path="exfeetables[${idx.index}].masterFee.id"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="exhibition.exfeetables[${idx.index}].name.id">
						<div addUrl="/admin/config/constant" type="26"
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:select path="exfeetables[${idx.index}].name.id" 
						id="name${idx.index}" cssClass="form-control" empty-on-add="false"
						items="${docsSelection.selections['exhFeeNamesReport']}" /> <form:errors
						path="exfeetables[${idx.index}].name.id"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="exhibition.exfeetables[${idx.index}].exhUsd">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].exhUsd"
						id="amount${idx.index}" maxlength="45" 
						cssClass="form-control amount money2" /> <form:errors
						path="exfeetables[${idx.index}].exhUsd"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="exhibition.exfeetables[${idx.index}].vat">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].vat"
						id="vat${idx.index}" maxlength="45" 
						cssClass="form-control vat money2" /> <form:errors
						path="exfeetables[${idx.index}].vat"
						cssClass="help-block" />
					</div></td>
				<td>
					<form:input path="exfeetables[${idx.index}].total"
						id="total${idx.index}" maxlength="45" 
						cssClass="form-control total money2" />
				</td>
				<td><spring:bind
						path="exhibition.exfeetables[${idx.index}].amount">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="exfeetables[${idx.index}].amount"
						id="amount${idx.index}" maxlength="45" 
						cssClass="form-control money" /> <form:errors
						path="exfeetables[${idx.index}].amount"
						cssClass="help-block" />
					</div></td>
				<td rowType="actions"><span class="iconButton removeRow"
					title="<fmt:message key='table.buttonEditTitle'/>"> <i
						class="fa fa-trash"></i>
				</span></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-2">
		<span class="btn btn-primary" target-table="exfeetableList"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>
	</div>
    <div role="tabpanel" class="tab-pane" id="profile">
    	<table id="exfeetableListSummary" class="display table table-striped">
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
<hr>
<script type="text/javascript" src="<c:url value='/scripts/custom/feeTables.js'></c:url>"></script>