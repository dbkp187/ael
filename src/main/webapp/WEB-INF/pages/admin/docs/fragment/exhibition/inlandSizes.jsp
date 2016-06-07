<%@ include file="/common/taglibs.jsp"%>
<div id="inlandSizesContainer">
<table id="inlandsizes"
	class="display table table-condensed inFormTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th><fmt:message key="table.no" /></th>
			<th><fmt:message key="inlandsize.deep" /></th>
			<th><fmt:message key="inlandsize.width" /></th>
			<th><fmt:message key="inlandsize.height" /></th>
			<th><fmt:message key="inlandsize.kg" /></th>
			<th><fmt:message key="table.action" /></th>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${exhibition.docsgeneral.inlandsizes}" var="ser"
			varStatus="idx">
			<tr class="${ser.isAdded == true ? 'hidden' :''}">
			<td colType="index">${idx.index+1}</td>
			<td colType="generalInfo" class="hidden">
				<form:hidden
							path="docsgeneral.inlandsizes[${idx.index}].id" /> 
				<form:hidden
							path="docsgeneral.inlandsizes[${idx.index}].isAdded"
							valueType="added" /> 
				<form:hidden
							path="docsgeneral.inlandsizes[${idx.index}].isDeleted"
							valueType="deleted" />
			</td>
				<td><spring:bind
					path="exhibition.docsgeneral.inlandsizes[${idx.index}].deep">
						<div
						class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					
				</spring:bind> <form:input path="docsgeneral.inlandsizes[${idx.index}].deep"
					id="deep${idx.index}" maxlength="10" autofocus="true"
					cssClass="form-control number" /> <form:errors
					path="docsgeneral.inlandsizes[${idx.index}].deep"
					cssClass="help-block" />
					</div></td>
				<td><spring:bind
					path="exhibition.docsgeneral.inlandsizes[${idx.index}].width">
						<div
						class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					
				</spring:bind> <form:input path="docsgeneral.inlandsizes[${idx.index}].width"
					id="width${idx.index}" maxlength="10" autofocus="true"
					cssClass="form-control number" /> <form:errors
					path="docsgeneral.inlandsizes[${idx.index}].width"
					cssClass="help-block" />
					</div></td>
				<td><spring:bind
					path="exhibition.docsgeneral.inlandsizes[${idx.index}].height">
						<div
						class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					
				</spring:bind> <form:input path="docsgeneral.inlandsizes[${idx.index}].height"
					id="height${idx.index}" maxlength="10" autofocus="true"
					cssClass="form-control number" /> <form:errors
					path="docsgeneral.inlandsizes[${idx.index}].height"
					cssClass="help-block" />
					</div></td>
				<td><spring:bind
					path="exhibition.docsgeneral.inlandsizes[${idx.index}].kg">
						<div
						class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					
				</spring:bind> <form:input path="docsgeneral.inlandsizes[${idx.index}].kg"
					id="kg${idx.index}" maxlength="10" autofocus="true"
					cssClass="form-control money2" /> <form:errors
					path="docsgeneral.inlandsizes[${idx.index}].kg"
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
	<div class="col-md-4">
		<span class="btn btn-primary" target-table="inlandsizes"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>
</div>
