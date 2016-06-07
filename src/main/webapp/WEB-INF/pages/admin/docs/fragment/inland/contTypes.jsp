<%@ include file="/common/taglibs.jsp"%>
<div id="contTypesListContainer">
	<table id="contTypesList" class="display table table-condensed inFormTable contImportable" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><fmt:message key="table.no" /></th>
				<th><fmt:message key="multitype.type" /></th>
				<th><fmt:message key="multitype.amount" /></th>
				<th><fmt:message key="table.action" /></th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${inland.docsgeneral.contTypes}" var="multitype"
				varStatus="idx">
				<tr class="${multitype.isAdded == true ? 'hidden' :''}">
					<td colType="index">${idx.index+1}</td>
					<td colType="generalInfo" class="hidden"><form:hidden
							path="docsgeneral.contTypes[${idx.index}].id" /> <form:hidden
							path="docsgeneral.contTypes[${idx.index}].isAdded"
							valueType="added" /> <form:hidden
							path="docsgeneral.contTypes[${idx.index}].isDeleted"
							valueType="deleted" /></td>

					<td><spring:bind
							path="inland.docsgeneral.contTypes[${idx.index}].type.id" >
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="10">
						</spring:bind> <form:select path="docsgeneral.contTypes[${idx.index}].type.id"
							id="type${idx.index}" autofocus="true" cssClass="form-control" empty-on-add="false"
							items="${docsSelection.selections['typeOfContainerConts']}" /> <form:errors
							path="docsgeneral.contTypes[${idx.index}].type.id"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="inland.docsgeneral.contTypes[${idx.index}].amount">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contTypes[${idx.index}].amount"
							id="noOfCont${idx.index}" maxlength="10" autofocus="true"
							cssClass="form-control number" /> <form:errors
							path="docsgeneral.contTypes[${idx.index}].amount"
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
		<span class="btn btn-primary" target-table="contTypesList"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>
</div>
