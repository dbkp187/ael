<%@ include file="/common/taglibs.jsp"%>
<div class="row">
	<div class="form-group col-md-3">
		<appfuse:label styleClass="control-label"
			key="accountingnhathau.name" />
		<form:input path="nhathau.name" maxlength="45" autofocus="true"
			cssClass="form-control" disabled="true" />
	</div>
	<div class="form-group col-md-3">
		<appfuse:label styleClass="control-label"
			key="accountingnhathau.address" />
		<form:input path="nhathau.address" maxlength="45" autofocus="true"
			cssClass="form-control" disabled="true" />
	</div>
	<div class="form-group col-md-3">
		<appfuse:label styleClass="control-label"
			key="accountingnhathau.taxno" />
		<form:input path="nhathau.taxNo" maxlength="45" autofocus="true"
			cssClass="form-control" disabled="true" />
	</div>

</div>