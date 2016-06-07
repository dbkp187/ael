<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="offerPrice.title"/></title>
    <meta name="menu" content="SalesMenu"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="offerPrice.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='offerPrice.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="offerPrice" method="post" action="offerPrice" id="offerPriceForm" cssClass="well" readonly="${offerPrice.isValid == 'true' ? 'readonly' :''}" enctype="multipart/form-data">
    	<jsp:include page="fragment/offerPrice/generalInput.jsp"></jsp:include>
    	<h3><fmt:message key="offerPriceList.title"/></h3>
    	 <hr>
    	 <div role="tabpanel">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="offerPrice.items"/></a></li>
		    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><fmt:message key="offerPrice.files"/></a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home"><jsp:include page="fragment/offerPrice/manualFee.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="settings"><jsp:include page="fragment/offerPrice/attachments.jsp"></jsp:include></div>
		  </div>
		</div>
    <div class="row">
	     	<table class="table">
		  		<thead>
		  			<tr >
			  			<th style="text-align: center"><fmt:message key="offerPrice.isValid"/></th>
		  			</tr>
		  		</thead>
		  		<tbody>
		  			<tr style="text-align: center">
		  				<td verify="true"><form:checkbox path="isValid" />
			  				<security:authorize ifNotGranted="ROLE_ADMIN">
				  				<c:if test="${offerPrice.isValid==true}">
				  					<form:hidden path="isValid" />
				  				</c:if>
			  				</security:authorize>
		  				</td>
		  			</tr>
		  		</tbody>
			</table>
		</div>
		<hr>
    <div class="form-group form-actions">
    		<c:if test="${offerPrice.isValid != true}">
		        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        </button>
	        </c:if>
	        <c:if test="${offerPrice.isValid == true}">
	        	<security:authorize ifAnyGranted="ROLE_ADMIN"> 
	        		<button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		           	 <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        	</button>
	        	</security:authorize>
	        </c:if>
	        <c:if test="${not empty offerPrice.id && offerPrice.isValid != true}">
	          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
	              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
	          </button>
	        </c:if>
        <a type="submit" class="btn btn-default" name="cancel" href="customer?id=${offerPrice.customer.id }">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.cancel"/>
        </a>
    </div>
    </form:form>
    <hr>
    <div class="row">
    	<div class="col-md-7"></div>
    	<div class="col-md-5">
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${offerPrice.creator.username}</span> on ${offerPrice.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${offerPrice.updator.username}</span> on ${offerPrice.lastUpdateDate}
    	</div>
    </div>
</div>
 
<v:javascript formName="offerPriceForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>