<%@ include file="/common/taglibs.jsp"%>
<div id="contsealListContainer">
	<table id="contsealList"
		class="display table table-condensed inFormTable" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><fmt:message key="table.no" /></th>
				<th><fmt:message key="contseal.noOfCont" /></th>
				<th><fmt:message key="contseal.typeOfCont" /></th>
				<th><fmt:message key="contseal.noSeal" /></th>
				<th><fmt:message key="contseal.depotDev" /></th>
				<th><fmt:message key="contseal.weight" /></th>
				<th><fmt:message key="table.action" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${inland.docsgeneral.contseals}"
				var="contseal" varStatus="idx">
				<tr class="${contseal.isAdded == true ? 'hidden' :''}">
					<td colType="index">${idx.index+1}</td>
					<td colType="generalInfo" class="hidden"><form:hidden
							path="docsgeneral.contseals[${idx.index}].id" /> <form:hidden
							path="docsgeneral.contseals[${idx.index}].isAdded"
							valueType="added" /> <form:hidden
							path="docsgeneral.contseals[${idx.index}].isDeleted"
							valueType="deleted" /></td>
					<td><spring:bind
							path="inland.docsgeneral.contseals[${idx.index}].noOfCont">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].noOfCont"
							id="noOfCont${idx.index}" maxlength="45" 
							cssClass="form-control cont" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].noOfCont"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="inland.docsgeneral.contseals[${idx.index}].typeOfCont.id">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="10">
						</spring:bind> <form:select
							path="docsgeneral.contseals[${idx.index}].typeOfCont.id" empty-on-add="false"
							id="typeOfCont${idx.index}" 
							cssClass="form-control contType"
							items="${docsSelection.selections['typeOfContainerConts']}" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].typeOfCont.id"
							cssClass="help-block " />
						</div></td>
					<td><spring:bind
							path="inland.docsgeneral.contseals[${idx.index}].noSeal">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].noSeal"
							id="noSeal${idx.index}" maxlength="45" 
							cssClass="form-control seal" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].noSeal"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="inland.docsgeneral.contseals[${idx.index}].depotDev">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].depotDev"
							id="noOfPKGS${idx.index}" maxlength="45" 
							cssClass="form-control" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].depotDev"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="inland.docsgeneral.contseals[${idx.index}].weight">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].weight"
							id="weight${idx.index}" maxlength="12" 
							cssClass="form-control money2" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].weight"
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
		<div class="col-md-8"></div>
		<div class="col-md-2"><input type="file" name="xlfile" id="xlf" class="fileStyle btn btn-success fa fa-upload"  data-filename-placement="inside" title=" <fmt:message key='inland.uploadCont'/>"/></div>
		<div class="col-md-2">
			<span class="btn btn-primary" target-table="contsealList"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
		</div>
	</div>
</div>
<script src="<c:url value='/scripts/libs/xls/shim.js'/>"></script>
<script src="<c:url value='/scripts/libs/xls/xls.js'/>"></script>
<script src="<c:url value='/scripts/excelUtil.js'/>"></script>
<script type="text/javascript">
var CONT_IMPORT = {
	fileId : 	'xlf',
	tableId : 'contsealList'
};
</script>
<script src="<c:url value='/scripts/custom/importCont.js'/>"></script>
