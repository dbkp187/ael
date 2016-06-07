<%@ include file="/common/taglibs.jsp"%>
<table id="docservice" class="display table table-condensed inFormTable"
	cellspacing="0" width="100%">
	<thead>
		<tr>
			<th><fmt:message key="table.no" /></th>
			<th><fmt:message key="docservice.nameOfServices" /></th>
			<th><fmt:message key="docservice.regDate" /></th>
			<th><fmt:message key="docservice.regNo" /></th>
			<th><fmt:message key="docservice.typeCO" /></th>
			<th><fmt:message key="docservice.getDate" /></th>
			<th><fmt:message key="docservice.revDate" /></th>
			<th><fmt:message key="table.action" /></th>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${packageInfo.docsgeneral.docservices}" var="ser"
			varStatus="idx">
			<tr class="${ser.isAdded == true ? 'hidden' :''}">
				<td colType="index">${idx.index+1}</td>
				<td colType="generalInfo" class="hidden"><form:hidden
						path="docsgeneral.docservices[${idx.index}].id" /> <form:hidden
						path="docsgeneral.docservices[${idx.index}].isAdded"
						valueType="added" /> <form:hidden
						path="docsgeneral.docservices[${idx.index}].isDeleted"
						valueType="deleted" /></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].nameOfServices.id">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="0">
					</spring:bind> <form:select
						path="docsgeneral.docservices[${idx.index}].nameOfServices.id"
						id="nameOfServices${idx.index}"  empty-on-add="false"
						cssClass="form-control"
						items="${docsSelection.selections['services']}" /> <form:errors
						path="docsgeneral.docservices[${idx.index}].nameOfServices.id"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].regDate">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="docsgeneral.docservices[${idx.index}].regDate"
						provide="datepicker" id="regDate${idx.index}"
						 cssClass="form-control" /> <form:errors
						path="docsgeneral.docservices[${idx.index}].regDate"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].regNo">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="docsgeneral.docservices[${idx.index}].regNo"
						id="regNo${idx.index}"  cssClass="form-control" maxlength="45"/>
					<form:errors path="docsgeneral.docservices[${idx.index}].regNo"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].typeCO">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="docsgeneral.docservices[${idx.index}].typeCO"
						id="typeCO${idx.index}"  cssClass="form-control" maxlength="45"/>
					<form:errors path="docsgeneral.docservices[${idx.index}].typeCO"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].getDate">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="docsgeneral.docservices[${idx.index}].getDate"
						provide="datepicker" id="getDate${idx.index}"
						 cssClass="form-control" /> <form:errors
						path="docsgeneral.docservices[${idx.index}].getDate"
						cssClass="help-block" />
					</div></td>
				<td><spring:bind
						path="docsgeneral.docservices[${idx.index}].revDate">
						<div
							class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> <form:input path="docsgeneral.docservices[${idx.index}].revDate"
						provide="datepicker" id="regDate${idx.index}"
						 cssClass="form-control" /> <form:errors
						path="docsgeneral.docservices[${idx.index}].revDate"
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
		<span class="btn btn-primary" target-table="docservice"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>