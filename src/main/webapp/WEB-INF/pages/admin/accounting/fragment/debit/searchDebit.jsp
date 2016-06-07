<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

<form:form commandName="accountingCollectMoneyCondition" method="post"
	action="searchDebit" id="feeTabelsForm" cssClass="well">
	<div class="row">
		<div class="form-group col-md-3">
			<%-- <appfuse:label styleClass="control-label"
				key="accountingnhathau.jobNo" />
			<form:select path="job" id="job" 
				cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<form:options items="${jobList }"/>
			</form:select> --%>
			<appfuse:label styleClass="control-label"
					key="packageInfo.customerCode" />
			<form:select path="customer" id="customercode"
				cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<c:forEach items="${customers}" var="cust">
					<form:option value="${cust.id}">${cust.code}</form:option>
				</c:forEach>
			</form:select>
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
		    <appfuse:label styleClass="control-label" key="accountingnhathau.startdate"/>
		    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
	    </div>
	    <div class="form-group col-md-3">
		    <appfuse:label styleClass="control-label" key="accountingnhathau.enddate"/>
		    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
	    </div>
	    
	</div>
	<div class="row">
	   <div class="form-group col-md-3">
			<appfuse:label styleClass="control-label"
				key="debit.collectMoney" />
			<form:select path="collectMoneyStatus" id="collectMoneyStatus"
				cssClass="form-control select2">
				<form:option value=""><fmt:message key="searchall" /></form:option>
				<c:forEach var="entry" items="${enumStatus}">
					<form:option value="${entry.key}"><fmt:message key="${entry.value}" /></form:option>
				</c:forEach>
			</form:select>
		</div>
		
	</div>
	<div class="row">
		<div class="form-group col-md-10">
			<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			<button type="button" class="btn btn-success" onclick="processCollectMoney(0)"><fmt:message key="debit.collect.cash"></fmt:message></button>
			<button type="button" class="btn btn-success" onclick="processCollectMoney(1)"><fmt:message key="debit.collect.bank"></fmt:message></button>
		</div>
		 
	</div> 
</form:form>
