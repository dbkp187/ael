<%@ include file="/common/taglibs.jsp"%>
<h3><fmt:message key="refunddetails.title"/></h3>
<hr>
    	<table id="refundList" class="display table table-condensed inFormTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
<%--                 <th><fmt:message key="refund.fileCus"/></th> --%>
                <th><fmt:message key="refund.description"/></th>
                <th><fmt:message key="refund.amount"/></th>
                <th><fmt:message key="refund.oAmount"/></th>
<%--                 <th><fmt:message key="refund.accApproved" /></th> --%>
<%-- 				<th><fmt:message key="refund.adminApproved" /></th> --%>
                <c:if test="${empty refund.doApproval or refund.doApproval==false}">
                	<th><fmt:message key="table.action"/></th>
                </c:if>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${refund.refunddetails}" var="adv" varStatus="idx">
        	<tr class="${adv.isAdded == true ? 'hidden' :''}" readonly="${empty adv.approved or adv.approved == false ? '':'readonly'}">
                <td colType="index">${idx.index+1}</td>
                <td colType="generalInfo" class="hidden">
	                	<form:hidden path="refunddetails[${idx.index}].id" />
	                	<form:hidden path="refunddetails[${idx.index}].isAdded" valueType="added" />
	                	<form:hidden path="refunddetails[${idx.index}].approved"/>
	                	<form:hidden path="refunddetails[${idx.index}].isDeleted" valueType="deleted"/>
	            </td>
<!-- 	            <td> -->
<%-- 	            		<spring:bind path="refunddetails[${idx.index}].docs.id"> --%>
<%-- 					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}"> --%>
<%-- 					    </spring:bind> --%>
<%-- 					        <form:select path="refunddetails[${idx.index}].docs.id" id="docs${idx.index}" cssClass="form-control" items="${docsSelection.selections['docs']}" empty-on-add="false"/> --%>
<%-- 					        <form:errors path="refunddetails[${idx.index}].docs.id" cssClass="help-block"/> --%>
<!-- 					    </div> -->
<!-- 	            </td> -->
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
					        <form:input path="refunddetails[${idx.index}].amount" id="amount${idx.index}" cssClass="form-control money" maxlength="16"/>
					        <form:errors path="refunddetails[${idx.index}].amount" cssClass="help-block"/>
					    </div>
	            </td>
	            <td>
	            		<spring:bind path="refunddetails[${idx.index}].oAmount">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="refunddetails[${idx.index}].oAmount" id="oamount${idx.index}" cssClass="form-control money" maxlength="16"/>
					        <form:errors path="refunddetails[${idx.index}].oAmount" cssClass="help-block"/>
					    </div>
	            </td>
<!-- 	            <td verify="true"> -->
<%-- 					<form:checkbox path="refunddetails[${idx.index}].approved" disabled="true"/> --%>
<%-- 					<security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING"> --%>
<%-- 				  				<c:if test="${refund.doApproval==true}"> --%>
<%-- 				  					<form:hidden path="doApproval" /> --%>
<%-- 				  				</c:if> --%>
<%-- 			  				</security:authorize> --%>
<!-- 					</td> -->
<!-- 					<td verify="true"> -->
<%-- 					<form:checkbox path="refunddetails[${idx.index}].checkByAdmin" disabled="true"/> --%>
<%-- 					<security:authorize ifNotGranted="ROLE_ADMIN"> --%>
<%-- 				  				<c:if test="${refund.doApproval==true}"> --%>
<%-- 				  					<form:hidden path="doApproval" /> --%>
<%-- 				  				</c:if> --%>
<%-- 			  				</security:authorize> --%>
<!-- 					</td> -->
	                <td>
	                	<c:if test="${(empty refund.doApproval or refund.doApproval==false) and (empty adv.approved or adv.approved == false) }">
						<span class="iconButton removeRow" title="<fmt:message key='table.buttonEditTitle'/>">
		                			<i class="fa fa-trash"></i>
		                	</span>
					</c:if>
	                </td>
                
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${empty refund.doApproval or refund.doApproval==false}">
	    <div class="row">
		    	<div class="col-md-10"></div>
		    	<div class="col-md-2">
		    		<span class="btn btn-primary" target-table="refundList">
			            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></span>
		    	</div>
	    </div>
    </c:if>
    <hr>