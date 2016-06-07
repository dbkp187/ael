<%@ include file="/common/taglibs.jsp"%>
<div class="row">
	     	<table class="table">
		  		<thead>
		  			<tr >
			  			<th style="text-align: center"><fmt:message key="advanceform.payForm"/></th>
			  			<th style="text-align: center"><fmt:message key="refund.payReason"/></th>
		  			</tr>
		  		</thead>
		  		<tbody>
		  			<tr style="text-align: center">
		  				<td verify="true"><form:checkbox path="doApproval" disabled="true"/>
			  				<security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING">
				  				<c:if test="${refund.doApproval==true}">
				  					<form:hidden path="doApproval" />
				  				</c:if>
			  				</security:authorize>
		  				</td>
		  				<td>
		  					<spring:bind path="refund.payReason">
						    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						    </spring:bind>
						    	<security:authorize ifNotGranted="ROLE_ADMIN,ROLE_ACCOUNTING">
						        	<form:input path="payReason" cssClass="form-control" readonly="true"/>
						        </security:authorize>
						        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_ACCOUNTING">
						        	<form:input path="payReason" cssClass="form-control" maxlength="1000"/>
						        </security:authorize>
						        <form:errors path="employee.id" cssClass="help-block"/>
						    </div>
		  				</td>
		  			</tr>
		  		</tbody>
			</table>
		</div>
