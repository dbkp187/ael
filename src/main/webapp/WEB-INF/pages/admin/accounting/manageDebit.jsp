<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="debit.title" /></title>
<meta name="menu" content="AccountingMenu" />
</head>

<div class="col-sm-10">
	<h2></h2>
	<!-- Nav tabs -->
	<%-- <ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="debit.manifest" /></a></li>
	</ul> --%>

	<!-- Tab panes -->
	<!-- <div class="tab-content"> -->
		<input type="hidden" id="flag" value="${flag }">
		<div role="tabpanel" class="tab-pane active" id="home"><jsp:include page="fragment/debit/debitManifest.jsp"></jsp:include></div>
	<!-- </div> -->
</div>

<script type="text/javascript"
	src="<c:url value='/scripts/advanceRefund.js'/>"></script>
