<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchFeeTables" id="feeTabelsForm" cssClass="well">
		<div class="row">
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="trucking.customercode" />
				<form:select path="customer" id="customercode"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.customers}" var="cust">
						<form:option value="${cust.id}">${cust.code}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="packageInfo.jobNo" />
				<form:input path="jobNo" id="jobNo"	cssClass="form-control" maxlength="100"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="trucking.typeOfDocs" />
				<form:select path="typeOfDocs" id="typeOfDocs"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${typeOfDocs}">
						<form:option value="${entry.key}"><fmt:message key="${entry.value}" /></form:option>
					</c:forEach>
				</form:select>
			</div>
			
			<div class="form-group col-md-3">
				<br><br>
				<form:checkbox path="isDuplicated"/>
				<appfuse:label styleClass="control-label"
					key="accounting.duplicatedFee" />
			</div>
	    </div>
		<div class="row">
			<div class="form-group col-md-3">
			    <appfuse:label styleClass="control-label" key="accountingnhathau.startdate"/>
			    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
		    </div>
		    <div class="form-group col-md-3">
			    <appfuse:label styleClass="control-label" key="accountingnhathau.enddate"/>
			    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
		    </div>
		</div>
		<div class="form-group col-md-12">
			<span style="font-weight: 10px;">*<fmt:message key="trucking.explainDate"></fmt:message></span>
		</div>
		<div class="row">
			<div class="form-group col-md-2">
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
		</div>
	</form:form>
