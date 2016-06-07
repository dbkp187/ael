<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="accounting.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="accounting.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='accounting.heading'/></h2>
 
<div class="col-sm-12">
    
</div>
 
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>