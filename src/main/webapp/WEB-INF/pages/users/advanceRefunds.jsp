<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="advanceList.title"/></title>
    <meta name="menu" content="Home"/>
</head>

<div class="col-sm-12">	
    <h2></h2>
    <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="advanceList.heading"/></a></li>
		    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><fmt:message key="refundList.heading"/></a></li>
		    <li role="presentation"><a href="#sumary" aria-controls="sumary" role="tab" data-toggle="tab"><fmt:message key="advanceSumary.heading"/></a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		  	<input type="hidden" id="flag" value="${flag }">
		    <div role="tabpanel" class="tab-pane active" id="home"><jsp:include page="fragment/advanceForms.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="settings"><jsp:include page="fragment/refunds.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="sumary"><jsp:include page="fragment/advanceSumary.jsp"></jsp:include></div>
		  </div>
		</div>
</div>
<script type="text/javascript" src="<c:url value='/scripts/advanceRefund.js'/>"></script>
