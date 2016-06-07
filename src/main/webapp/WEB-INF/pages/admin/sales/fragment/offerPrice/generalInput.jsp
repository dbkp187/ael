<%@ include file="/common/taglibs.jsp"%>
<form:hidden path="id"/>
    <form:hidden path="customer.id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <div class="container-fluid">
	    <div class="row">
		    <spring:bind path="offerPrice.customer.code">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.code"/>
		        <form:input path="customer.code" id="code" maxlength="45"  cssClass="form-control" disabled="true"/>
		        <form:errors path="customer.code" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="offerPrice.customer.name">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.name"/>
		        <form:input path="customer.name" id="name" maxlength="255" autofocus="true" cssClass="form-control" disabled="true"/>
		        <form:errors path="customer.name" cssClass="help-block"/>
		    </div>
	    
		    <spring:bind path="offerPrice.typeOfService">
			<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
			   <appfuse:label styleClass="control-label" key="offerPrice.typeOfService"/>
			    <form:select path="typeOfService" id="typeOfService" cssClass="form-control" >
		         <c:forEach items="${services}" var="sem" varStatus="cnt">
                  <option value="${sem.key}" <c:if test="${sem.key == offerPrice.typeOfService.value}">selected</c:if>><fmt:message key="${sem.value}"/></option>
     			 </c:forEach>
		        </form:select>
			   <form:errors path="typeOfService" cssClass="help-block"/>
			</div>
			
			<spring:bind path="offerPrice.dateOffer">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="offerPrice.dateOffer"/>
		        <form:input provide="datepicker" path="dateOffer" id="dateOffer" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="dateOffer" cssClass="help-block"/>
		    </div>
	    </div>
	    
	</div>