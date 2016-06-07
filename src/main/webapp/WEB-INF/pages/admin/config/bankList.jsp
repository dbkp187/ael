<%@ include file="/common/taglibs.jsp"%>
<head>
<title><fmt:message key="bank.title" /></title>
<meta name="menu" content="AdminMenu" />
</head>

<div class="col-sm-10">
	<h2>
		<fmt:message key="bank.heading" />
	</h2>
	<div id="actions" class="btn-group">
		<a class="btn btn-primary"
			href="<c:url value='bankForm?method=Add&from=list'/>"> <i
			class="fa fa-plus"></i> <fmt:message key="button.add" /></a> <a
			class="btn btn-default" href="<c:url value='/home'/>"> <i
			class="fa fa-sign-out"></i> <fmt:message key="button.done" /></a>
	</div>
	<table id="constants" class="display datatable" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><fmt:message key="table.no" /></th>
				<th><fmt:message key="bank.name" /></th>
				<th><fmt:message key="bank.code" /></th>
				<th><fmt:message key="bank.accountNo" /></th>
				<th><fmt:message key="bank.branch" /></th>
				<th><fmt:message key="table.action" /></th>
			</tr>
		</thead>

		<tfoot>
			<tr>
				<th><fmt:message key="table.no" /></th>
				<th><fmt:message key="bank.name" /></th>
				<th><fmt:message key="bank.code" /></th>
				<th><fmt:message key="bank.accNo" /></th>
				<th><fmt:message key="bank.branch" /></th>
				<th><fmt:message key="table.action" /></th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${bankList}" var="bank" varStatus="idx">

				<tr>
					<td>${idx.index+1}</td>
					<td>${bank.name}</td>
					<td>${bank.code}</td>
					<td>${bank.accountNo}</td>
					<td>${bank.branch}</td>
					<td><a href="bankForm?id=${bank.id}" class="iconButton"
						title="<fmt:message key='table.buttonEditTitle'/>"><i
							class="fa fa-pencil-square-o"></i></a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>

