<%@ include file="/common/taglibs.jsp"%>
<head>
<title><fmt:message key="nhathau.title" /></title>
<meta name="menu" content="AdminMenu" />
<meta name="child" content="true" />
</head>
<c:set var="delObject" scope="request">
	<fmt:message key="bank.title" />
</c:set>
<script type="text/javascript">
	var msgDelConfirm = "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
<h2>
	<fmt:message key='nhathau.heading' />
</h2>

<div class="col-sm-12">
	<form:form commandName="bank" method="post" action="bankForm"
		id="bankForm" cssClass="well">
		<form:hidden path="id" />
		<div class="container-fluid">
			<div class="row">
				<spring:bind path="bank.name">
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label" key="bank.name" />
						<form:input path="name" maxlength="255" cssClass="form-control" />
					</div>
				</spring:bind>
				<spring:bind path="bank.code">
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label" key="bank.code" />
						<form:input path="code" maxlength="255" cssClass="form-control" />
					</div>
				</spring:bind>

				<spring:bind path="bank.accountNo">
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label" key="bank.accountNo" />
						<form:input path="accountNo" maxlength="255" cssClass="form-control" />
					</div>
				</spring:bind>
				<spring:bind path="bank.branch">
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label" key="bank.branch" />
						<form:input path="branch" maxlength="255" cssClass="form-control" />
					</div>
				</spring:bind>
			</div>
		</div>
		<div class="form-group form-actions">
			<button type="submit" class="btn btn-primary" name="save"
				onclick="bCancel=false">
				<i class="fa fa-floppy-o"></i>
				<fmt:message key="button.save" />
			</button>
			<%-- <c:if test="${not empty bank.id}">
				<button type="submit" class="btn btn-danger" name="delete"
					onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
					<i class="fa fa-trash"></i>
					<fmt:message key="button.delete" />
				</button>
			</c:if> --%>
			<button type="submit" class="btn btn-default" name="cancel"
				onclick="bCancel=true">
				<i class="fa fa-sign-out"></i>
				<fmt:message key="button.cancel" />
			</button>
		</div>
		<hr>
	</form:form>
</div>

<v:javascript formName="bankForm" cdata="false" dynamicJavascript="true"
	staticJavascript="false" />
<script type="text/javascript"
	src="<c:url value='/scripts/validator.jsp'/>"></script>