<%@ include file="/common/taglibs.jsp"%>
<hr>
	<table class="table">
  		<thead>
  			<tr>
	  			<th><fmt:message key="packageInfo.doRecFullDocs"/></th>
	  			<th><fmt:message key="packageInfo.doSendDecDraft"/></th>
	  			<th><fmt:message key="packageInfo.doConDec"/></th>
	  			<th><fmt:message key="packageInfo.doRecOriginalDocs"/></th>
	  			<th><fmt:message key="packageInfo.doPreDecDoc"/></th>
	  			<th id="ldoGetDO"><fmt:message key="packageInfo.doGetDO"/></th>
	  			<th id="ldoGetTaxDec"><fmt:message key="packageInfo.doGetTaxDec"/></th>
	  			<th><fmt:message key="packageInfo.doRegAcc"/></th>
	  			<th><fmt:message key="packageInfo.doCheckPack"/></th>
	  			<th><fmt:message key="packageInfo.doRelease"/></th>
	  			<th><fmt:message key="packageInfo.doMoveMethod"/></th>
  			</tr>
  		</thead>
  		<tbody>
  			<tr style="text-align: center">
  				<td><form:checkbox path="doRecFullDocs" id="doRecFullDocs" /></td>
  				<td><form:checkbox path="doSendDecDraft" id="doSendDecDraft" /></td>
  				<td><form:checkbox path="doConDec" id="doConDec" /></td>
  				<td><form:checkbox path="doRecOriginalDocs" id="doRecOriginalDocs" /></td>
  				<td><form:checkbox path="doPreDecDoc" id="doPreDecDoc" /></td>
  				<td id="doGetDO"><form:checkbox path="doGetDO"  /></td>
  				<td id="doGetTaxDec"><form:checkbox path="doGetTaxDec"  /></td>
  				<td><form:checkbox path="doRegAcc" id="doRegAcc" /></td>
  				<td><form:checkbox path="doCheckPack" id="doCheckPack" /></td>
  				<td><form:checkbox path="doRelease" id="doRelease" /></td>
  				<td>
  					<c:if test="${packageInfo.docsgeneral.doDelivery == true}">
  						<form:checkbox path="docsgeneral.doDelivery" id="doMoveMethod" disabled = "true"/>
  						<form:hidden path="docsgeneral.doDelivery" />
  					</c:if>
  					<c:if test="${empty packageInfo.docsgeneral.doDelivery || packageInfo.docsgeneral.doDelivery ==false}">
  						<form:checkbox path="docsgeneral.doDelivery" id="doMoveMethod" />
  					</c:if>
  					<form:hidden path="docsgeneral.doAccounting" />
  				</td>
  			</tr>
  		</tbody>
	</table>
