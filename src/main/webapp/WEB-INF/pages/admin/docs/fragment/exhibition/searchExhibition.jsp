<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="DocsMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchExhibition" id="exhibitionForm" cssClass="well">
		<div class="row">
				<!-- Add Phuc 1.8 -->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group col-md-3">
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
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label"
							key="packageInfo.jobNo" />
						<%-- <form:select path="jobNo" id="customercode"
							cssClass="form-control select2">
							<form:option value=""><fmt:message key="searchall" /></form:option>
							<c:forEach items="${docsSelection.docsgenerals}" var="docs">
								<form:option value="${docs.id}">${docs.jobNo}</form:option>
							</c:forEach>
						</form:select> --%>
						<form:input path="jobNo" cssClass="form-control"/>
					</div>
					<div class="form-group col-md-3">
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
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label"
							key="exhibition.typeOfContainer" />
						<form:select path="typeOfContainer"
							id="typeOfContainer" cssClass="form-control select2">
							<form:option value=""><fmt:message key="searchall" /></form:option>
							<c:forEach var="entry" items="${docsSelection.selections['typeOfContainers']}">
								<form:option value="${entry.key}">${entry.value}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<div class="form-group col-md-3">
						<appfuse:label styleClass="control-label"
							key="exhibition.doTruck" />
						<form:select path="doDelivery" id="doMoveMethod"
							cssClass="form-control select2">
							<form:option value=""><fmt:message key="searchall" /></form:option>
							<c:forEach var="entry" items="${enumStatus}">
								<form:option value="${entry}">${entry}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<div class="form-group col-md-3">
					    <appfuse:label styleClass="control-label" key="exhibition.devDateStart"/>
					    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
				    </div>
				    
				    <div class="form-group col-md-3">
					    <appfuse:label styleClass="control-label" key="exhibition.devDateEnd"/>
					    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
				    </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group col-md-4">
						<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
					</div>
				</div>
			</div>
			<!-- Add Phuc 1.8 -->

		</div>
	</form:form>
