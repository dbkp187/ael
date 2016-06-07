<%@ include file="/common/taglibs.jsp"%>

    	<table id="offerItemList" class="display table table-condensed inFormTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="offerItem.nameOfService"/></th>
                <th><fmt:message key="offerItem.feeWithVAT"/></th>
                <th><fmt:message key="offerItem.feeNoVAT"/></th>
                <th><fmt:message key="offerItem.currency"/></th>
                <th><fmt:message key="offerItem.feeUnit"/></th>
                <c:if test="${empty offerPrice.isValid or offerPrice.isValid==false}">
                	<th><fmt:message key="table.action"/></th>
                </c:if>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${offerPrice.offerItems}" var="offerItem" varStatus="idx">
        	<tr class="${offerItem.isAdded == true ? 'hidden' :''}">
                <td colType="index">${idx.index+1}</td>
                <td colType="generalInfo" class="hidden">
	                	<form:hidden path="offerItems[${idx.index}].id" />
	                	<form:hidden path="offerItems[${idx.index}].isAdded" valueType="added" />
	                	<form:hidden path="offerItems[${idx.index}].isDeleted" valueType="deleted"/>
	            </td>
              	<td>
              			<spring:bind path="offerItems[${idx.index}].nameOfService.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:select path="offerItems[${idx.index}].nameOfService.id" id="nameOfService${idx.index}"  cssClass="form-control" items="${selections['services']}" empty-on-add="false"/>
					        <form:errors path="offerItems[${idx.index}].nameOfService.id" cssClass="help-block"/>
					    </div>
				</td>
              	<td>
              			<spring:bind path="offerItems[${idx.index}].feeWithVAT">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="offerItems[${idx.index}].feeWithVAT" id="feeWithVAT${idx.index}" maxlength="16"  cssClass="form-control money" />
					        <form:errors path="offerItems[${idx.index}].feeWithVAT" cssClass="help-block"/>
					    </div>
				</td>
              	<td>
              			<spring:bind path="offerItems[${idx.index}].feeNoVAT">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="offerItems[${idx.index}].feeNoVAT" id="feeNoVAT${idx.index}" maxlength="16"  cssClass="form-control money"/>
					        <form:errors path="offerItems[${idx.index}].feeNoVAT" cssClass="help-block"/>
					    </div>
				</td>
              	<td>
              			<spring:bind path="offerItems[${idx.index}].currency.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="1">
					    </spring:bind>
					        <form:select path="offerItems[${idx.index}].currency.id" id="currency${idx.index}"  cssClass="form-control" items="${selections['currencies']}" empty-on-add="false"/>
					        <form:errors path="offerItems[${idx.index}].currency.id" cssClass="help-block"/>
					    </div>
				</td>
              	<td>
              			<spring:bind path="offerItems[${idx.index}].feeUnit.id">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="3">
					    </spring:bind>
					        <form:select path="offerItems[${idx.index}].feeUnit.id" id="feeUnit${idx.index}"  cssClass="form-control" items="${selections['units']}" empty-on-add="false"/>
					        <form:errors path="offerItems[${idx.index}].feeUnit.id" cssClass="help-block"/>
					    </div>
				</td>
				<c:if test="${empty offerPrice.isValid or offerPrice.isValid==false}">
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
    
	    <div class="row">
		    	<div class="col-md-8"></div>
		    	<div class="col-md-4">
		    	<c:if test="${empty offerPrice.isValid or offerPrice.isValid==false}">
		    		<span class="btn btn-primary" target-table="offerItemList">
			            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></span>
			            </c:if>
			         <c:if test="${not empty offerPrice.id}">
						<a class="btn btn-success" href="download?id=${offerPrice.id}">
							<i class="fa fa-print"></i>
							<fmt:message key="export.sales.offer" />
						</a>
					</c:if>
		    	</div>
	    </div>
    <hr>