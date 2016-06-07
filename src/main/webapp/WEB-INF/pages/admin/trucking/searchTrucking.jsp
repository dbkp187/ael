<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="TrackingMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchTrucking" id="truckingForm" cssClass="well">
		<div class="row">
				<!-- Add Phuc 1.8 -->
			
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
				<%-- <form:select path="jobNo" id="customercode"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.docsgenerals}" var="docs">
						<form:option value="${docs.id}">${docs.jobNo}</form:option>
					</c:forEach>
				</form:select> --%>
				<form:input path="jobNo" cssClass="form-control" maxlength="100"/>
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
				<appfuse:label styleClass="control-label"
					key="trucking.typeOfContainer" />
				<form:select path="typeOfContainer"
					id="typeOfContainer" cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${docsSelection.selections['typeOfContainers']}">
						<form:option value="${entry.key}">${entry.value}</form:option>
					</c:forEach>
				</form:select>
			</div>
			
			<div class="form-group col-md-3">
			    <appfuse:label styleClass="control-label" key="trucking.startDate"/>
			    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
		    </div>
		    
		    <div class="form-group col-md-3">
			    <appfuse:label styleClass="control-label" key="trucking.endDate"/>
			    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
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
			<%-- <div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="contseal.noOfCont" />
				<form:select path="contSeal" id="customercode"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.contseals}" var="contseal">
						<form:option value="${contseal.id}">${contseal.noOfCont}</form:option>
					</c:forEach>
				</form:select>
			</div> --%>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="trucking.status" />
				<form:select path="doAccounting" id="doAccounting"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
			</div>
			
<!-- 			<div class="form-group col-md-2"> -->
<%-- 				<appfuse:label styleClass="control-label" --%>
<%-- 					key="trucking.available" /> --%>
<%-- 				<form:select path="hasRecord" id="hasRecord" --%>
<%-- 					cssClass="form-control select2"> --%>
<%-- 					<form:option value=""><fmt:message key="searchall" /></form:option> --%>
<%-- 					<c:forEach var="entry" items="${enumStatus}"> --%>
<%-- 						<form:option value="${entry}">${entry}</form:option> --%>
<%-- 					</c:forEach> --%>
<%-- 				</form:select> --%>
<!-- 			</div> -->

			<div class="form-group col-md-12">
				<span style="font-weight: 10px;">*<fmt:message key="trucking.explainDate"></fmt:message></span>
			</div>
			<div class="form-group col-md-3">
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search" style="margin-top: 24px;"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
			<!-- End Add Phuc 1.8 -->

		</div> 
	</form:form>
