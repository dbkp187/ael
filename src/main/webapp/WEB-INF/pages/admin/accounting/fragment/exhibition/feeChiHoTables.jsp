<%@ include file="/common/taglibs.jsp"%>
<h3>
	<fmt:message key="accountingcus.chiholist" />
</h3>
<hr>
<table id="chihoList"
	class="display table table-condensed feeTable no-more-tables"
	cellspacing="0" width="100%">
	<thead>
		<!-- "refCode,masterFee.value,name.value,amount[money],vat[money],total[money],approvedText[Key],checkByAdminText[Key],dateChange[Date],voucherNo,payDate" -->

		<tr>
			<th rowspan="2"><fmt:message key="table.no" /></th>
			<th rowspan="2"><fmt:message key="packageInfo.feeName" /></th>
			<th rowspan="2"><fmt:message key="packageInfo.feevalue" /></th>
			<th rowspan="2"><fmt:message key="packageInfo.feevavat" /></th>
			<th rowspan="2">VAT</th>
			<th rowspan="2"><fmt:message key="packageIngo.total" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${exhibition.feeChiHo}" var="fee" varStatus="idx">
			<c:if test="${fee.masterFee.id == -10}">
				<tr>
					<td colType="index" data-title="<fmt:message key="table.no" />">${idx.index+1}</td>
					<td>
						<div class="form-group">
							<input value="${fee.name.value}" maxlength="45" autofocus="true"
								class="form-control" readonly="true" />
						</div>
					</td>
					<td>
						<div class="form-group">
							<input value="${fee.amount}" maxlength="45" autofocus="true"
								class="form-control amount money" readonly="true" />
						</div>
					</td>
					<td>
						<div class="form-group">
							<input value="${fee.vat}" maxlength="45" autofocus="true"
								class="form-control vat money2" readonly="true" />
						</div>
					</td>
					<td>
						<div class="form-group">
							<input value="${fee.vatAmount}" maxlength="45" autofocus="true"
								class="form-control amount money" readonly="true" />
						</div>
					</td>
					<td>
						<div class="form-group">
							<input value="${fee.total}" maxlength="45" autofocus="true"
								class="form-control amount money" readonly="true" />
						</div>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
