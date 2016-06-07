<%@ include file="/common/taglibs.jsp"%>
<br>
<style>
	table.dataTable td, table.dataTable th, table.dataTable {
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 13px;
	} 

</style>
<div class="col-sm-10">
	<h2>
		<fmt:message key='moneybook.title' />
	</h2>

	<div role="tabpanel">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#cashbooktab"
				aria-controls="home" role="tab" data-toggle="tab"> <fmt:message
						key="moneybook.cashbook.title" />
			</a></li>
			<li role="presentation"><a href="#bankbooktab"
				aria-controls="profile" role="tab" data-toggle="tab"> <fmt:message
						key="moneybook.bankbook.title" />
			</a></li>
		</ul>
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="cashbooktab">
				<br>
				<jsp:include page="moneyBookCashSearch.jsp"></jsp:include>
				<br>
				<%-- <table>
					<tr>
						<td><fmt:message key="moneybook.first.balance" />&nbsp;</td>
						<c:if test="${empty firstCashBalance}">
							<td><input id="cashAmount" /></td>
							<td><button onclick="saveFirstBalance()">Save</button></td>
						</c:if>
						<c:if test="${not empty firstCashBalance}">
							<td><span>${firstCashBalance.amount}</span></td>
							<td><button onclick="editFirstBalance()">Edit</button></td>
						</c:if>
					</tr>
				</table> --%>
				<c:if test="${empty firstCashBalance}">
					<button class="btn-balance" onclick="addEditBalance(0, '<fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy"/>', '<fmt:message key="moneybook.first.balance" />');"><fmt:message key="moneybook.first.balance" /></button>
				</c:if>
				<br>
				<br>
				<table id="cashbook" class="display datatable booktable" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th><fmt:message key="table.no" /></th>
							<th><fmt:message key="moneybook.voucherNo" /></th>
							<th><fmt:message key="moneybook.date" /></th>
							<th><fmt:message key="moneybook.voucherType" /></th>
							<th><fmt:message key="moneybook.description" /></th>
							<th><fmt:message key="moneybook.paymentMoney" /></th>
							<th><fmt:message key="moneybook.receptMoney" /></th>
							<th><fmt:message key="moneybook.balance" /></th>
							<th>Action</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th><fmt:message key="table.no" /></th>
							<th><fmt:message key="moneybook.voucherNo" /></th>
							<th><fmt:message key="moneybook.date" /></th>
							<th><fmt:message key="moneybook.voucherType" /></th>
							<th><fmt:message key="moneybook.description" /></th>
							<th><fmt:message key="moneybook.paymentMoney" /></th>
							<th><fmt:message key="moneybook.receptMoney" /></th>
							<th><fmt:message key="moneybook.balance" /></th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${cashbooks}" var="mb" varStatus="idx">
							<tr id='${mb.id}'>
								<td>${idx.index+1}</td>
								<td>${mb.voucherNoPrint}</td>
								<td><fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy" />
								</td>
								<td><fmt:message key="${mb.typeOfVoucher.printValue}" /></td>
								<td>${mb.description}</td>
								<td class="money"><fmt:formatNumber>${mb.paymentMoney}</fmt:formatNumber>
								</td>
								<td class="money"><fmt:formatNumber>${mb.receptMoney}</fmt:formatNumber>
								</td>
								<td class="money"><fmt:formatNumber>${mb.balance}</fmt:formatNumber>
								</td>
								<td><span
									onclick="editMoneyBook(0,'${mb.id}', '${mb.voucherNoPrint}', '<fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy"/>', '${mb.description}');"
									class="label label-success"> <i class="fa fa-pencil-square-o"></i> </span>
									&nbsp;
									<span
									onclick="deleteMoneyBook('${mb.id}');"
									class="label label-danger"> <i class="fa fa-trash"></i> </span>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div role="tabpanel" class="tab-pane" id="bankbooktab">
				<br>
				<jsp:include page="moneyBookBankSearch.jsp"></jsp:include>
				<br>
				<%-- <table>
					<tr>
						<td><fmt:message key="moneybook.first.balance" />&nbsp;</td>
						<c:if test="${empty firstBankBalance}">
							<td><input id="cashAmount" /></td>
							<td><button onclick="saveFirstBalance()">Save</button></td>
						</c:if>
						<c:if test="${not empty firstBankBalance}">
							<td><span>${firstBankBalance.amount}</span></td>
							<td><button onclick="editFirstBalance()">Edit</button></td>
						</c:if>
					</tr>
				</table> --%>
				<c:if test="${empty firstBankBalance}">
					<button class="btn-balance" onclick="addEditBalance(1, '<fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy"/>', '<fmt:message key="moneybook.first.balance" />');"><fmt:message key="moneybook.first.balance" /></button>
				</c:if>
				<br>
				<br>
				<table id="bankbook" class="display datatable booktable" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th><fmt:message key="table.no" /></th>
							<th><fmt:message key="bank.name" /></th>
							<th><fmt:message key="moneybook.voucherNo" /></th>
							<th><fmt:message key="moneybook.date" /></th>
							<th><fmt:message key="moneybook.voucherType" /></th>
							<th><fmt:message key="moneybook.description" /></th>
							<th><fmt:message key="moneybook.paymentMoney" /></th>
							<th><fmt:message key="moneybook.receptMoney" /></th>
							<th><fmt:message key="moneybook.balance" /></th>
							<th>Action</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th><fmt:message key="table.no" /></th>
							<th><fmt:message key="bank.name" /></th>
							<th><fmt:message key="moneybook.voucherNo" /></th>
							<th><fmt:message key="moneybook.date.transaction" /></th>
							<th><fmt:message key="moneybook.voucherType" /></th>
							<th><fmt:message key="moneybook.description" /></th>
							<th><fmt:message key="moneybook.paymentMoney" /></th>
							<th><fmt:message key="moneybook.receptMoney" /></th>
							<th><fmt:message key="moneybook.balance" /></th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${bankbooks}" var="mb" varStatus="idx">
							<tr id='${mb.id}'>
								<td>${idx.index+1}</td>
								<td>${mb.bank.code}</td>
								<td>${mb.voucherNoPrint}</td>
								<td><fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy" />
								</td>
								<td><fmt:message key="${mb.typeOfVoucher.printValue}" /></td>

								<td>${mb.description}</td>
								<td class="money"><fmt:formatNumber>${mb.paymentMoney}</fmt:formatNumber>
								</td>
								<td class="money"><fmt:formatNumber>${mb.receptMoney}</fmt:formatNumber>
								</td>
								<td class="money"><fmt:formatNumber>${mb.balance}</fmt:formatNumber>
								</td>
								<td><span
									onclick="editMoneyBook(1, '${mb.id}', '${mb.voucherNoPrint}', '<fmt:formatDate value="${mb.date}" pattern="dd-MM-yyyy"/>', '${mb.description}');"
									class="label label-success"> <i class="fa fa-pencil-square-o"></i> </span>
									&nbsp;
									<span
									onclick="deleteMoneyBook('${mb.id}');"
									class="label label-danger"> <i class="fa fa-trash"></i> </span>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="flag" value="${flag}">
<div id="voucher-info-modal" style="display: none;">
	<table class="display table table-striped table-bordered table-hover">
		<tbody>
			<c:if test="${flag == 1}">
				<tr><td><fmt:message key="bank.name"/></td>
					<td><select id="mb-bank">
						<c:forEach var="entry" items="${banks}">
							<option value="${entry.id}">${entry.code}</option>
						</c:forEach>
					</select></td>
				</tr>
			</c:if>
			<tr>
				<td><fmt:message key="moneybook.voucherNo" /></td>
				<td><span id="mb-no"></span></td>
			</tr>
			<tr>
				<td><fmt:message key="moneybook.date.transaction" /></td>
				<td><input id="mb-date" /></td>
			</tr>
			<tr>
				<td><fmt:message key="moneybook.description" /></td>
				<td><input id="mb-des" /></td>
			</tr>
		</tbody>
	</table>
	<!-- <span id="error-msg" style="color: red;"></span> -->
</div>

<div id="voucher-info-balance-modal" style="display: none;">
	<table class="display table table-striped table-bordered table-hover">
		<tbody>
			
			<tr id="bank-info-balance"><td><fmt:message key="bank.name"/></td>
				<td><select id="mb-bank-balance">
					<c:forEach var="entry" items="${banks}">
						<option value="${entry.id}">${entry.code}</option>
					</c:forEach>
				</select></td>
			</tr>
			
			<tr>
				<td><fmt:message key="moneybook.first.balance" /></td>
				<td><input id="mb-money-balance" /></td>
			</tr>
			<tr>
				<td><fmt:message key="moneybook.date.transaction" /></td>
				<td><input id="mb-date-balance" /></td>
			</tr>
			<tr>
				<td><fmt:message key="moneybook.description" /></td>
				<td><span id="mb-des-balance"></span></td>
			</tr>
		</tbody>
	</table>
	<!-- <span id="error-msg" style="color: red;"></span> -->
</div>

<style>
.label {
	cursor: pointer;
}

.highlight {
	background: #38b44a !important;
}
</style>
<script>
	var res = "";
	var date = "";
	var voucherNo = "";
	var bank = "";
	function editMoneyBook(bookType, id, mbNo, mbDate, mbDes) {
		$("#" + id).addClass("highlight");
		bootbox.dialog({
					closeButton : false,
					message : $("#voucher-info-modal").html(),
					title : "EDIT MONEY BOOK",
					className : "modal-darkorange",
					buttons : {
						"Confirm" : {
							className : "btn-blue",
							callback : function() {
								res = $(".modal-content #mb-des").val();
								date = $(".modal-content #mb-date").val();
								voucherNo = $(".modal-content #mb-no").val();
								bank = $(".modal-content #mb-bank :selected").text();
								$.ajax({
									type : "POST",
									url : "updateMoneybook",
									data : {
										"id" : id,
										"bankId": $(".modal-content #mb-bank").val(),
										"date" : $(".modal-content #mb-date").val(),
										"voucherNo" : $(".modal-content #mb-no").val(),
										"reason" : $(".modal-content #mb-des").val()
									},
									success : function(data) {
										if (data == "ok") {
											$("#" + id).removeClass("highlight");
											if (bookType == 0) {
												$("#" + id).find("td").eq(2).html(date);
												$("#" + id).find("td").eq(4).html(res);
											} else {
												$("#" + id).find("td").eq(1).html(bank);
												$("#" + id).find("td").eq(3).html(date);
												$("#" + id).find("td").eq(5).html(res);
											}
										} else {
											alert("Voucher no is wrong or duplicate");
										}
									},
									error : function(msg) {
										$("#" + id).removeClass(
												"highlight");
										alert(msg);
									}
								})
							}
						},
						"Cancel" : {
							className : "btn-red",
							callback : function() {
								$("#" + id).removeClass(
								"highlight");
							}
						}
					}
				});

		$(".modal-content .select2-container").remove();
		$(".modal-content #mb-bank").css({"display": "inline"});
		$(".modal-content #mb-no").html(mbNo);
		$(".modal-content #mb-des").val(mbDes);
		var dateArr = mbDate.split("-");
		$(".modal-content #mb-date").datepicker("setDate",
				new Date(dateArr[2], dateArr[1] - 1, dateArr[0]));
		$(".modal-content #mb-date").datepicker().on('changeDate', function(e) {
			$(this).datepicker('hide');
		})
	}

	function addEditBalance(bookType, mbDate, mbDes) {
		bootbox.dialog({
			closeButton : false,
			message : $("#voucher-info-balance-modal").html(),
			title : "MONEY BOOK BALANCE",
			className : "modal-darkorange",
			buttons : {
				"Confirm" : {
					className : "btn-blue",
					callback : function() {
						date = $(".modal-content #mb-date-balance").val();
						bank = $(".modal-content #mb-bank :selected").text();
						$.ajax({
							type : "POST",
							url : "updateMoneybookBalance",
							data : {
								"bankId": $(".modal-content #mb-bank-balance").val(),
								"date" : $(".modal-content #mb-date-balance").val(),
								"balance" : $(".modal-content #mb-money-balance").val(),
								"des" : mbDes
							},
							success : function(data) {
								if (data == "ok") {
									alert("Add successfully");
									$(".btn-balance").hide();
								} else {
									alert("Voucher no is wrong or duplicate");
								}
							},
							error : function(msg) {
								alert(msg);
							}
						})
					}
				},
				"Cancel" : {
					className : "btn-red"
				}
			}
		});
		if (bookType == 1) {
			$(".modal-content .select2-container").remove();
			$(".modal-content #mb-bank-balance").css({"display": "inline"});
		} else {
			$(".modal-content #bank-info-balance").remove();
		}
		$(".modal-content #mb-des-balance").text(mbDes);
		$(".modal-content #mb-date-balance").datepicker("setDate", new Date(2015, 5, 1));
		$(".modal-content #mb-date-balance").datepicker().on('changeDate', function(e) {
			$(this).datepicker('hide');
		})
	}
	
	function deleteMoneyBook(id) {
	 	if(confirm("Delete will make some actions revert. Please make sure you want to remove this row")) {
			$.ajax({
				type : "POST",
				url : "deleteMoneybook",
				data : {
					"id" : id
				},
				success : function(msg) {
					$("#" + id).remove();
					if (msg == "ok") {
						alert("Delete successfully!")
					} else {
						alert("Problem when delete this row, please ask Phuong for this :) ")
					}
				}
			});
	 	}
	}
			
	function saveFirstBalance() {
		var amount = $("#cashAmount").val();
		if (isNaN(amount)) {
			alert("Please input number");
		} else {
			$.ajax({
				type : "POST",
				url : "moneybook/saveFirstBalance",
				data : {
					"amount" : amount
				},
				success : function(msg) {
					alert("Done");
				}
			});
		}
	}
	
	$(document).ready(function() {
		if ($('#flag').val() == "0") {
			$('.nav-tabs a[href="#cashbooktab"]').tab('show');
		} else if ($('#flag').val() == "1") {
			$('.nav-tabs a[href="#bankbooktab"]').tab('show');
		}
	})
</script>
<script src="../../scripts/bootbox/bootbox.js"></script>
