<%@ include file="/common/taglibs.jsp" %>
<br>
<div class="col-sm-10">
	<h2><fmt:message key='menu.acct.listphieuthu'/></h2>
	<jsp:include page="searchPhieuThu.jsp"></jsp:include>
	<br/>
	
    <div id="actions" class="btn-group">
    	<a class="btn btn-primary" href="<c:url value='phieuthu?isAdmin=1'/>">
            <i class="fa fa-plus"></i><fmt:message key="button.addPhieuthuAdmin"/></a>
    	<a class="btn btn-primary" href="<c:url value='phieuthu?isAdmin=0'/>">
            <i class="fa fa-plus"></i><fmt:message key="button.addPhieuthuJob"/></a>
        <%-- <a class="btn btn-primary" href="<c:url value='phieuthu?isAdmin=2'/>">
            <i class="fa fa-plus"></i><fmt:message key="button.addPhieuthuOther"/></a> --%>
        <a class="btn btn-success btn-download" onclick="downloadPhieuthu()">
            <i class="fa fa-print"></i> <fmt:message key="refund.printPayment"/></a>
    </div>
    <table id="phieuthuList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
            	<th>RefCode</th>
            	<th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="phieuthu.date"/></th>
                <th><fmt:message key="phieuthu.total"/></th>
                <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th>RefCode</th>
                <th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="phieuthu.date"/></th>
                <th><fmt:message key="phieuthu.total"/></th>
                <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${refundList}" var="adv" varStatus="idx">
        	<tr>
                <td id='${adv.id}'>${idx.index+1}</td>
                <td>${adv.refCode}</td>
                <td>
                	${adv.employee.firstName}&nbsp;${adv.employee.lastName}
                </td>
                <td>
                	<fmt:formatDate value="${adv.date}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="money">
                 	<fmt:formatNumber>${adv.total}</fmt:formatNumber>
                </td>
                 <td>
              		<c:if test="${adv.isRAdmin}">
              			<fmt:message key="refund.adminFee"/>
              		</c:if>
              		<c:if test="${!adv.isRAdmin}">
              			<fmt:message key="refund.manifestFee"/>
              		</c:if>
              	</td>
              	<td>
              		<c:if test="${adv.doPrint}">
              			${adv.moneyBook.voucherNoPrint}
              		</c:if>
              	</td>
                <td>
                	<a href="phieuthu?id=${adv.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
</div>

<style>
	.highlight {
		pointer: cursor;
		background : #38b44a !important;
	}
	.disabled {
	    background: #dddddd;
	}
</style>
<script>

var printedId = "";
var currentRow = null;

$(document).ready(function() {
	onOffButton();
	$( "table" ).on( "click", "tr td:not(:first-child,:last-child)", function() {
		var tr =  $(this).closest("tr");
		
		var id = tr.find("td").first().attr("id");
		var printed = tr.find("td").eq(6).html().trim().length > 0;
		var same = true;
		if (printedId != "" && id != printedId) {
			same = false;
		}
		if (id != null && !printed && same) {
			printedId = id;
			currentRow = tr;
			tr.find("td:not(:first-child,:last-child)").each(function() {
				if($(this).hasClass("highlight")) {
					$(this).removeClass("highlight");
					printedId = "";
					
				} else {
					$(this).addClass("highlight");
				}
			});
		} 
		onOffButton();
	})
});

function onOffButton() {
	if (printedId.length > 0) {
		$('.btn-download').removeClass('disabled');
	} else {
		$('.btn-download').addClass('disabled');
	}
}

function downloadPhieuthu() {
	var ids = printedId; //only download 1 row
	if (printedId.length > 0) {
		$.ajax({
		    type: "POST",
		    url: "phieuthu/print",
		    data: {"id": printedId},
		    success: function(msg){
		    	reviewVoucherPayment(ids, msg);
		    },
		    error: function(msg){
		    	alert("not ok");
		    }
		    
		}); 
	}
}

function reviewVoucherPayment(ids, voucherInfo) {
	var data = JSON.parse(voucherInfo);
	var name = currentRow.find("td").eq(2).text();
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
	        	       		    	currentRow.find("td").eq(6).html($(".modal-content #vi-id").val());
	    	       		        	currentRow.find("td").removeClass("highlight");
	        	       		    	printedId = "";
	        	       		    	currentRow = null;
	        	       		    	$('.btn-download').addClass('disabled');
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
	/* $(".modal-content #vi-reason").val(data.reason); */
	$(".modal-content #vi-date").datepicker("setDate", new Date());
	$(".modal-content #vi-date").datepicker().on('changeDate', function(e) {
		$(this).datepicker('hide');
	})
}
</script>
<script src="../../scripts/bootbox/bootbox.js"></script>