<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="configuration.title"/></title>
    <meta name="menu" content="AdminMenu"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="configuration.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='configuration.heading'/></h2>
 
<div class="col-sm-10">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="configuration" method="post" action="constantForm" id="configurationForm" cssClass="well">
    <form:hidden path="id"/>
    <form:hidden path="enabled"/>
    <div class="container-fluid">
	    <div class="row">
		    <spring:bind path="configuration.value">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-8">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="configuration.value"/>
		        <form:input path="value" id="code" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="value" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="configuration.type">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="configuration.type"/>
		        <form:select path="type" id="type" cssClass="form-control select2" autofocus="true">
		         <c:forEach items="${sericesType}" var="sem" varStatus="cnt">
                  <option value="${sem.key}" <c:if test="${sem.key == configuration.type}">selected</c:if>><fmt:message key="${sem.value}"/></option>
     			 </c:forEach>
		        </form:select>
		        <form:errors path="type" cssClass="help-block"/>
		    </div>
	    </div>
	    <div class="row">
	    	<spring:bind path="configuration.description">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-8">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="configuration.description"/>
		        <form:input path="description" id="description" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="description" cssClass="help-block"/>
		    </div>
	    </div>
	</div>
    <div class="form-group form-actions">
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty configuration.id}">
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
 
<v:javascript formName="configurationForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>