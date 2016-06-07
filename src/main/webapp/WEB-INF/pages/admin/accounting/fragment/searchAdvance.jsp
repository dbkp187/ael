<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchAdvance" id="advanceForm" cssClass="well">
		<div class="row">
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.employee" />
				<form:select path="employee" id="employeecode"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.staff}" var="st">
		        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
		        	</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="accountingnhathau.jobNo" />
				<form:select path="job" id="job" 
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<form:options items="${jobList }"/>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.startdate" />
					<form:input path="startDate" provide="datepicker" id="startDate"  cssClass="form-control"/>
			        <form:errors path="startDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.enddate" />
					<form:input path="endDate" provide="datepicker" id="endDate"  cssClass="form-control"/>
			        <form:errors path="endDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.startrefundDate" />
					<form:input path="startTimeRefund" provide="datepicker" id="startTimeRefund"  cssClass="form-control"/>
			        <form:errors path="startTimeRefund" cssClass="help-block"/>				
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.endrefundDate" />
					<form:input path="endTimeRefund" provide="datepicker" id="endTimeRefund"  cssClass="form-control"/>
			        <form:errors path="endTimeRefund" cssClass="help-block"/>				
			</div>			
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.payForm" />
				<form:select path="doApproval" id="doApproval"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<br>
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
		</div> 
		
	</form:form>