<%@ include file="/common/taglibs.jsp"%>
<h3><fmt:message key="refunddetails.title"/></h3>
<hr>
    	<table id="refundList" class="display table table-condensed inFormTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
            	<c:if test="${empty refund.isRAdmin or refund.isRAdmin == false }">
                <th><fmt:message key="refund.fileCus"/></th>
                </c:if>
                <th><fmt:message key="refund.description"/></th>
                <th><fmt:message key="refund.amount"/></th>
              <%--   <th><fmt:message key="refund.oAmount"/></th> --%>
                <c:if test="${empty refund.doApproval or refund.doApproval==false}">
                	<th><fmt:message key="table.action"/></th>
                </c:if>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${refund.refunddetails}" var="adv" varStatus="idx">
        	<tr class="${adv.isAdded == true ? 'hidden' :''}">
                <td colType="index">${idx.index+1}</td>
                <td colType="generalInfo" class="hidden">
	                	<form:hidden path="refunddetails[${idx.index}].id" />
	                	<form:hidden path="refunddetails[${idx.index}].isAdded" valueType="added" />
	                	<form:hidden path="refunddetails[${idx.index}].isDeleted" valueType="deleted"/>
	            </td>
	            <c:if test="${empty refund.isRAdmin or refund.isRAdmin == false }">
	            <td class="text-center">
	            		<spring:bind path="refunddetails[${idx.index}].docs.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:select path="refunddetails[${idx.index}].docs.id" id="docs${idx.index}" cssClass="form-control" items="${docsSelection.selections['docs']}" empty-on-add="false"/>
					        <form:errors path="refunddetails[${idx.index}].docs.id" cssClass="help-block"/>
					    </div>
	            </td>
	            </c:if>
	            <td>
	            		<spring:bind path="refunddetails[${idx.index}].description">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="refunddetails[${idx.index}].description" id="description${idx.index}" cssClass="form-control" maxlength="1000"/>
					        <form:errors path="refunddetails[${idx.index}].description" cssClass="help-block"/>
					    </div>
	            </td>
	            <td>
	            		<spring:bind path="refunddetails[${idx.index}].amount">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="refunddetails[${idx.index}].amount" id="amount${idx.index}" cssClass="form-control money phieuthuAmount" maxlength="16"/>
					        <form:errors path="refunddetails[${idx.index}].amount" cssClass="help-block"/>
					    </div>
	            </td>
	            <%-- <td>
	            		<spring:bind path="refunddetails[${idx.index}].oAmount">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="refunddetails[${idx.index}].oAmount" id="oamount${idx.index}" cssClass="form-control money" maxlength="16"/>
					        <form:errors path="refunddetails[${idx.index}].oAmount" cssClass="help-block"/>
					    </div>
	            </td> --%>
				<c:if test="${empty refund.doApproval or refund.doApproval==false}">
	                <td>
	                	<span onclick="calculateTotal();" onmouseup="calculateTotal()" class="iconButton removeRow" title="<fmt:message key='table.buttonEditTitle'/>">
		                			<i class="fa fa-trash" onclick="calculateTotal();"></i>
		                	</span>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${empty refund.doApproval or refund.doApproval==false}">
	    <div class="row">
		    	<div class="col-md-12 text-center">
		    		<span class="btn btn-primary" target-table="refundList">
			            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></span>
		    	</div>
	    </div>
    </c:if>
    <hr>
    <script>
  /*   $("#refundList").change(function(){ 
    	var sum = 0;
    	$('#refundList  .phieuthuAmount').each(function()
    			{
    		if (!$(this).is('[readonly]')) {
    			sum += parseFloat(accounting.unformat($(this).val()));
			}
    			});
    	$('#totalVal').val(accounting.formatMoney(sum,UTIL.MONEY_STYLE));
    }); */
    $("#refundList").change(function(){ 
    	calculateTotal();
    });
    $( document ).ready(function() {
    	/* ADVANCE_TABLE_CONTROL.init( $("#advanceformList").attr("id")); */
    	$("#refundList").bind("afterRemoveRow",function(e,row){
    		calculateTotal();
    	 });
    	$("#refundList").bind("unRemoveRow",function(e,row){
    		calculateTotal();
    	 });
    });
    </script>