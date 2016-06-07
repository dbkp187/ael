<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="menu.acct.shipment"/></title>
    <meta name="menu" content="DocsMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="menu.acct.shipment"/></h2>
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="conditions"  method="get" action="shipment/download" id="shipmentForm" cssClass="well" showLoading="false">
    	<div class="container-fluid">
    		<div class="row">		    
		    	<div class="form-group col-md-3">
					<appfuse:label styleClass="control-label"
						key="customer.title" />
					<form:select path="customerId" id="customercode"
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<c:forEach items="${docsSelection.customers}" var="cust">
							<form:option value="${cust.id}">${cust.code}</form:option>
						</c:forEach>
					</form:select>
				</div>
				
				<div class="form-group col-md-3">
					<appfuse:label styleClass="control-label"
						key="accountingnhathau.jobNo" />
					<form:select path="job" id="customercode" 
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<form:options items="${jobList }"/>
					</form:select>
				</div>
				
				<div class="form-group col-md-3">
					<appfuse:label styleClass="control-label"
						key="configuration.typeOfImport" />
					<form:select path="typeOfImport" id="typeOfImport"
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<c:forEach var="entry" items="${docsSelection.selections['importTypes']}">
							<form:option value="${entry.key}">${entry.value}</form:option>
						</c:forEach>
					</form:select>
				</div>
				
				<div class="form-group col-md-3">
					<appfuse:label styleClass="control-label"
						key="packageInfo.shipper" />
					<form:select path="shipper" id="customercode" 
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<form:options items="${shippers }"/>
					</form:select>
				</div>
				
				<div class="form-group col-md-3">
					<appfuse:label styleClass="control-label"
						key="packageInfo.consignee" />
					<form:select path="consignee" id="customercode" 
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<form:options items="${consignees }"/>
					</form:select>
				</div>
			    
			    <div class="form-group col-md-3">
				    <appfuse:label styleClass="control-label" key="accountingnhathau.startdate"/>
				    <input name="startDate" provide="datepicker" maxlength="45"  class="form-control"  id="startDateVT1"/>
			    </div>
			    
			    <div class="form-group col-md-3">
				    <appfuse:label styleClass="control-label" key="accountingnhathau.enddate"/>
				    <input name="endDate" provide="datepicker" maxlength="45" class="form-control"   id="endDateVT1"/>
			    </div>
    		</div>
    	</div>
	     <hr>
	    <div class="form-group form-actions">
	        <button class="btn btn-success">
	    	<i class="fa fa-print"></i> <fmt:message key="accounting.transport.download"/>
	    	<input type="submit" style="display: none;"/>
	    	</button>
	    </div>
    </form:form>
</div>
<script type="text/javascript" src="<c:url value='/scripts/advanceRefund.js'/>"></script>
