<%@ include file="/common/taglibs.jsp" %>
<style>
.highlight {
	background : #38b44a !important;
}
.input-amount {
	margin: 0.2em !important;
}
</style>
<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

	<h2><fmt:message key="debit.manifest"/></h2>
    <jsp:include page="searchDebit.jsp"></jsp:include>
    <input type="hidden" value="${approve }" id="approve"/>
    <table id="truckingList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="trucking.phiAelChuaThu"/></th>
                <th><fmt:message key="trucking.phiChiHoChuaThu"/></th>
                <th><fmt:message key="trucking.phiAelDaThu"/></th>
                <th><fmt:message key="trucking.phiChiHoDaThu"/></th>
                <th><fmt:message key="trucking.tongThuKhachHang"/></th>
                <th><fmt:message key="debit.thutien"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="trucking.typeOfDocs"/></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="trucking.phiAelChuaThu"/></th>
                <th><fmt:message key="trucking.phiChiHoChuaThu"/></th>
                <th><fmt:message key="trucking.phiAelDaThu"/></th>
                <th><fmt:message key="trucking.phiChiHoDaThu"/></th>
                <th><fmt:message key="trucking.tongThuKhachHang"/></th>
                <th><fmt:message key="debit.thutien"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${docsgeneralList}" var="trucking" varStatus="idx">
        	<tr params="docId=${trucking.id}" class="${trucking.docsAccounting.collectMoneyStatus == 1 ? '':'impress' }">
                <td>${idx.index+1}</td>
              	<td>${trucking.jobNo}</td>
              	<td><fmt:message key="${trucking.typeOfDocs.textKey}"/></td>
              	<td><fmt:formatDate value="${trucking.truckingservice.docsgeneral.docReceiveDate}" pattern="dd/MM/yyyy"/></td>
              	<td>
           			<c:if test="${trucking.docsAccounting.phiAelChuaThu > 0}">
						<button id='${trucking.id}_0'
							onclick="collectMoney('${trucking.jobNo}','${trucking.id}_0', ${trucking.docsAccounting.phiAelChuaThu})">
							<fmt:formatNumber pattern="#,###"
								value="${trucking.docsAccounting.phiAelChuaThu}"></fmt:formatNumber>
						</button>
					</c:if> 
					<c:if test="${trucking.docsAccounting.phiAelChuaThu == '0.00'}">
           				0
           			</c:if>

				</td>
              	<td>
              		<c:if test="${trucking.docsAccounting.phiChiHoChuaThu > 0}">
						<button id='${trucking.id}_1'
							onclick="collectMoney('${trucking.jobNo}', '${trucking.id}_1', ${trucking.docsAccounting.phiChiHoChuaThu})">
							<fmt:formatNumber pattern="#,###"
								value="${trucking.docsAccounting.phiChiHoChuaThu}"></fmt:formatNumber>
						</button>
					</c:if> 
					<c:if test="${trucking.docsAccounting.phiChiHoChuaThu == '0.00'}">
            			0
            		</c:if>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.docsAccounting.phiAelDaThu}"></fmt:formatNumber>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.docsAccounting.phiChiHoDaThu}"></fmt:formatNumber>
				</td>
              	<td><fmt:formatNumber pattern="#,###"
								value="${trucking.docsAccounting.tong}"></fmt:formatNumber>
              	</td>
              	<td>
              		<c:choose>
              			<c:when test="${trucking.docsAccounting.collectMoneyStatus == 0}">
              				<fmt:message key="debit.type.no"/>
              			</c:when>
              			<c:when test="${trucking.docsAccounting.collectMoneyStatus == 1}">
              				<fmt:message key="debit.type.yes"/>
              			</c:when>
              			<c:otherwise>
              				<fmt:message key="debit.type.still"/>
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
function collectMoney(jobNo, buttonId, buttonAmount) {
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

function processCollectMoney(moneyType) {
	if (multiplePrice.length > 0) {
		$.ajax({
		    type: "GET",
		    url: "collectMoney",
		    data: {"moneyType": moneyType},
		    success: function(msg){
		    	/* reviewCollectMoney(id, jobNo, feeType, amount, msg); */
		    	reviewCollectMoney(moneyType, multiplePrice, msg);
		    },
		    error: function(msg){
		    	alert("not ok");
		    }
		}); 
	} else {
		alert('Please choose at least one value');
	}
}

function reviewCollectMoney(moneyType, multiplePrice, voucherInfo) {
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
	var feeTypeName = moneyType == 0 ? "<fmt:message key='moneybook.voucherType.phieuthu'/>" : 
		 "<fmt:message key='moneybook.voucherType.nttk'/>";
	$("#vi-vouchertype").html(feeTypeName);
	$("#vi-amount").html(multipleAmount);
	$("#vi-sum").html(sumAmount.toLocaleString('en-IN'));
	var jsonData = {"moneys" : multiplePrice};
	bootbox.dialog({
		   closeButton: false,
	       message: $("#voucher-info-modal").html(),
	       title: "COLLECT MONEY CONFIRMATION",
	       className: "modal-darkorange",
	       buttons: {
	    	   "Confirm": {
	               className: "btn-blue",
	               callback: function () {
            	    	$.ajax({
            			    type: "POST",
            			    url:  "saveMoney",
            			    data: { 
           			    		"moneyType" : moneyType,
           			    		"bankId": $(".modal-content #vi-bank").val(),
           			    		"date" : $(".modal-content #vi-date").val(),
       		    			    "voucherNo" : $(".modal-content #vi-id").val(),
       		    			    "amount" : sumAmount,
       		    			    "reason" : $(".modal-content #vi-reason").val(),
       		    				"data" : JSON.stringify(jsonData),
       		    				"refNo" : refNo
	       		    		}, //for update docs collectMoneyStatus
            			    success: function(msg){
            			    	/* for (var i = 0; i < multiplePrice.length; i++) {
            			    		var v = multiplePrice[i].split("-");    		
            			    		var td = $('#' + v[0]).closest("td");
            			    		var am = v[1];
		        	       		    td.html(am.toLocaleString('en-IN'));
		        	       		    
		        	       		    var statusStr = "Updated";
		        	       		 	td.closest("tr").find("td").last().html(statusStr);
			        	       		
            			    	} */	        
            			    	window.location = "manageDebit";
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