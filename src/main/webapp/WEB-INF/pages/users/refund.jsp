<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="refund.title"/></title>
    <meta name="menu" content="Home"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="refund.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='refund.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="refund" method="post" action="refund" id="refundForm" cssClass="well" readonly="${refund.doApproval == 'true' ? 'readonly' :''}" >
    	<jsp:include page="fragment/refund/refundInput.jsp"></jsp:include>
    	<jsp:include page="fragment/refund/refundDetails.jsp"></jsp:include>
    	<jsp:include page="fragment/refund/accInput.jsp"></jsp:include>
    	 <div class="form-group form-actions">
    		<c:if test="${refund.doApproval != true}">
		        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        </button>
	        </c:if>
	        <c:if test="${refund.doApproval == true}">
	        	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
	        		<button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		           	 <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        	</button>
	        	</security:authorize>
	        </c:if>
	         <c:if test="${not empty refund.id}">
		        <a class="btn btn-success" href="refund/download?id=${refund.id}">
			           	 <i class="fa fa-print" ></i> <fmt:message key="refund.printRefund"/>
			        	</a>
		     </c:if>
		       <%-- <c:if test="${refund.doApproval == true}">
		        <a class="btn btn-success" href="refund/phieuthu/download?id=${refund.id}">
			           	 <i class="fa fa-print" ></i> <fmt:message key="advanceform.printPayment"/>
			        	</a>
		     </c:if> --%>
	        <c:if test="${not empty refund.id && refund.doApproval != true}">
	          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
	              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
	          </button>
	        </c:if>
    	</div>
    </form:form>
    <hr>
    <div class="row">
    	<div class="col-md-7"></div>
    	<div class="col-md-5">
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${refund.creator.username}</span> on ${refund.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${refund.updator.username}</span> on ${refund.lastUpdateDate}
    	</div>
    </div>
</div>
 
<v:javascript formName="refundForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>