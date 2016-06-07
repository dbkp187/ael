<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="nhathau.title"/></title>
    <meta name="menu" content="AdminMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="nhathau.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='nhathau.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="nhathau" method="post" action="nhathauForm" id="nhathauForm" cssClass="well">
    <form:hidden path="id"/>
    <div class="container-fluid">
	    <div class="row">
	    	<spring:bind path="nhathau.type">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.type"/>
		        <form:select path="type" id="type" cssClass="form-control select2" >
		         <c:forEach items="${types}" var="sem" varStatus="cnt">
                  <option value="${sem.key}" <c:if test="${sem.key == nhathau.type}">selected</c:if>><fmt:message key="${sem.value}"/></option>
     			 </c:forEach>
		        </form:select>
		        <form:errors path="type" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="nhathau.name">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.name"/>
		        <form:input path="name"  maxlength="255"  cssClass="form-control"/>
		        <form:errors path="name" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="nhathau.code">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.code"/>
		        <form:input path="code"  maxlength="255"  cssClass="form-control"/>
		        <form:errors path="code" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="nhathau.taxNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.taxNo"/>
		        <form:input path="taxNo" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="taxNo" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="nhathau.phoneNumber">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.phoneNumber"/>
		        <form:input path="phoneNumber" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="phoneNumber" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="nhathau.contactName">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.contactName"/>
		        <form:input path="contactName" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="contactName" cssClass="help-block"/>
		    </div>		    
		    
		    <spring:bind path="nhathau.address">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.address"/>
		        <form:input path="address"  maxlength="500"  cssClass="form-control"/>
		        <form:errors path="address" cssClass="help-block"/>
		    </div>
		    
		     <spring:bind path="nhathau.info">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="nhathau.info"/>
		        <form:input path="info"  maxlength="255"  cssClass="form-control"/>
		        <form:errors path="info" cssClass="help-block"/>
		    </div>
		    
	    </div>
	</div>
    <div class="form-group form-actions">
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty nhathau.id}">
          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
          </button>
        </c:if>
        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
    <hr>
    </form:form>
</div>
 
<v:javascript formName="nhathauForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>