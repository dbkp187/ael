<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>
<style>
.highlight {
	background: #38b44a !important;
}
</style>
<div class="col-sm-10">
<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="accounting.feeSummary" /></a></li>
		<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><fmt:message key="accounting.feeNhathau" /></a></li>
		<li role="presentation"><a href="#settings-advance" aria-controls="settings-advance" role="tab" data-toggle="tab"><fmt:message key="accounting.feeNhathauAdvance" /></a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<input type="hidden" id="flag" value="${flag }">
		<div role="tabpanel" class="tab-pane active" id="home"><jsp:include page="feeManifest.jsp"></jsp:include></div>
		<div role="tabpanel" class="tab-pane" id="settings"><jsp:include page="feeNhathau.jsp"></jsp:include></div>		
		<div role="tabpanel" class="tab-pane" id="settings-advance"><jsp:include page="feeNhathauAdvance.jsp"></jsp:include></div>	
	</div>    
</div>

<script type="text/javascript">
 $(document).ready(function(){
	 var checkNestedTable = function(){
		 $(".nestedDatatable tbody td i").each(function(){
			 var nTr = $(this).parents('tr')[0];
			 var reloadChild = function(tr){
				 $(tr).find("td i").click();
				 $(tr).find("td i").click();
			 };
			 
			 $(nTr).bind("afterOpenChild",function(ev,oInnerTable){
				 $(oInnerTable).find("td.actions a").on("click",function(e){
					 e.preventDefault();
					 var link = $(this).attr("href");
					 $.ajax({
						  type: "POST",
						  async:false,
						  url: link,
						  success: function(data){
							  if (data == "error"){
								  UTIL.showMessage(showMessage("accounting.changeApprovalError"), "error");
							  }else{
								  reloadChild(nTr);
							  }
						  },
						  dataType: "text",
						  error: function (xhr, status,response) {
							  UTIL.showMessage(showMessage("ajax.error"), "error");
					      }
						});
				 });
			 });
		 });
	 }
	 $('.nestedDatatable').bind('redraw',function(){
		 checkNestedTable();
	 });
	 checkNestedTable();
	 if($('#flag').val() == "1"){		 
	 	$('.nav-tabs a[href="#settings"]').tab('show');
	 } else if($('#flag').val() == "3") {
		$('.nav-tabs a[href="#settings-advance"]').tab('show');
	 }
 });
</script>