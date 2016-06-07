<%@ include file="/common/taglibs.jsp"%>
			<div class="row">
			<form:hidden path="id"/>
		    <div class="form-group col-md-4">
		        <appfuse:label styleClass="control-label" key="accountingExh.companyName"/>
		        <form:input path="docsgeneral.customer.name"  maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-4">
		        <appfuse:label styleClass="control-label" key="accountingExh.address"/>
		        <form:input path="docsgeneral.customer.address"  maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.tel"/>
		        <form:input path="docsgeneral.customer.tel"  maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.fax"/>
		        <form:input path="docsgeneral.customer.fax"  maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		    <div class="form-group col-md-4">
		        <appfuse:label styleClass="control-label" key="accountingExh.exhibitor"/>
		        <form:input path="exhibitor" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		    <div class="form-group col-md-4">
		        <appfuse:label styleClass="control-label" key="accountingExh.exName"/>
		        <form:input path="exName" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		     <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.from"/>
		        <form:input path="docsgeneral.placeRev" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.to"/>
		        <form:input path="docsgeneral.placeDelivery" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.cmb"/>
		        <form:input path="docsgeneral.cmb" id="cmb" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.noOfPkgs"/>
		        <form:input path="docsgeneral.noOfPkgs" id="noOfPkgs" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    <div class="form-group col-md-2">
		        <appfuse:label styleClass="control-label" key="accountingExh.kg"/>
		        <form:input path="docsgeneral.weigth" id="kg" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		     <div class="form-group col-md-3">
		        <appfuse:label styleClass="control-label" key="accountingExh.invoiceNo"/>
		        <form:input path="docsgeneral.jobNo" maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
		    
		    <spring:bind path="accountNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="accountingExh.accountNo"/>
		        <form:input path="accountNo"  maxlength="45"  cssClass="form-control"/>
		        <form:errors path="accountNo" cssClass="help-block"/>
		    </div>
		    
		      <spring:bind path="attn">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="accountingExh.attn"/>
		        <form:input path="attn"  maxlength="45"  cssClass="form-control"/>
		        <form:errors path="attn" cssClass="help-block"/>
		    </div>
		    
		    
		    <spring:bind path="dateRe">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="accountingExh.openDate"/>
		        <form:input path="dateRe" provide="datepicker" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="dateRe" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="mode.id">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3" addUrl="/admin/config/constant" type="6">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="accountingExh.mode"/>
		        <form:select path="mode.id"  maxlength="45"  cssClass="form-control" items="${docsSelection.selections['typeOfTransports']}"/>
		        <form:errors path="mode.id" cssClass="help-block"/>
		    </div>
		    
		     <div class="form-group col-md-3">
		        <appfuse:label styleClass="control-label" key="accountingExh.albwNo"/>
		        <form:input path="albwNo"  maxlength="45"  cssClass="form-control" disabled="true"/>
		    </div>
	    </div>