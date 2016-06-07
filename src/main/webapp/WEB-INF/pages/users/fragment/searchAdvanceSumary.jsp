<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="packageInfoList.title" /></title>
<meta name="menu" content="Home" />
</head>

	<form:form commandName="search" method="post"
		action="searchAdvanceSumary" id="advanceSumaryForm" cssClass="well" showLoading="false">
		<div class="row">
		<%-- <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
			<div class="form-group col-md-4">
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
			</security:authorize> --%>
			<%-- <form:hidden path="employee.id"/>
		    	<div class="form-group col-md-3">
		    		<appfuse:label styleClass="control-label" key="advanceform.employee"/>
		    		<input class="form-control" value="${employee.firstName}&nbsp;${employee.lastName}" readonly="readonly"/>
		    	</div> --%>
			<div class="form-group col-md-4">
				<appfuse:label styleClass="control-label"
					key="advanceform.startdate" />
					<form:input path="startSumDate" provide="datepicker" id="startDateSumary"  cssClass="form-control"/>
			        <form:errors path="startSumDate" cssClass="help-block"/>
			</div>
			<div class="form-group col-md-4">
				<appfuse:label styleClass="control-label"
					key="advanceform.enddate" />
					<form:input path="endSumDate" provide="datepicker" id="endDateSumary"  cssClass="form-control"/>
			        <form:errors path="endSumDate" cssClass="help-block"/>
			</div>			
		</div> 
		<div class="row">
			<div class="form-group col-md-1">
				<button type="submit" class="btn btn-primary" onclick="bCancel=false" name="search"><i class="fa fa-search"></i> <fmt:message key="button.search"></fmt:message></button>
			</div>
			<div class="form-group col-md-1">
				<button type="submit" class="btn btn-success" onclick="bCancel=false" name="export"><i class="fa fa-print"></i> <fmt:message key="accounting.transport.download"></fmt:message></button>
			</div>
		</div>
	</form:form>

<script>
var exportButton = $("button[name='export']");
exportButton.click(function() {
	 document.forms["advanceSumaryForm"].attr("showLoading","false");
	 document.forms["advanceSumaryForm"].submit();
	 document.forms["advanceSumaryForm"].attr("showLoading","");
});

$( document ).ready(function() {
	var startDateEle = $("#startDateSumary");
	var endDateEle = $("#endDateSumary");
	if (startDateEle.val()==null || startDateEle.val()=="") {
		startDateEle.datetimepicker("setDate",new Date());
	}
	if (endDateEle.val()==null || endDateEle.val()=="") {
		endDateEle.datetimepicker("setDate",new Date());
	}

});
</script>