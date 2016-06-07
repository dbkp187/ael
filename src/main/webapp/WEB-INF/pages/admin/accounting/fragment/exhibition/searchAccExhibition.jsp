<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

<form:form commandName="search" method="post"
	action="searchAccExhibition" id="AccExhibitionForm" cssClass="well">
	<div class="row">
		<div class="form-group col-md-4">
			<appfuse:label styleClass="control-label"
				key="packageInfo.customerCode" />
			<form:select path="customer" id="customercode"
				cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<c:forEach items="${docsSelection.customers}" var="cust">
					<form:option value="${cust.id}">${cust.code}</form:option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group col-md-4">
			<appfuse:label styleClass="control-label"
				key="configuration.typeOfImport" />
			<form:select path="typeOfImport" id="typeOfImport"
				cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<c:forEach var="entry" items="${docsSelection.selections['importTypes']}">
					<form:option value="${entry.key}">${entry.value}</form:option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group col-md-4">
			<appfuse:label styleClass="control-label"
				key="packageInfo.typeOfContainer" />
			<form:select path="typeOfContainer"
				id="typeOfContainer" cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<c:forEach var="entry" items="${docsSelection.selections['typeOfContainers']}">
					<form:option value="${entry.key}">${entry.value}</form:option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group col-md-4">
		    <appfuse:label styleClass="control-label" key="exhibition.devDateStart"/>
		    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
	    </div>
	    
	    <div class="form-group col-md-4">
		    <appfuse:label styleClass="control-label" key="exhibition.devDateEnd"/>
		    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
	    </div>
		<div class="form-group col-md-4"></div>
		<div class="form-group col-md-2">
			<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
		</div>

	</div> 
</form:form>

<script type="text/javascript">
	$(document).ready(function(){
		/* $('#customercode').prepend('<option val="0">None</option>'); */
	});
	
</script>