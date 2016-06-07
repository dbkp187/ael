<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="phieuthu.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchPhieuThu" id="refundForm" cssClass="well" showLoading="false">
		<div class="row">
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="advanceform.employee" />
				<form:select path="employee" id="employeecode1"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach items="${docsSelection.staff}" var="st">
		        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
		        	</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="phieuthu.startdate" />
					<form:input path="startDate" provide="datepicker" id="startDate1"  cssClass="form-control"/>
			        <form:errors path="startDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="phieuthu.enddate" />
					<form:input path="endDate" provide="datepicker" id="endDate1"  cssClass="form-control"/>
			        <form:errors path="endDate" cssClass="help-block"/>
			</div>
			<%-- <div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="refund.payForm" />
				<form:select path="doApproval" id="doApproval1"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
			</div>	 --%>		
		</div> 
		<div class="row">
			<div class="form-group col-md-2">
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
		</div>
	</form:form>
