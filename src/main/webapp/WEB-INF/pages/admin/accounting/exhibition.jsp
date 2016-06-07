<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="accountingExh.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="accountingExh.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='accountingExh.heading'/></h2>
 	<form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="exhibition" method="post" action="exhibition" id="exhibitionForm" cssClass="well">
    <div class="container-fluid">
    	<jsp:include page="fragment/exhibition/generalInput.jsp"></jsp:include>
    	<jsp:include page="fragment/exhibition/feeTables.jsp"></jsp:include>
    	<jsp:include page="fragment/exhibition/feeChiHoTables.jsp"></jsp:include>
	</div>
    <div class="form-group form-actions">
    <a class="btn btn-success" href="exhibition/download?id=${exhibition.id}">
							<i class="fa fa-print"></i>
							<fmt:message key="export.accounting.custom" />
						</a>
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
    </form:form>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>