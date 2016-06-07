<%@ include file="/common/taglibs.jsp"%>
<script src="<c:url value="/scripts/custom/advanceForm.js" />"></script>
<script>var ctx = "<%=request.getContextPath()%>"</script>
<script>var isApproved = ${advanceform.doApproval}</script>
<head>
    <title><fmt:message key="advanceform.title"/></title>
    <meta name="menu" content="Home"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="advanceform.title"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
    <h2><fmt:message key='advanceform.heading'/></h2>
 
<div class="col-sm-12">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="advanceform" method="post" action="advanceForm" id="advanceForm" cssClass="well" readonly="${advanceform.doApproval == 'true' ? 'readonly' :''}" >
    	<jsp:include page="fragment/advance/advanceInput.jsp"></jsp:include>
    	<jsp:include page="fragment/advance/advanceDetails.jsp"></jsp:include>
    	<jsp:include page="fragment/advance/accInput.jsp"></jsp:include>
    	 <div class="form-group form-actions">
    		<c:if test="${advanceform.doApproval != true}">
		        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        </button>
	        </c:if>
	        <c:if test="${advanceform.doApproval == true}">
	        	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
	        	
	        		<button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		           	 <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        	</button>
		        	<%-- <a class="btn btn-success" href="advanceForm/phieuchi/download?id=${advanceform.id}">
		           	 <i class="fa fa-print"></i> <fmt:message key="advanceform.printPayment"/>
		        	</a> --%>
	        	</security:authorize>
	        </c:if>
	        <c:if test="${not empty advanceform.id}">
	        	<c:if test="${not empty advanceform.advancedetails[0]}">
	        	<a class="btn btn-success" href="advanceForm/download?id=${advanceform.id}">
							<i class="fa fa-print"></i>
							<fmt:message key="advanceform.printAdvance" />
						</a>
	        	</c:if>
	        	
	        </c:if>
	        <c:if test="${not empty advanceform.id && advanceform.doApproval != true}">
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
    		<fmt:message key="notify.createdBy"/>: <span style="color:green;">${advanceform.creator.username}</span> on ${advanceform.createdDate}
    		<br/>
    		<fmt:message key="notify.lastUpdatedBy"/>: <span style="color:green;">${advanceform.updator.username}</span> on ${advanceform.lastUpdateDate}
    	</div>
    </div>
</div> 



<c:set var="scripts" scope="request">
<v:javascript formName="advanceForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value="/scripts/validator.jsp"/>"></script>
</c:set>
