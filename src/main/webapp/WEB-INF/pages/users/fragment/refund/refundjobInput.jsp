<%@ include file="/common/taglibs.jsp"%>
	<form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <form:hidden path="isAdmin" />
    <div class="container-fluid">
	    <div class="row">
	    	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
		    	<spring:bind path="refund.employee.id">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="refund.employee"/>
			        <form:select path="employee.id" cssClass="form-control select2">
			        	<c:forEach items="${docsSelection.staff}" var="st">
			        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
			        	</c:forEach>
			        </form:select>
			        <form:errors path="employee.id" cssClass="help-block"/>
			    </div>
		    </security:authorize>
		    <security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
		    	<form:hidden path="employee.id"/>
		    	<div class="form-group col-md-3">
		    		<appfuse:label styleClass="control-label" key="refund.employee"/>
		    		<input class="form-control" value="${refund.employee.firstName}&nbsp;${refund.employee.lastName}" readonly="readonly"/>
		    	</div>
		    </security:authorize>
		    <div class="form-group col-md-3">
	    		<appfuse:label styleClass="control-label" key="advanceform.refcode"/>
	    		<input class="form-control" value="${refund.refCode}" id="refCode" readonly="readonly"/>
	    	</div>
		    <spring:bind path="refund.date">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="refund.date"/>
		        <form:input provide="datepicker" path="date" id="date"  cssClass="form-control"/>
		        <form:errors path="date" cssClass="help-block"/>
		    </div>
		    <div class="form-group col-md-2">
		    		<appfuse:label styleClass="control-label" key="refund.total"/>
		    		<input class="form-control money" id="finalValue" value="${refund.total}" readonly="readonly"/>
		    	</div>
	    </div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#date").datetimepicker("setDate",new Date());
	});
</script>