<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

	<form:form commandName="search" method="post"
		action="searchFeeNhathauTablesAdvance" id="feeNhathauTabelsForm" cssClass="well">
		
		<div class="row">
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="accountingnhathau.jobNo" />
				<form:select path="jobNo" id="jobNo" 
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<form:options items="${jobList }"/>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label" key="nhathau.name" />
				<form:select path="nhathau" id="nhathauId" class="form-control">
					<form:option value="">
						<fmt:message key="searchall" />
					</form:option>
					<c:forEach items="${nhathauList}" var="nhathau">
						<c:choose>
							<c:when test="${search.nhathau == nhathau.id}">
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
					key="accounting.kt.approval" />
				<form:select path="approved" id="doRelease"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group col-md-3">
				<appfuse:label styleClass="control-label"
					key="accounting.feeAdminApproval" />
				<form:select path="checkByAdmin" id="checkByAdmin"
					cssClass="form-control select2">
					<form:option value=""><fmt:message key="searchall" /></form:option>
					<c:forEach var="entry" items="${enumStatus}">
						<form:option value="${entry}">${entry}</form:option>
					</c:forEach>
				</form:select>
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
		<div class="row">
			<div class="form-group col-md-2">
				<button id="btn-search-advance" type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
		</div> 
	</form:form>
