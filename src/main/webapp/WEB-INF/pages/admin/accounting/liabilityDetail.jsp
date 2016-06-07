<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="liability.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>
<style>
	table td, table th, table {
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 13px;
	} 

</style>
<div class="col-sm-10">
	<h2><fmt:message key="liability.heading"/></h2>
	<fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy" var="sd"/>
	<fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy" var="ed" />
	<span><b></b><fmt:message key="liability.employeeName" />: ${employee.firstName}&nbsp;${employee.lastName}</b></span>
	<br>
	<span><fmt:message key="liability.employeeId" />: ${employee.username}</span>
	<br>
	<span><fmt:message key="liability.startDate" />&nbsp;${sd}&nbsp;<fmt:message key="liability.endDate" />&nbsp;${ed}</span>
	<br><br>

	<table id="liabilityDetail"
		class="display table table-condensed inFormTable" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><fmt:message key="liability.date" /></th>
				<th><fmt:message key="liability.type" /></th>
				<th><fmt:message key="liability.voucherno" /></th>
				<th><fmt:message key="liability.refcode" /></th>
				<th><fmt:message key="liability.explain" /></th>
				<th><fmt:message key="liability.debt" /></th>
				<th><fmt:message key="liability.refund" /></th>
				<th><fmt:message key="liability.remain" /></th>
	
			</tr>
		</thead>

		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b><i><fmt:message key="liability.remain.start" /></i></b></td>
				<td></td>
				<td></td>
				<td><b><i><fmt:formatNumber pattern="#,###" value="${remainStart}"/></i></b></td>
				<td></td>
			</tr>
			<c:forEach items="${liabilities}" var="li">
				<tr>
					<td><fmt:formatDate value="${li.date}" pattern="dd/MM/yyyy"/></td>
					<%-- <td>${li.number}</td> --%>
					<td><fmt:message key="${li.type.printValue}" /></td>
					<td>${li.voucherNo}</td>
					<td>${li.refcode}</td>
					<td>${li.explain}</td>
					<td><fmt:formatNumber pattern="#,###" value="${li.debt}"/></td>
					<td><fmt:formatNumber pattern="#,###" value="${li.refund}"/></td>
					<td><fmt:formatNumber pattern="#,###" value="${li.remain}"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b><i><fmt:message key="liability.remain.end" /></i></b></td>
				<td></td>
				<td></td>
				<td><b><i><fmt:formatNumber pattern="#,###" value="${remainEnd}"/></i></b></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>