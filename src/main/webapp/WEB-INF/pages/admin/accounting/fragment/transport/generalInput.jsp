<%@ include file="/common/taglibs.jsp"%>
<div class="row">
<%-- 			<c:if test="${not empty refNo }"> --%>
<!-- 			<div class="form-group col-md-2" style="text-align: center"> -->
<%-- 		        <appfuse:label styleClass="control-label" key="accountingtrans.refNo"/> --%>
<%-- 		        <form:input path="refNo" id="refNo" maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/> --%>
<!-- 		    </div> -->
<%-- 		    </c:if> --%>
		    <div class="form-group col-md-3">
		        <appfuse:label styleClass="control-label" key="accountingtrans.companyName"/>
		        <form:input path="customer.name"  maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-3">
		        <appfuse:label styleClass="control-label" key="accountingtrans.address"/>
		        <form:input path="customer.address"  maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingtrans.taxno"/>
		        <form:input path="customer.taxno"  maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingtrans.tel"/>
		        <form:input path="customer.tel" maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingtrans.fax"/>
		        <form:input path="customer.fax"  maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
		    </div>
	    </div>