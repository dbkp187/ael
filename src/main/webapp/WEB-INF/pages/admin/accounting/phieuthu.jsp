<%@ include file="/common/taglibs.jsp"%>
<script src="<c:url value="/scripts/custom/phieuthu.js" />"></script>
<head>
    <title><fmt:message key="menu.acct.phieuthu"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>
 <c:set var="delObject" scope="request"><fmt:message key="menu.acct.phieuthu"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>
<h2><fmt:message key='menu.acct.phieuthu'/></h2>
 
<div class="col-sm-10">
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="refund" method="post" action="phieuthu" id="refundForm" cssClass="well" readonly="${refund.doApproval == 'true' ? 'readonly' :''}" >
    	<jsp:include page="fragment/phieuthu/phieuthuInput.jsp"></jsp:include>
    	<jsp:include page="fragment/phieuthu/phieuthuDetails.jsp"></jsp:include>
<%--     	<jsp:include page="fragment/phieuthu/accInput.jsp"></jsp:include> --%>
    	 <div class="form-group form-actions">
    		<c:if test="${refund.doApproval != true}">
		        <button type="submit" class="btn btn-primary" name="save" onclick="bCancel=false">
		            <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        </button>
	        </c:if>
	        <c:if test="${refund.doApproval == true}">
	        	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
	        		<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false">
		           	 <i class="fa fa-floppy-o"></i> <fmt:message key="button.save"/>
		        	</button>
	        	</security:authorize>
	        </c:if>
	        <c:if test="${not empty refund.id and empty refund.moneyBook}">
	        	<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> 
		        	<a class="btn btn-success" id="btn-download" onclick="downloadPhieuthu('${refund.id}')">
		           	 <i class="fa fa-print"></i> <fmt:message key="refund.printPayment"/>
		        	</a>
	        	</security:authorize>
	        </c:if>
	        <c:if test="${not empty refund.id && refund.doApproval != true}">
	          <button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
	              <i class="fa fa-trash"></i> <fmt:message key="button.delete"/>
	          </button>
	        </c:if>
	        <c:if test="${not empty refund.id}">
		        <button type="button" class="btn btn-info" name="addnew" onclick="addNewPhieuthuAdmin();">
	              <i class="fa fa-plus"></i> <fmt:message key="button.addPhieuthuAdmin"/>
	            </button>
	            <button type="button" class="btn btn-info" name="addnew" onclick="addNewPhieuthuJob();">
	              <i class="fa fa-plus"></i> <fmt:message key="button.addPhieuthuJob"/>
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
<div id="voucher-info-modal" style="display:none;">
	<table class="display table table-striped table-bordered table-hover">
		<tbody>
			<tr><td><fmt:message key="advanceform.refcode"/></td><td id="vi-refcodes"></td></tr>
			<tr><td><fmt:message key="advanceform.employee"/></td><td id="vi-name"></td></tr>
			<tr><td><fmt:message key="advanceform.total"/></td><td id="vi-amount"></td></tr>
			<tr><td><fmt:message key="moneybook.date"/></td><td><input id="vi-date" /></td></tr>
			<tr><td><fmt:message key="moneybook.voucherNo"/></td><td><input id="vi-id" placeholder="Input voucher no"/></td></tr>
			<tr><td><fmt:message key="moneybook.description"/></td><td><input id="vi-reason" placeholder="Content"/></td></tr>
		</tbody>
	</table>
	<!-- <span id="error-msg" style="color: red;"></span> -->
</div>
<v:javascript formName="phieuthuForm" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>
<script>
function addNewPhieuthuAdmin() {
	var msg = "<fmt:message key='notify.saveBeforeGo'/>";
	if (confirm(msg)) {
		window.location.href='phieuthu?isAdmin=1';
	}
}

function addNewPhieuthuJob() {
	var msg = "<fmt:message key='notify.saveBeforeGo'/>";
	if (confirm(msg)) {
		window.location.href='phieuthu?isAdmin=0';
	}
}

function addNewPhieuthuOther() {
	var msg = "<fmt:message key='notify.saveBeforeGo'/>";
	if (confirm(msg)) {
		window.location.href='phieuthu?isAdmin=2';
	}
}

function downloadPhieuthu(id) {
	$.ajax({
	    type: "POST",
	    url: "phieuthu/print",
	    data: {"id": id},
	    success: function(msg){
	    	reviewVoucherPayment(id, msg);
	    },
	    error: function(msg){
	    	alert("not ok");
	    }
	}); 
}

function reviewVoucherPayment(ids, voucherInfo) {
	var data = JSON.parse(voucherInfo);
	var name = $("#employee-selection :selected").text();
	$("#vi-name").html(name);
	$("#vi-refcodes").html(data.refCodes);
	$("#vi-amount").html(data.amount.toLocaleString('en-IN'));

	bootbox.dialog({
		   closeButton: false,
	       message: $("#voucher-info-modal").html(),
	       title: "PRINT RECEIPT CONFIRMATION",
	       className: "modal-darkorange",
	       buttons: {
	    	   "Confirm": {
	               className: "btn-blue",
	               callback: function () {
            	    	
            	    	$.ajax({
            			    type: "POST",
            			    url:  "phieuthu/createmoneybook",
            			    data: { "date" : $(".modal-content #vi-date").val(),
	       		    			    "voucherNo" : $(".modal-content #vi-id").val(),
	       		    			    "reason" : $(".modal-content #vi-reason").val()},
            			    success: function(msg){
            			    	if (msg == "ok") { 
	        	       		    	window.location.href="phieuthu/download?id=" + ids;
	        	       		    	$('#btn-download').addClass('disabled');
            			    	} else {
            			    		alert(msg);
            			    		//reviewVoucherPayment(ids, voucherInfo, type);
            			    	}
            			    },
            			    error: function(msg) {
            			    	alert(msg);
            			    }
            			})
	               }
	           }, 
	           "Cancel": {
	               className: "btn-red"
	           }
	       }
	});
	
	$(".modal-content #vi-id").val(data.voucherNoPrint);
	$(".modal-content #vi-date").datepicker("setDate", new Date());
	$(".modal-content #vi-date").datepicker().on('changeDate', function(e) {
		$(this).datepicker('hide');
	})
}
</script>
<script src="../../scripts/bootbox/bootbox.js"></script>