<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="inland.title"/></title>
    <meta name="menu" content="DocsMenu"/>
    <meta name="child" content="true"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="inland.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='inland.heading'/> - 
     <c:if test="${inland.isInland == false}"><fmt:message key='inland.sealand'/></c:if>
     <c:if test="${inland.isInland != false}"><fmt:message key='inland.inland'/></c:if>
    </h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="inland" method="post" action="inland" id="inlandForm" cssClass="well" enctype="multipart/form-data">
    <form:hidden path="id"/>
    <form:hidden path="creator.id"/>
    <form:hidden path="createdDate"/>
    <form:hidden path="counting"/>
    <form:hidden path="docsgeneral.id"/>
    <form:hidden path="isInland"/>
    <div class="container-fluid">
	    <c:if test ="${inland.isInland == null || inland.isInland}">
	    	<jsp:include page="fragment/inland/inlandLayout.jsp"></jsp:include>
	    </c:if>
	    <c:if test ="${inland.isInland == false}">
	    	<jsp:include page="fragment/inland/sealandLayout.jsp"></jsp:include>
	    </c:if>
	    <hr>
	    <div role="tabpanel">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active" id="servicesTab"><a href="#services" aria-controls="services" role="tab" data-toggle="tab"><fmt:message key="inland.listContsealDetail" /></a></li>
		    <li role="presentation"><a href="#contss" aria-controls="contss" role="tab" data-toggle="tab"><fmt:message key="inland.feeTables" /></a></li>
		    <li role="presentation"><a href="#contTypes" id="contTypesTab" aria-controls="contTypes" role="tab" data-toggle="tab"><fmt:message key="inland.contTypesList" /></a></li>
		    <c:if test="${inland.isInland == null || inland.isInland}">
		    	<li role="presentation"><a href="#inlandSize" id="inlandSizeTab" aria-controls="inlandSize" role="tab" data-toggle="tab"><fmt:message key="inland.tableDetail" /></a></li>
		    </c:if>
		    <li role="presentation"><a href="#invoices" aria-controls="invoices" role="tab" data-toggle="tab"><fmt:message key="docsgeneral.invoices" /></a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="services"><jsp:include page="fragment/inland/contsealTables.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="contss"><jsp:include page="fragment/inland/feeTables.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="invoices"><jsp:include page="fragment/inland/attachments.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="contTypes"><jsp:include page="fragment/inland/contTypes.jsp"></jsp:include></div>
		    <c:if test="${inland.isInland == null || inland.isInland}">
		    	<div role="tabpanel" class="tab-pane" id="inlandSize"><jsp:include page="fragment/inland/inlandSizes.jsp"></jsp:include></div>
		    </c:if>
		  </div>
		</div>   	
	    <br/>
	     <div class="row">
	     	<table class="table">
		  		<thead>
		  			<tr >
			  			<th style="text-align: center"><fmt:message key="inland.doDelivery"/></th>
		  			</tr>
		  		</thead>
		  		<tbody>
		  			<tr style="text-align: center">
		  				<td>
		  				<c:if test="${inland.docsgeneral.doDelivery == true}">
	  						<form:checkbox path="docsgeneral.doDelivery" id="doMoveMethod" disabled = "true"/>
	  						<form:hidden path="docsgeneral.doDelivery" />
	  					</c:if>
	  					<c:if test="${empty inland.docsgeneral.doDelivery || inland.docsgeneral.doDelivery ==false}">
	  						<form:checkbox path="docsgeneral.doDelivery" id="doDelivery" />
	  					</c:if>
		  				<form:hidden path="docsgeneral.doAccounting" />
		  				</td>
		  			</tr>
		  		</tbody>
			</table>
		</div>
    <div class="form-group form-actions">
        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
        </button>
        <c:if test="${not empty inland.id and inland.docsgeneral.doDelivery != true}">
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
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${inland.creator.username}</span> on ${inland.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${inland.updator.username}</span> on ${inland.lastUpdateDate}
    	</div>
    </div>
    
</div>
 
<v:javascript formName="docservice" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>