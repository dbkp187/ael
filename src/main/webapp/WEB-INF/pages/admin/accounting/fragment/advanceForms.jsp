<%@ include file="/common/taglibs.jsp" %>
<br>
<div class="col-sm-12">
	<jsp:include page="searchAdvance.jsp"></jsp:include>
	 <%-- <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
            <hr> --%>
    <!-- <div id="actions" class="btn-group"></div> -->
   	   <a class="btn btn-primary" href="<c:url value='/users/advanceForm?isAdmin=1'/>">
           <i class="fa fa-plus"></i><fmt:message key="button.addAdvanceAdmin"/></a>
       <!-- <span></span> -->
       <a class="btn btn-success btn-download" onclick="downloadPhieuchi(0)">
         	<i class="fa fa-print"></i> <fmt:message key="advanceform.printPayment"/>
       </a>
       <br><br>
       <%-- <span>*<fmt:message key="advanceform.print.notification"/></span> --%>
    
<table id="advanceformListAdmin" class="display nestedDatatable" cellspacing="0" width="100%" 
    	childDetailURL="/admin/accounting/advDetail" 
    	emptyMessage="accounting.fees.detailFailed"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="advanceform.description"/>,
    	<fmt:message key="advanceform.amount"/>,<fmt:message key="accounting.approval" />,
    	<fmt:message key="accounting.changeApproval" />"
    	detailTableMapping="description,amount[money],approvedText[Key]"
    	editDetail="/admin/accounting/changeAdvanceApproval"
    	actionCheck = "checkByAdmin:false,null"
    	actionConfirm = "true"    	
    	successLoadMessage="accounting.fees.detailLoaded"
    	>
        <thead>
            <tr>
<%--             	<th><fmt:message key="table.no"/></th> --%>
				<th><fmt:message key="advanceform.refcode"/></th>
				<th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="advanceform.date"/></th>
                <th><fmt:message key="advanceform.total"/></th>
                 <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.approval"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
<%--                 <th><fmt:message key="table.no"/></th> --%>
				<th><fmt:message key="advanceform.refcode"/></th>
				<th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="advanceform.date"/></th>
                <th><fmt:message key="advanceform.total"/></th>
                 <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.approval"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${advanceformList}" var="adv" varStatus="idx">
        	<c:if test="${not empty adv.advancedetails and adv.isAdmin}">
	        	<tr class="${adv.doApproval ? '':'impress' }" params="id=${adv.id}">
<%-- 	                <td>${idx.index+1}</td> --%>
					<td>${adv.refCode}</td>
					<td>
	                	${adv.employee.firstName}&nbsp;${adv.employee.lastName}
	                </td>
	                <td>
	                	<fmt:formatDate value="${adv.date}" pattern="yyyy-MM-dd"/>
	                </td>
	                 <td class="money">
	                 	<fmt:formatNumber pattern="#,###" value="${adv.total}"></fmt:formatNumber>
	                </td>
	                <td>
              		<c:if test="${adv.isAdmin}">
              			<fmt:message key="refund.adminFee"/>
              		</c:if>
<%--               		<c:if test="${!adv.isAdmin}"> --%>
<%--               			<fmt:message key="refund.manifestFee"/> --%>
<%--               		</c:if> --%>
              	</td>
	              	<td class="icon-status">
	              		<c:if test="${adv.doApproval}">
	              			<a><i class="fa fa-check"></i></a>
	              		</c:if>
	              		<%-- <c:if test="${adv.doApproval == false}">
	              			<a><i class="fa fa-clock-o"></i></a>
	              		</c:if> --%>
	              	</td>
	              	<td class="icon-status">
	              		<c:if test="${adv.doPrint}">
	              			${adv.moneyBook.voucherNoPrint}
	              		</c:if>
	              	</td>
	                <td>
	                	<a href="${ctx}/users/advanceForm?id=${adv.id}" class="iconButton" 
	                	title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa fa-arrow-right"></i></a>
	                </td>
	            </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <hr>
    	<a class="btn btn-primary" href="<c:url value='/users/advanceForm?isAdmin=0'/>">
            <i class="fa fa-plus"></i><fmt:message key="button.addAdvanceJob"/></a>
   		<a class="btn btn-success btn-download" onclick="downloadPhieuchi(0)">
         	<i class="fa fa-print"></i> <fmt:message key="advanceform.printPayment"/>
      	</a>
    <br><br>
            
    <table id="advanceformListJob" class="display nestedDatatable" cellspacing="0" width="100%" 
    	childDetailURL="/admin/accounting/advDetail" 
    	emptyMessage="accounting.fees.detailFailed"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="advanceform.fileCus"/>,
    	<fmt:message key="advanceform.goodDes"/>,<fmt:message key="advanceform.description"/>,
    	<fmt:message key="advanceform.amount"/>,<fmt:message key="accounting.approval" />,
    	<fmt:message key="accounting.changeApproval" />"
    	detailTableMapping="jobNo,goodDes,description,amount[money],approvedText[Key]"
    	editDetail="/admin/accounting/changeAdvanceApproval"
    	actionCheck = "checkByAdmin:false,null"
    	actionConfirm = "true"    	
    	successLoadMessage="accounting.fees.detailLoaded"
    	>
        <thead>
            <tr>
<%--             	<th><fmt:message key="table.no"/></th> --%>
				<th><fmt:message key="advanceform.refcode"/></th>
				<th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="advanceform.date"/></th>
                <th><fmt:message key="advanceform.total"/></th>
                <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.approval"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
<%--                 <th><fmt:message key="table.no"/></th> --%>
				<th><fmt:message key="advanceform.refcode"/></th>
				<th><fmt:message key="advanceform.employee"/></th>
                <th><fmt:message key="advanceform.date"/></th>
                <th><fmt:message key="advanceform.total"/></th>
                <th><fmt:message key="refund.type"/></th>
                <th><fmt:message key="advanceform.approval"/></th>
                <th><fmt:message key="advanceform.print"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${advanceformList}" var="adv" varStatus="idx">
        	<c:if test="${not empty adv.advancedetails and !adv.isAdmin}">
	        	<tr class="${adv.doApproval ? '':'impress' }" params="id=${adv.id}">
<%-- 	                <td>${idx.index+1}</td> --%>
					<td>${adv.refCode}</td>
					<td>
	                	${adv.employee.firstName}&nbsp;${adv.employee.lastName}
	                </td>
	                <td>
	                	<fmt:formatDate value="${adv.date}" pattern="yyyy-MM-dd"/>
	                </td>
	                 <td class="money" >
	                 	<fmt:formatNumber pattern="#,###" value="${adv.total}"></fmt:formatNumber>
	                </td>
	                <td>
<%--               		<c:if test="${adv.isAdmin}"> --%>
<%--               			<fmt:message key="refund.adminFee"/> --%>
<%--               		</c:if> --%>
              		<c:if test="${!adv.isAdmin}">
              			<fmt:message key="refund.manifestFee"/>
              		</c:if>
              	</td>
	              	<td class="icon-status">
	              		<c:if test="${adv.doApproval}">
	              			<a><i class="fa fa-check"></i></a>
	              		</c:if>
	              		<%-- <c:if test="${adv.doApproval == false}">
	              			<a><i class="fa fa-clock-o"></i></a>
	              		</c:if> --%>
	              	</td>
	              	<td class="icon-status">
	              		<c:if test="${adv.doPrint}">
	              			${adv.moneyBook.voucherNoPrint}
	              		</c:if>
	              	</td>
	                <td>
	                	<a href="${ctx}/users/advanceForm?id=${adv.id}" class="iconButton" 
	                	title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-arrow-right"></i></a>
	                </td>
	            </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="voucher-info-modal" style="display:none;">
	<table class="display table table-striped table-bordered table-hover">
		<tbody>
			<tr><td><fmt:message key="advanceform.refcode"/></td><td id="vi-refcodes"></td></tr>
			<tr><td><fmt:message key="advanceform.employee"/></td><td id="vi-name"></td></tr>
			<tr id="bank-info"><td><fmt:message key="bank.name"/></td>
				<td><select id="mb-bank">
					<c:forEach var="entry" items="${banks}">
						<option value="${entry.id}">${entry.code}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr><td><fmt:message key="advanceform.total"/></td><td id="vi-amount"></td></tr>
			<tr><td><fmt:message key="moneybook.date"/></td><td><input id="vi-date" /></td></tr>
			<tr><td><fmt:message key="moneybook.voucherNo"/></td><td><input id="vi-id" placeholder="Input voucher no"/></td></tr>
			<tr><td><fmt:message key="moneybook.description"/></td><td><input id="vi-reason" placeholder="Content"/></td></tr>
		</tbody>
	</table>
	<!-- <span id="error-msg" style="color: red;"></span> -->
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

var printedIds = [];
var printedGroupString = "";
var currentRow = [];

$(document).ready(function() {
	
	onOffButton();
	$( "table" ).on( "click", "tr td:not(:first-child,:last-child)", function() {
		var settingTab = false;
		var tr =  $(this).closest("tr");
		
		//groupString = tr.find("td").eq(2).text() + " " + tr.find("td").eq(3).text();
		if($(this).closest(".tab-pane").attr("id") == "settings") {
			//neu la chi phi, group theo ten
			groupString = tr.find("td").eq(2).text(); 
		} else {
			//neu la tam ung, group theo ten va ngay
			groupString = tr.find("td").eq(2).text() + " " + tr.find("td").eq(3).text(); 
		}
		
		var same = true;
		if (printedGroupString != "" && groupString.localeCompare(printedGroupString) != 0) {
			same = false;
		}
		var id = tr.attr("params");
		var printed = tr.find("td").eq(7).html().trim().length > 0;
		
		if (id != null && !tr.hasClass("impress") && same && !printed) {
			idNum = id.substring(id.indexOf('=') + 1);
			printedIds.push(idNum);
			currentRow.push(tr);
			
			tr.find("td:not(:first-child,:last-child)").each(function() {
				if($(this).hasClass("highlight")) {
					$(this).removeClass("highlight");
					
					var index = printedIds.indexOf(idNum);
					if (index > -1) {
						printedIds.splice(index, 1);
						currentRow.splice(index, 1);
					}
					
					if (printedIds.length == 0) {
						printedGroupString = "";
						currentRow = [];
					}
				} else {
					$(this).addClass("highlight");
					printedGroupString = groupString;
				}
			});
		} 
		onOffButton();
	})
});

function onOffButton() {
	if (printedGroupString.length > 0) {
		$('.btn-download').removeClass('disabled');
	} else {
		$('.btn-download').addClass('disabled');
	}
}

function downloadPhieuchi(voucherType) {
	if (printedIds.length > 0) {
		var ids = printedIds[0];
		for(var i = 1; i < printedIds.length; i ++) {
			ids += "," + printedIds[i];
		}
		if (voucherType == 0) {//advanceForm
			$.ajax({
			    type: "POST",
			    url: "../../users/advanceForm/phieuchi/print",
			    data: {"id": ids},
			    success: function(msg){
			    	reviewVoucherPayment(ids, msg, "advanceForm");
			    }
			}); 
		} else if (voucherType == 1) {
			$.ajax({
			    type: "POST",
			    url: "../../users/refund/phieuchi/print",
			    data: {"id": ids},
			    success: function(msg){
			    	reviewVoucherPayment(ids, msg, "refund");
			    }
			}); 
		} else { //2 : UNC refund
			$.ajax({
			    type: "POST",
			    url: "../../users/refund/phieuchi/print?unc=1",
			    data: {"id": ids},
			    success: function(msg){
			    	reviewVoucherPayment(ids, msg, "unc");
			    }
			}); 
		}
	}
}

function reviewVoucherPayment(ids, voucherInfo, type) {
	var data = JSON.parse(voucherInfo);
	var name = currentRow[0].find("td").eq(2).text();
	$("#vi-name").html(name);
	$("#vi-refcodes").html(data.refCodes);
	$("#vi-amount").html(data.amount.toLocaleString('en-IN'));

	bootbox.dialog({
		   closeButton: false,
	       message: $("#voucher-info-modal").html(),
	       title: "PRINT PAYMENT SHEET CONFIRMATION",
	       className: "modal-darkorange",
	       buttons: {
	    	   "Confirm": {
	               className: "btn-blue",
	               callback: function () {
            	    	$.ajax({
            			    type: "POST",
            			    url: "../../users/" + type + "/phieuchi/createmoneybook",
            			    data: { "date" : $(".modal-content #vi-date").val(),
	       		    			    "voucherNo" : $(".modal-content #vi-id").val(),
	       		    			    "reason" : $(".modal-content #vi-reason").val(),
	       		    			    "bankId": $(".modal-content #mb-bank").val()},
            			    success: function(msg){
            			    	if (msg == "ok") { 
            			    		if (type != "unc") {
	        	       		    		window.location.href="../../users/" + type + "/phieuchi/download?id=" + ids;
            			    		}
	        	       		    	for (var i = 0; i < currentRow.length; i++) {
	        	       		    		currentRow[i].find("td").eq(7).html($(".modal-content #vi-id").val());
	        	       		        	currentRow[i].find("td").removeClass("highlight");
	        	       		    	}
	            			    	printedGroupString = "";
	        	       		    	printedIds = [];
	        	       		    	currentRow = [];
	        	       		    	//onOffButton();
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
	
	if (type != "unc") {
		$(".modal-content #bank-info").remove();
	} else {
		$(".modal-content .select2-container").remove();
		$(".modal-content #mb-bank").css({"display": "inline"});
	}
	$(".modal-content #vi-id").val(data.voucherNoPrint);
	/* $(".modal-content #vi-reason").val(data.reason); */
	$(".modal-content #vi-date").datepicker("setDate", new Date());
	$(".modal-content #vi-date").datepicker().on('changeDate', function(e) {
		$(this).datepicker('hide');
	})
}
</script>
<script src="../../scripts/bootbox/bootbox.js"></script>