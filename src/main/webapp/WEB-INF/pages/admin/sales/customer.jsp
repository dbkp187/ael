<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="customer.title"/></title>
    <meta name="menu" content="SalesMenu"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="customer.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='customer.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="customer" method="post" action="customer" id="customerForm" cssClass="well">
    <form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <div class="container-fluid">
	    <div class="row">
		    <spring:bind path="customer.code">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.code"/>
		        <form:input path="code" id="code" maxlength="45" autofocus="true" cssClass="form-control" readonly="${customer.id != null ? 'true' : 'false' }"/>
		        <form:errors path="code" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.name">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.name"/>
		        <form:input path="name" id="name" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="name" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.address">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.address"/>
		        <form:input path="address" id="address" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="address" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.taxno">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.taxno"/>
		        <form:input path="taxno" id="taxno" maxlength="45" cssClass="form-control"/>
		        <form:errors path="taxno" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.email">
			<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
			   <appfuse:label styleClass="control-label" key="customer.email"/>
			   <form:input path="email" id="email" maxlength="255" autofocus="true" cssClass="form-control"/>
			   <form:errors path="email" cssClass="help-block"/>
			</div>
			
			<spring:bind path="customer.contact">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.contact"/>
		        <form:input path="contact" id="contact" maxlength="255" autofocus="true" cssClass="form-control"/>
		        <form:errors path="contact" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.tel">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.tel"/>
		        <form:input path="tel" id="tel" maxlength="45" autofocus="true" cssClass="form-control"/>
		        <form:errors path="tel" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.fax">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="customer.fax"/>
		        <form:input path="fax" id="fax" maxlength="45" autofocus="true" cssClass="form-control"/>
		        <form:errors path="fax" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="customer.country">
			<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2" addUrl="/admin/config/constant" type="5">
		    </spring:bind>
			   <appfuse:label styleClass="control-label" key="customer.country"/>
			   <form:select path="country.id" id="country" cssClass="form-control select2" items="${selections['countries']}"/>
			   <form:errors path="country" cssClass="help-block"/>
			</div>
		    
			<spring:bind path="customer.companyType">
			<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6" addUrl="/admin/config/constant" type="4">
		    </spring:bind>
			   <appfuse:label styleClass="control-label" key="customer.companyType"/>
			   <form:select path="companyType.id" id="companyType" cssClass="form-control" items="${selections['companyTypes']}" />
			   <form:errors path="companyType.id" cssClass="help-block"/>
			</div>
			
	    </div>
	   
	</div>
    <div class="form-group form-actions">
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty customer.id}">
          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
          </button>
        </c:if>
        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
    </form:form>
    <c:if test="${not empty customer.id}">
    	<h3><fmt:message key="offerPriceList.title"/></h3>
    	 <hr>
      	<div id="actions" class="btn-group">
	        <a class="btn btn-primary" href="<c:url value='offerPrice?customerId=${customer.id}'/>">
	            <i class="fa fa-plus"></i> <fmt:message key="button.addOffer"/></a>
    	</div>
    	<table id="offerPriceList" class="display nestedDatatable" cellspacing="0" width="100%"
    	childDetailURL="/admin/sales/offerItemList/list" 
    	emptyMessage="customer.offerItems.empty"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="offerItem.nameOfService"/>,<fmt:message key="offerItem.feeWithVAT"/>,<fmt:message key="offerItem.feeNoVAT"/>,<fmt:message key="offerItem.currency"/>,<fmt:message key="offerItem.feeUnit"/>"
    	detailTableMapping="nameOfService.value,feeWithVAT[money],feeNoVAT[money],currency.value,feeUnit.value"
    	editDetail=""
    	successLoadMessage="customer.offerItems.loaded"
    	>
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="offerPrice.typeOfService"/></th>
                <th><fmt:message key="offerPrice.dateOffer"/></th>
                <th><fmt:message key="offerPrice.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/>
                <th><fmt:message key="offerPrice.typeOfService"/></th>
                <th><fmt:message key="offerPrice.dateOffer"/></th>
                <th><fmt:message key="offerPrice.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${offerPrices}" var="offerPrice" varStatus="idx">
        	<tr params="offerId=${offerPrice.id}">
                <td colType="index">${idx.index+1}</td>
              	<td><fmt:message key="${offerPrice.typeOfServiveText}"/></td>
              	<td><fmt:formatDate value="${offerPrice.dateOffer}" pattern="yyyy-MM-dd"/></td>
              	<td>
              		<c:if test="${offerPrice.isValid}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="offerPrice?id=${offerPrice.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
     </c:if>
    <hr>
    <div class="row">
    	<div class="col-md-7"></div>
    	<div class="col-md-5">
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${customer.creator.username}</span> on ${customer.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${customer.updator.username}</span> on ${customer.lastUpdateDate}
    	</div>
    </div>
    
</div>
 
<v:javascript formName="customer" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>