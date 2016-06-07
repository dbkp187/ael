<%@ include file="/common/taglibs.jsp"%>
<h3><fmt:message key="advancedetails.title"/></h3>
<hr>
    	<table id="advanceformList" class="display table table-condensed inFormTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
            	<c:if test="${empty advanceform.isAdmin or advanceform.isAdmin == false }">
                <th><fmt:message key="advanceform.fileCus"/></th>
                <th><fmt:message key="advanceform.goodDes"/></th>
                </c:if>
                <th><fmt:message key="advanceform.description"/></th>
                <th><fmt:message key="advanceform.amount"/></th>
                <th><fmt:message key="advanceform.dueAmount"/></th>
                <c:if test="${empty advanceform.doApproval or advanceform.doApproval==false}">
                	<th><fmt:message key="table.action"/></th>
                </c:if>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${advanceform.advancedetails}" var="adv" varStatus="idx">
        	<tr class="${adv.isAdded == true ? 'hidden' :''}" readonly="${empty adv.approved or adv.approved == false ? '':'readonly'}">
                <td colType="index">${idx.index+1}</td>
                <td colType="generalInfo" class="hidden">
	                	<form:hidden path="advancedetails[${idx.index}].id" />
	                	<form:hidden path="advancedetails[${idx.index}].isAdded" valueType="added" />
	                	<form:hidden path="advancedetails[${idx.index}].approved" />
	                	<form:hidden path="advancedetails[${idx.index}].isDeleted" valueType="deleted"/>
	            </td>
	            <c:if test="${empty advanceform.isAdmin or advanceform.isAdmin == false }">
	            <td>
	            		<spring:bind path="advancedetails[${idx.index}].docs.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:select path="advancedetails[${idx.index}].docs.id" id="docs${idx.index}" cssClass="form-control" items="${docsSelection.selections['docs']}" empty-on-add="false"/>
					        <form:errors path="advancedetails[${idx.index}].docs.id" cssClass="help-block"/>
					    </div>
	            </td>
	            <td>
	            		<spring:bind path="advancedetails[${idx.index}].goodDes">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="advancedetails[${idx.index}].goodDes" id="goodDes${idx.index}" cssClass="form-control" maxlength="255"/>
					        <form:errors path="advancedetails[${idx.index}].goodDes" cssClass="help-block"/>
					    </div>
	            </td>
	            </c:if>
	            <td>
	            		<spring:bind path="advancedetails[${idx.index}].description">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="advancedetails[${idx.index}].description" id="description${idx.index}" cssClass="form-control" maxlength="1000"/>
					        <form:errors path="advancedetails[${idx.index}].description" cssClass="help-block"/>
					    </div>
	            </td>
	            <td>
	            		<spring:bind path="advancedetails[${idx.index}].amount">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="advancedetails[${idx.index}].amount" id="amount${idx.index}" cssClass="form-control money advanceAmount" maxlength="16"/>
					        <form:errors path="advancedetails[${idx.index}].amount" cssClass="help-block"/>
					    </div>
	            </td>
	            <td>
					    <div class="form-group">
					    <input class="form-control money remainAdvance" readonly="readonly"/>
					    </div>
	            </td>
				<c:if test="${(empty advanceform.doApproval or advanceform.doApproval==false) and (empty adv.approved or adv.approved == false)}">
	                <td>
	                	<span class="iconButton removeRow" title="<fmt:message key='table.buttonEditTitle'/>">
		                			<i class="fa fa-trash"></i>
		                	</span>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${empty advanceform.doApproval or advanceform.doApproval==false}">
	    <div class="row">
		    	<div class="col-md-10"></div>
		    	<div class="col-md-2">
		    		<span class="btn btn-primary" target-table="advanceformList" id="addDetail">
			            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></span>
		    	</div>
	    </div>
    </c:if>
    <hr>
    
    <script>
    //Calculate total amount
    $("#advanceformList").change(function(){ 
    	var sum = 0;
    	$('#advanceformList  .advanceAmount').each(function()
    			{
    		sum += parseFloat(accounting.unformat($(this).val()));
    			});
    	$('#totalAdvance').val(accounting.formatMoney(sum,UTIL.MONEY_STYLE));
    });
    $( document ).ready(function() {
    	getRemainingAdvance(); 
    	/* ADVANCE_TABLE_CONTROL.init( $("#advanceformList").attr("id")); */
    	$("#advanceformList").bind("afterAddRow",function(e,row){
    		addEventForAdvance(row);
    		getRemainingAdvance();
    	 });
    });
    $('#empId').change(function(){
    	getRemainingAdvance();
    });
    </script>