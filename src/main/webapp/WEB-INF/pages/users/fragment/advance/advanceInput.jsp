<%@ include file="/common/taglibs.jsp"%>
	<form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <form:hidden path="isAdmin"/>
    <div class="container-fluid">
	    <div class="row">
	    	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
		    	<spring:bind path="advanceform.employee.id">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="advanceform.employee"/>
			        <form:select path="employee.id" cssClass="form-control select2" id="empId">
			        	<c:forEach items="${docsSelection.staff}" var="st">
			        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
			        	</c:forEach>
			        </form:select>
			        <form:errors path="employee.id" cssClass="help-block"/>
			    </div>
		    </security:authorize>
		    <security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
		    	<form:hidden path="employee.id"/>
		    	<div class="form-group col-md-2">
		    		<appfuse:label styleClass="control-label" key="advanceform.employee"/>
		    		<input class="form-control" value="${advanceform.employee.firstName}&nbsp;${advanceform.employee.lastName}" readonly="readonly"/>
		    	</div>
		    </security:authorize>
		    <div class="form-group col-md-2">
	    		<appfuse:label styleClass="control-label" key="advanceform.refcode"/>
	    		<input class="form-control" value="${advanceform.refCode}" id="refCode" readonly="readonly"/>
	    	</div>
		    <spring:bind path="advanceform.date">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="advanceform.date"/>
		        <form:input path="date" id="date"  cssClass="form-control"/>
		        <form:errors path="date" cssClass="help-block"/>
		    </div>
		    <div class="form-group col-md-3">
	    		<appfuse:label styleClass="control-label" key="advanceform.total"/>
	    		<input class="form-control money" value="${advanceform.total}" id="totalAdvance" readonly="readonly"/>
	    	</div>
	    	 <spring:bind path="advanceform.timeRefund">
		    	<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="advanceform.refundDate"/>
		        <form:input provide="datepicker" path="timeRefund" id="timeRefund"  cssClass="form-control"/>
		        <form:errors path="timeRefund" cssClass="help-block"/>
	    </div>
	</div>
	
	<script>
	$( document ).ready(function() {
		var dateEle = $("#date");
		var refundDateEle = $("#timeRefund");
		var currentDate = new Date();
		currentDate.setMonth(currentDate.getMonth() + 1);
		if (dateEle.val()==null || dateEle.val()=="") {
			dateEle.datepicker("setDate",new Date());
		}
		if (refundDateEle.val()==null || refundDateEle.val()=="") {
			refundDateEle.datepicker("setDate",currentDate);
		}

	});
	</script>