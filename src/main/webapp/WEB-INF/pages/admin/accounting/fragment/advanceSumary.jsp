<%@ include file="/common/taglibs.jsp" %>
<br>
<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>
<div class="col-sm-12">
	<jsp:include page="searchAdvanceSumary.jsp"></jsp:include>
    <%-- <div id="actions" class="btn-group">
    	<a class="btn btn-primary" href="<c:url value='advanceForm'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></a>
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div> --%>
    <table id="advanceformList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="menu.nhanvien"/></th>
                <th><fmt:message key="advanceSumary.startAdvance"/></th>
                <th><fmt:message key="advanceSumary.startRefund"/></th>
                <th><fmt:message key="advanceSumary.advance"/></th>
                <th><fmt:message key="advanceSumary.refund"/></th>
                <th><fmt:message key="advanceSumary.endAdvance"/></th>
                <th><fmt:message key="advanceSumary.endRefund"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="menu.nhanvien"/></th>
                <th><fmt:message key="advanceSumary.startAdvance"/></th>
                <th><fmt:message key="advanceSumary.startRefund"/></th>
                <th><fmt:message key="advanceSumary.advance"/></th>
                <th><fmt:message key="advanceSumary.refund"/></th>
                <th><fmt:message key="advanceSumary.endAdvance"/></th>
                <th><fmt:message key="advanceSumary.endRefund"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${advanceSumaryList}" var="adv" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
                <td>
                	<a onclick="advanceDetail('${adv.id}');" style="cursor:pointer;">${adv.employeeName}</a>
                </td>
                <td class="money">
                 	<fmt:formatNumber pattern="#,###" value="${adv.totalAdvanceBefore}"/>
                </td>
          		<td class="money">
                 	<fmt:formatNumber pattern="#,###" value="${adv.totalRefundBefore}"/>
                </td>
                <td class="money">
                	<fmt:formatNumber pattern="#,###" value="${adv.totalAdvanceBetween}"/>
                </td>
                <td class="money">
                	<fmt:formatNumber pattern="#,###" value="${adv.totalRefundBetween}"/>
                </td>
                <td class="money">
                	<fmt:formatNumber pattern="#,###" value="${adv.totalAdvanceAfter}"/>
                </td>
                <td class="money">
                	<fmt:formatNumber pattern="#,###" value="${adv.totalRefundAfter}"/>	
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
	function advanceDetail(id) {
		var sd = $("#startDateSumary").val();
		var ed = $("#endDateSumary").val();
		sd = sd.replace(/\//g,'');
		ed = ed.replace(/\//g,'');
		window.location.href = "../accounting/liabilityDetail?id=" + id + "&sd=" + sd + "&ed=" + ed;
	}
</script>
