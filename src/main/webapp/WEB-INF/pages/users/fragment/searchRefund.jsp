<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="Home" />
</head>

	<form:form commandName="search" method="post"
		action="searchRefund" id="refundForm" cssClass="well">
		<div class="row">
<%-- 			<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING">  --%>
<!-- 				<div class="form-group col-md-3"> -->
<%-- 					<appfuse:label styleClass="control-label" --%>
<%-- 						key="advanceform.employee" /> --%>
<%-- 					<form:select path="employee" id="employeecode1" --%>
<%-- 						cssClass="form-control select2"> --%>
<%-- 						<form:option value=""><fmt:message key="searchall" /></form:option> --%>
<%-- 						<c:forEach items="${docsSelection.staff}" var="st"> --%>
<%-- 			        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option> --%>
<%-- 			        	</c:forEach> --%>
<%-- 					</form:select> --%>
<!-- 				</div> -->
<%-- 			</security:authorize> --%>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="refund.startdate" />
					<form:input path="startPayDate" provide="datepicker" id="startDate1" autofocus="true" cssClass="form-control"/>
			        <form:errors path="startPayDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="refund.enddate" />
					<form:input path="endPayDate" provide="datepicker" id="endDate1" autofocus="true" cssClass="form-control"/>
			        <form:errors path="endPayDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.payForm" />
				<form:select path="doApproval" id="doApproval1"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
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
		</div> 
		<div class="row">
			<div class="form-group col-md-2">
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
		</div>
	</form:form>

