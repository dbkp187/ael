<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="exhibition.title"/></title>
    <meta name="menu" content="DocsMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="exhibition.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='exhibition.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="exhibition" method="post" action="exhibition" id="exhibitionForm" cssClass="well" enctype="multipart/form-data">
    <form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <form:hidden path="counting"/>
    <form:hidden path="docsgeneral.id"/>
    <div class="container-fluid">
	    <div class="row">
		    <spring:bind path="exhibition.docsgeneral.jobNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.refNo"/>
		        <form:input path="docsgeneral.jobNo" id="jobNo" maxlength="45"  cssClass="form-control" readonly="true"/>
		        <form:errors path="docsgeneral.jobNo" cssClass="help-block"/>
		    </div>
		    
		    <c:choose >
		    	<c:when test="${empty  exhibition.docsgeneral.customer}">
				   	<spring:bind path="exhibition.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="exhibition.customerCode"/>
				        <form:select path="docsgeneral.customer.id" id="customercode"  cssClass="form-control select2" readonly="${packageInfo.id != null ? 'true' : 'false' }">
				        	<c:forEach items="${docsSelection.customers}" var="cust">
				        		<form:option value="${cust.id}">${cust.code}</form:option>
				        	</c:forEach>
				        </form:select>
				        <form:errors path="docsgeneral.customer.id" cssClass="help-block"/>
				    </div>
				</c:when>
				<c:otherwise>
					<form:hidden path="docsgeneral.customer.id"/>
					<spring:bind path="exhibition.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="exhibition.customerCode"/>
				        <form:input path="docsgeneral.customer.code" id="customercode" maxlength="45"  cssClass="form-control" disabled="true"/>
				        <form:errors path="docsgeneral.customer.code" cssClass="help-block"/>
				    </div>
				</c:otherwise>
		    </c:choose>
		    
		    <spring:bind path="exhibition.typeOfEx">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2" addUrl="/admin/config/constant" type="17">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.typeOfEx"/>
		        <form:select path="typeOfEx.id" id="typeOfEx"   cssClass="form-control" items="${docsSelection.selections['typeOfExhs']}"/>
		        <form:errors path="typeOfEx.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.exName">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4" addUrl="/admin/config/constant" type="29">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.exName"/>
		        <form:select path="exName" id="exName" maxlength="255"  cssClass="form-control" items="${docsSelection.selections['exhibitionNames']}"/>
		        <form:errors path="exName" cssClass="help-block"/>
		    </div>
		    
		     <spring:bind path="exhibition.docsgeneral.typeOfImport">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="configuration.typeOfImport"/>
		        <form:select path="docsgeneral.typeOfImport.id" id="typeOfImport"  
		        cssClass="form-control select2" items="${docsSelection.selections['importTypes']}"/>
		        <form:errors path="docsgeneral.typeOfImport.id" cssClass="help-block"/>
		    </div>
		    
		     <spring:bind path="exhibition.docsgeneral.productDescription">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6 ">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.productDescription"/>
		        <form:textarea path="docsgeneral.productDescription" id="productDescription" maxlength="2000"  cssClass="form-control" />
		        <form:errors path="docsgeneral.processingStaff" cssClass="help-block"/>
		    </div>
		    
	    	 <spring:bind path="exhibition.docsgeneral.note">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6 has-warning">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.note"/>
		        <form:textarea path="docsgeneral.note" id="note" maxlength="2000"  cssClass="form-control "/>
		        <form:errors path="docsgeneral.note" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.openDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.openDate"/>
		        <form:input path="openDate" id="openDate" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="openDate" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.endDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.endDate"/>
		        <form:input path="endDate" id="joendDatebNo" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="endDate" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.devDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.devDate"/>
		        <form:input path="devDate" id="devDate" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="devDate" cssClass="help-block"/>
		    </div>
		    
	    	<spring:bind path="exhibition.location">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.location"/>
		        <form:input path="location" id="location" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="location" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.docsgeneral.noOfPkgs">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.noOfPkgs"/>
		        <form:input path="docsgeneral.noOfPkgs" id="noOfPkgs" maxlength="10"  cssClass="form-control number"/>
		        <form:errors path="docsgeneral.noOfPkgs" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.docsgeneral.weigth">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.weigth"/>
		        <form:input path="docsgeneral.weigth" id="weigth" maxlength="12"  cssClass="form-control money2"/>
		        <form:errors path="docsgeneral.weigth" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.docsgeneral.cmb">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.cmb"/>
		        <form:input path="docsgeneral.cmb" id="cmb" maxlength="13"  cssClass="form-control money3"/>
		        <form:errors path="docsgeneral.cmb" cssClass="help-block"/>
		    </div>
		    
	    	<spring:bind path="exhibition.exhibitor">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3" addUrl="/admin/config/constant" type="22">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.exhibitor"/>
		        <form:input path="exhibitor" id="exhibitor" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="exhibitor" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.exhPlace">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.exhPlace"/>
		        <form:input path="exhPlace" id="exhPlace" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="exhPlace" cssClass="help-block"/>
		    </div>
		    
	    	<spring:bind path="exhibition.docsgeneral.typeOfContainer">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2" addUrl="/admin/config/constant" type="30">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.typeOfContainer"/>
		        <c:if test="${exhibition.docsgeneral.doDelivery}">
			        <form:select showElements="-1:consealContainer,consealTab" path="docsgeneral.typeOfContainer.id" id="typeOfContainer"   cssClass="form-control selectReadOnly" items="${docsSelection.selections['typeOfContainers']}"/>
			        <form:hidden path="docsgeneral.typeOfContainer.id"/>
			     </c:if>
			     <c:if test="${!exhibition.docsgeneral.doDelivery}">
			     <form:select showElements="-1:consealContainer,consealTab" path="docsgeneral.typeOfContainer.id" id="typeOfContainer"   cssClass="form-control"  items="${docsSelection.selections['typeOfContainers']}"/>
			       </c:if>
		        <form:errors path="docsgeneral.typeOfContainer.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.etd">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.etd"/>
		        <form:input path="etd" id="etd" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="etd" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.eta">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.eta"/>
		        <form:input path="eta" id="eta" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="eta" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.docsgeneral.shippingLine">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.shippingLine"/>
		        <form:select path="docsgeneral.shippingLine.id" id="shippingLine"   cssClass="form-control" items="${hangtaus}"/>
		        <form:errors path="docsgeneral.shippingLine.id" cssClass="help-block"/>
		    </div>
		    
	    	<spring:bind path="exhibition.operator">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3" addUrl="/admin/config/constant" type="22">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.operator"/>
		        <form:select path="operator.id" id="operator"   cssClass="form-control" items="${docsSelection.selections['operatorExhs']}"/>
		        <form:errors path="operator.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.albwNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.albwNo"/>
		        <form:input path="albwNo" id="albwNo" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="albwNo" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.pol">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.pol"/>
		        <form:input path="pol" id="pol" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="pol" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.poa">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.poa"/>
		        <form:input path="poa" id="poa" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="poa" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.demdet">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.demdet"/>
		        <form:input path="demdet" id="demdet" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="demdet" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.tkhqDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.tkhqDate"/>
		        <form:input path="tkhqDate" id="tkhqDate" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="tkhqDate" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.cusDept">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2" addUrl="/admin/config/constant" type="13">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.cusDept"/>
		        <form:select path="cusDept.id" id="cusDept"   cssClass="form-control" items="${docsSelection.selections['customDepts']}"/>
		        <form:errors path="cusDept.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="exhibition.tkhqNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="exhibition.tkhqNo"/>
		        <form:input path="tkhqNo" id="tkhqNo" maxlength="255"  cssClass="form-control"/>
		        <form:errors path="tkhqNo" cssClass="help-block"/>
		    </div>
		    
<%-- 		    <spring:bind path="exhibition.docsgeneral.contactDelivery"> --%>
<%-- 				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3"> --%>
<%-- 				    </spring:bind> --%>
<%-- 				        <appfuse:label styleClass="control-label" key="inland.contactDelivery"/> --%>
<%-- 				        <form:input path="docsgeneral.contactDelivery" id="contactDelivery"   cssClass="form-control"/> --%>
<%-- 				        <form:errors path="docsgeneral.contactDelivery" cssClass="help-block"/> --%>
<!-- 				    </div> -->
				    
<%-- 				    <spring:bind path="exhibition.docsgeneral.infoInvoice"> --%>
<%-- 				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3"> --%>
<%-- 				    </spring:bind> --%>
<%-- 				        <appfuse:label styleClass="control-label" key="inland.infoInvoice"/> --%>
<%-- 				        <form:input path="docsgeneral.infoInvoice" id="infoInvoice"   cssClass="form-control"/> --%>
<%-- 				        <form:errors path="docsgeneral.infoInvoice" cssClass="help-block"/> --%>
<!-- 				    </div> -->
	    </div>
	     <hr>
	    <div role="tabpanel">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#services" aria-controls="services" role="tab" data-toggle="tab"><fmt:message key="exhibition.tableDetail" /></a></li>
		    <li role="presentation" id="consealTab"><a href="#contss" aria-controls="contss" role="tab" data-toggle="tab"><fmt:message key="exhibition.listContsealDetail" /></a></li>
		    <li role="presentation"><a href="#fees" aria-controls="fees" role="tab" data-toggle="tab"><fmt:message key="exhibition.feeTables" /></a></li>
		    <li role="presentation"><a href="#invoices" aria-controls="invoices" role="tab" data-toggle="tab"><fmt:message key="docsgeneral.invoices" /></a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="services"><jsp:include page="fragment/exhibition/inlandSizes.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="contss"><jsp:include page="fragment/exhibition/contsealTables.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="fees"><jsp:include page="fragment/exhibition/feeTables.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="invoices"><jsp:include page="fragment/exhibition/attachments.jsp"></jsp:include></div>
		  </div>
		</div>   
	</div>
	<jsp:include page="fragment/exhibition/checkboxInput.jsp"></jsp:include>
    <div class="form-group form-actions">
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty exhibition.id and exhibition.docsgeneral.doDelivery != true}">
          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
          </button>
        </c:if>
        <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </button>
    </div>
    </form:form>
    <hr>
    <div class="row">
    	<div class="col-md-7"></div>
    	<div class="col-md-5">
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${exhibition.creator.username}</span> on ${exhibition.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${exhibition.updator.username}</span> on ${exhibition.lastUpdateDate}
    	</div>
    </div>
    
</div>
 
<v:javascript formName="exhibitionForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>