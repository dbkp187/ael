<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="accountingcus.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="accountingcus.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='accountingcus.heading'/></h2>
 	<form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="accountingcus" method="post" action="custom" id="accountingcusForm" cssClass="well">
    <form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <form:hidden path="docsgeneral.id"/>
    <div class="container-fluid">
    	<jsp:include page="fragment/custom/generalInput.jsp"></jsp:include>
    	<jsp:include page="fragment/custom/customFeeTables.jsp"></jsp:include>
    	<jsp:include page="fragment/custom/feeTables.jsp"></jsp:include>
	</div>
    <div class="form-group form-actions">
     <c:if test="${not empty accountingcus.id}">
						<a class="btn btn-success" href="custom/download?docId=${accountingcus.docsgeneral.id}">
							<i class="fa fa-print"></i>
							<fmt:message key="export.accounting.custom" />
						</a>
					</c:if>
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
<%--         <c:if test="${not empty accountingcus.id}"> --%>
<!--           <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)"> -->
<%--               <i class="fa fa-trash"></i> <fmt:message key="button.delete"/> --%>
<!--           </button> -->
<%--         </c:if> --%>
        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
    </form:form>
    <hr>
    <div class="row">
    	<div class="col-md-7"></div>
    	<div class="col-md-5">
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${accountingcus.creator.username}</span> on ${accountingcus.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${accountingcus.updator.username}</span> on ${accountingcus.lastUpdateDate}
    	</div>
    </div>
<div class="col-sm-12">
    
</div>
 
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>