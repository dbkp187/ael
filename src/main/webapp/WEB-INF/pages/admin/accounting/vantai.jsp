<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="accountingvantai.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="accountingvantai.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='${type }'/> - ${accountingVantai.condition.month}/${accountingVantai.condition.year}</h2>
 	<form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="accountingVantai" method="post" action="vantai" id="accountingVantaiForm" cssClass="well">
	    <form:hidden path="condition.transId"/>
	    <form:hidden path="condition.month"/>
	    <form:hidden path="condition.year"/>
	    
	    <div class="container-fluid">
    		<%-- <jsp:include page="fragment/nhathau/generalInput.jsp"></jsp:include> --%>
    		<jsp:include page="fragment/vantai/vantaiTable.jsp"></jsp:include>
    	</div>
        
	    <%-- <div class="form-group form-actions">
	        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
	            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
	        </button>
	        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
	            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
	        </button>
	    </div> --%>
    </form:form>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>
