<%@ include file="/common/taglibs.jsp" %>
<style>
.highlight {
	background : #38b44a !important;
}
.input-amount {
	margin: 0.2em !important;
	width: 6em !important;
}
</style>
<head>
    <title><fmt:message key="menu.contractor.payment.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

	<h2><fmt:message key="menu.contractor.payment.title"/></h2>
    <jsp:include page="searchContractorPayment.jsp"></jsp:include>
    <input type="hidden" value="${approve }" id="approve"/>
    <table id="truckingList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
            	<th><fmt:message key="trucking.nhathau"/></th>
            	<th><fmt:message key="contseal.noOfCont" /></th>
            	<th><fmt:message key="contseal.typeOfCont" /></th>
            	<th><fmt:message key="trucking.searchDate" /></th>
                <th><fmt:message key="trucking.phiAelChuaChi"/></th>
                <th><fmt:message key="trucking.phiChiHoChuaChi"/></th>
                <th><fmt:message key="trucking.phiAelDaChi"/></th>
                <th><fmt:message key="trucking.phiChiHoDaChi"/></th>
                <th><fmt:message key="trucking.tongThuKhachHang"/></th>
                <th><fmt:message key="trucking.chiTien"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.nhathau"/></th>
                <th><fmt:message key="contseal.noOfCont" /></th>
            	<th><fmt:message key="contseal.typeOfCont" /></th>
            	<th><fmt:message key="trucking.searchDate" /></th>
                <th><fmt:message key="trucking.phiAelChuaChi"/></th>
                <th><fmt:message key="trucking.phiChiHoChuaChi"/></th>
                <th><fmt:message key="trucking.phiAelDaChi"/></th>
                <th><fmt:message key="trucking.phiChiHoDaChi"/></th>
                <th><fmt:message key="trucking.tongThuKhachHang"/></th>
                <th><fmt:message key="trucking.chiTien"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${truckings}" var="trucking" varStatus="idx">
        	<tr params="docId=${trucking.id}" class="${trucking.truckAccounting.payMoneyStatus == 1 ? '':'impress' }">
                <td>${idx.index+1}</td>
                <td>${trucking.truckingservice.docsgeneral.jobNo}</td>
                <td>${trucking.nhathau.code}</td>
              	<td>${trucking.consteal.noOfCont }</td>
              	<td>${trucking.consteal.typeOfCont.value}</td>
              	<td>${trucking.truckingservice.docsgeneral.docReceiveDate}</td>
              	<td>
           			<c:if test="${not empty trucking.truckAccounting.phiAelChuaChi and trucking.truckAccounting.phiAelChuaChi > 0}">
						<button id='${trucking.id}_0'
							onclick="payMoney('${trucking.nhathau.code}_${trucking.truckingservice.docsgeneral.jobNo}','${trucking.id}_0', 
							${trucking.truckAccounting.phiAelChuaChi})">
							<fmt:formatNumber pattern="#,###"
								value="${trucking.truckAccounting.phiAelChuaChi}"></fmt:formatNumber>
						</button>
					</c:if> 
					<c:if test="${empty trucking.truckAccounting.phiAelChuaChi or trucking.truckAccounting.phiAelChuaChi == '0.00'}">
           				0
           			</c:if>

				</td>
              	<td>
              		<c:if test="${not empty trucking.truckAccounting.phiChiHoChuaChi and trucking.truckAccounting.phiChiHoChuaChi > 0}">
						<button id='${trucking.id}_1'
							onclick="payMoney('${trucking.nhathau.code}_${trucking.truckingservice.docsgeneral.jobNo}', '${trucking.id}_1', 
							${trucking.truckAccounting.phiChiHoChuaChi})">
							<fmt:formatNumber pattern="#,###"
								value="${trucking.truckAccounting.phiChiHoChuaChi}"></fmt:formatNumber>
						</button>
					</c:if> 
					<c:if test="${empty trucking.truckAccounting.phiChiHoChuaChi or trucking.truckAccounting.phiChiHoChuaChi == '0.00'}">
            			0
            		</c:if>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.truckAccounting.phiAelDaChi}"></fmt:formatNumber>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.truckAccounting.phiChiHoDaChi}"></fmt:formatNumber>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.truckAccounting.tong}"></fmt:formatNumber>
              	</td>
              	<td>
              		<c:choose>
              			<c:when test="${trucking.truckAccounting.payMoneyStatus == 0}">
              				<fmt:message key="contractor.payment.type.no"/>
              			</c:when>
              			<c:when test="${trucking.truckAccounting.payMoneyStatus == 1}">
              				<fmt:message key="contractor.payment.type.yes"/>
              			</c:when>
              			<c:otherwise>
              				<fmt:message key="contractor.payment.type.still"/>
              			</c:otherwise>
              		</c:choose>
              	</td>
            </tr> 
        </c:forEach> 
        </tbody>
    </table>
<div id="voucher-info-modal" style="display:none;">
	<table class="display table table-striped table-bordered table-hover">
		<tbody>
			<tr><td><fmt:message key="moneybook.voucherType"/></td><td id="vi-vouchertype"></td></tr>
			<tr id="bank-info"><td><fmt:message key="bank.name"/></td>
				<td><select id="vi-bank">
					<c:forEach var="entry" items="${banks}">
						<option value="${entry.id}">${entry.code}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr><td><fmt:message key="moneybook.amount"/></td><td id="vi-amount"></td></tr>
			<tr><td><fmt:message key="moneybook.sum"/></td><td id="vi-sum"></td></tr>
			<tr><td><fmt:message key="moneybook.date"/></td><td><input id="vi-date" /></td></tr>
			<tr><td><fmt:message key="moneybook.voucherNo"/></td><td><input id="vi-id" placeholder="Input voucher no"/></td></tr>
			<tr><td><fmt:message key="moneybook.description"/></td><td><input id="vi-reason" placeholder="Content"/></td></tr>
		</tbody>
	</table>
	<span id="error-msg" style="color: red;"></span>
</div>
<script>
var multiplePrice = [];
function payMoney(jobNo, buttonId, buttonAmount) {
	var button = $("#"+buttonId);
	var priceLabel = jobNo;
	if (button.hasClass("highlight")) {
		var index = -1;
		for (index = 0; index < multiplePrice.length; index++) {
			if (multiplePrice[index].id === buttonId) {
				break;
			}
		}
		if (index > -1) {
			multiplePrice.splice(index, 1);
			button.removeClass("highlight");
		}	
		
	} else {
		var jobId = buttonId.split("_")[0];
		var type = buttonId.substring(buttonId.length - 1);
		if (type == '0') {
			priceLabel += "_AEL";
		} else {
			priceLabel += "_CH";
		}
		var buttonAmount = {
				"id" : buttonId,
				"jobId" : jobId,
				"jobNo" : jobNo,
				"type" : type,
				"priceLabel": priceLabel,
				"buttonAmount": buttonAmount,
				"inputAmount" : buttonAmount
				
			};
		multiplePrice.push(buttonAmount);
		button.addClass("highlight");
	}
}

function processPayMoney(moneyType) {
	if (multiplePrice.length > 0) {
		$.ajax({
		    type: "GET",
		    url: "payMoney",
		    data: {"moneyType": moneyType},
		    success: function(msg){
		    	/* reviewPayMoney(id, jobNo, feeType, amount, msg); */
		    	reviewPayMoney(moneyType, multiplePrice, msg);
		    },
		    error: function(msg){
		    	alert("not ok");
		    }
		}); 
	} else {
		alert('Please choose at least one value');
	}
}

function reviewPayMoney(moneyType, multiplePrice, voucherInfo) {
	var sumAmount = 0;
	var multipleAmount = "";
	var refNo = "";
	for (var i = 0; i < multiplePrice.length; i++) {
		var pi = multiplePrice[i];
		sumAmount += pi.buttonAmount;
		refNo += pi.id + "_" + pi.inputAmount + ",";
		multipleAmount += pi.priceLabel  + "<input class='input-amount' id='" + pi.id + "' value='" + pi.buttonAmount + "'></input><br>";
	}

	var data = JSON.parse(voucherInfo);
	var feeTypeName = moneyType == 0 ? "<fmt:message key='moneybook.voucherType.phieuchi'/>" : 
		 "<fmt:message key='moneybook.voucherType.unc'/>";
	$("#vi-vouchertype").html(feeTypeName);
	$("#vi-amount").html(multipleAmount);
	$("#vi-sum").html(sumAmount.toLocaleString('en-IN'));
	var jsonData = {"moneys" : multiplePrice};
	bootbox.dialog({
		   closeButton: false,
	       message: $("#voucher-info-modal").html(),
	       title: "PAY MONEY CONFIRMATION",
	       className: "modal-darkorange",
	       buttons: {
	    	   "Confirm": {
	               className: "btn-blue",
	               callback: function () {
            	    	$.ajax({
            			    type: "POST",
            			    url:  "saveTruckingMoney",
            			    data: { 
           			    		"moneyType" : moneyType,
           			    		"bankId": $(".modal-content #vi-bank").val(),
           			    		"date" : $(".modal-content #vi-date").val(),
       		    			    "voucherNo" : $(".modal-content #vi-id").val(),
       		    			    "amount" : sumAmount,
       		    			    "reason" : $(".modal-content #vi-reason").val(),
       		    				"data" : JSON.stringify(jsonData),
       		    				"refNo" : refNo
	       		    		}, //for update docs payMoneyStatus
            			    success: function(msg){
            			    	/* for (var i = 0; i < multiplePrice.length; i++) {
            			    		var v = multiplePrice[i].split("-");    		
            			    		var td = $('#' + v[0]).closest("td");
            			    		var am = v[1];
		        	       		    td.html(am.toLocaleString('en-IN'));
		        	       		    
		        	       		    var statusStr = "Updated";
		        	       		 	td.closest("tr").find("td").last().html(statusStr);
			        	       		
            			    	} */	        
            			    	window.location = "manageContractorPayment";
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
	
	if (moneyType == 0) {
		$(".modal-content #bank-info").remove();
	} else {
		$(".modal-content .select2-container").remove();
		$(".modal-content #vi-bank").css({"display": "inline"});
	}
	
	$(".modal-content #vi-id").val(data.voucherNoPrint);
	$(".modal-content #vi-date").datepicker("setDate", new Date());
	$(".modal-content #vi-date").datepicker().on('changeDate', function(e) {
		$(this).datepicker('hide');
	})
	
	$(".modal-content .input-amount").change(function() {
		var v1 = parseFloat($(this).attr("value"));
		var v2 = parseFloat($(this).val());
	    if (v1 < v2) {
	    	$(".modal-content #error-msg").text("To much");
	    	
	    	$(".modal-content button").first().hide();
	    } else {
	    	//update multiplePrice
	    	refNo = "";
	    	for (var i = 0; i < multiplePrice.length; i++) {
	    		var pi = multiplePrice[i];
	    		if (pi.id == $(this).attr("id")) {
	    			pi.inputAmount = $(this).val();
	    		}
	    		refNo += pi.id + "_" + pi.inputAmount + ",";
	    	}
	    	
	    	sumAmount += v2 - v1;
	    	
	    	$(".modal-content #vi-sum").html(sumAmount.toLocaleString('en-IN'));
	    	
	    	$(".modal-content #error-msg").text("");
	    	$(".modal-content button").first().show();
	    }
	});
}


</script>
<script src="../../scripts/bootbox/bootbox.js"></script>
