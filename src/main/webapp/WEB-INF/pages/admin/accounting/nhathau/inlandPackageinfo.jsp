<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="menu.acct.vantai"/></title>
    <meta name="menu" content="NhathauMenu"/>
</head>

<div class="col-sm-10">	
    <h2></h2>
    <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="accountingvantai.heading"/></a></li>
		    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><fmt:message key="accountingvantai.packageinfo"/></a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		  	<br>
		  	<input type="hidden" id="flag" value="${flag }">
		    <div role="tabpanel" class="tab-pane active" id="home"><jsp:include page="../fragment/inlandpackageinfo/vantaiList.jsp"></jsp:include></div>
		    <div role="tabpanel" class="tab-pane" id="settings"><jsp:include page="../fragment/inlandpackageinfo/thongquanList.jsp"></jsp:include></div>
		  </div>
</div>
<script type="text/javascript" src="<c:url value='/scripts/advanceRefund.js'/>"></script>
