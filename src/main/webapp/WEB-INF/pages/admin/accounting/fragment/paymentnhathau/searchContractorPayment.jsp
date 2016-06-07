<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

<form:form commandName="accountingContractorPaymentCondition"
	method="post" action="searchContractorPayment" id="feeTabelsForm"
	cssClass="well">
	<div class="row">
		<div class="form-group col-md-3">
			<appfuse:label styleClass="control-label" key="nhathau.name" />
			<form:select path="nhathauId" id="nhathauId" class="form-control">
				<form:option value="">
					<fmt:message key="searchall" />
				</form:option>
				<c:forEach items="${nhathauList}" var="nhathau">
					<c:choose>
						<c:when test="${accountingContractorPaymentCondition.nhathauId == nhathau.id}">
							<option value="${nhathau.id}" selected="selected">${nhathau.code}</option>
						</c:when>
						<c:otherwise>
							<option value="${nhathau.id}">${nhathau.code}</option>
						</c:otherwise>
					</c:choose>
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
		<div class="form-group col-md-3">
			<appfuse:label styleClass="control-label" key="contractor.payment.status" />
			<form:select path="payMoneyStatus" id="payMoneyStatus"
				cssClass="form-control select2">
				<form:option value="">
					<fmt:message key="searchall" />
				</form:option>
				<c:forEach var="entry" items="${enumStatus}">
					<form:option value="${entry.key}">
						<fmt:message key="${entry.value}" />
					</form:option>
				</c:forEach>
			</form:select>
		</div>
		
	</div>
	<div class="row">
		<div class="form-group col-md-10">
			<button type="submit" class="btn btn-primary" onclick="bCancel=false"
				name="search">
				<i class="fa fa-search"></i>
				<fmt:message key="button.search"></fmt:message>
			</button>
			<button type="button" class="btn btn-success"
				onclick="processPayMoney(0)">
				<fmt:message key="contractor.payment.cash"></fmt:message>
			</button>
			<button type="button" class="btn btn-success"
				onclick="processPayMoney(1)">
				<fmt:message key="contractor.payment.bank"></fmt:message>
			</button>
		</div>

	</div>
</form:form>
