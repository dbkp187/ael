<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="DocsMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchInland" id="packageInfoForm" cssClass="well">
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
					key="packageInfo.typeOfContainer" />
				<form:select path="typeOfContainer"
					id="typeOfContainer" cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${docsSelection.selections['typeOfContainers']}">
						<form:option value="${entry.key}">${entry.value}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<!-- Add Phuc 1.8 -->
			<div class="form-group col-md-4">
				<appfuse:label styleClass="control-label"
					key="packageInfo.jobNo" />
				<%-- <form:select path="jobNo" id="customercode"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.docsgenerals}" var="docs">
						<form:option value="${docs.id}">${docs.jobNo}</form:option>
					</c:forEach>
				</form:select> --%>
				<form:input path="jobNo" id="jobNo"	cssClass="form-control" maxlength="100"/>
			</div>
			<%-- <div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="contseal.noOfCont" />
				<form:input path="contSeal" id="customercode2"
					cssClass="form-control"/>
				<form:errors path="contSeal" cssClass="help-block"/>
			</div> --%>
			<!-- End Add Phuc 1.8 -->
			
			<div class="form-group col-md-4">
				<appfuse:label styleClass="control-label"
					key="inland.doDelivery" />
				<form:select path="doDelivery" id="doMoveMethod"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-4">
			    <appfuse:label styleClass="control-label" key="inland.dateStartNKH"/>
			    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
		    </div>
		    
		    <div class="form-group col-md-4">
			    <appfuse:label styleClass="control-label" key="inland.dateEndNKH"/>
			    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
		    </div>
		</div>
		<div class="row">
			<div class="form-group col-md-2">
				<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>

		</div>
	</form:form>

<script type="text/javascript">
	$(document).ready(function(){
		/* $('select').prepend('<option val="0">None</option>'); */
	});
	
</script>