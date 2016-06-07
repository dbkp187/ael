<%@ include file="/common/taglibs.jsp"%>
<hr>
<table class="table">
  		<thead>
  			<tr>
	  			<th><fmt:message key="exhibition.doRecDocs"/></th>
	  			<th><fmt:message key="exhibition.doPrepareDocs"/></th>
	  			<th><fmt:message key="exhibition.doRequestDocs"/></th>
	  			<th><fmt:message key="exhibition.doBooking"/></th>
	  			<th><fmt:message key="exhibition.doTrans"/></th>
	  			<th><fmt:message key="exhibition.doCus"/></th>
	  			<th><fmt:message key="exhibition.doPacking"/></th>
	  			<th><fmt:message key="exhibition.doTruck"/></th>
  			</tr>
  		</thead>
  		<tbody>
  			<tr style="text-align: center">
  				<td><form:checkbox path="doRecDocs" id="doRecDocs" /></td>
  				<td><form:checkbox path="doPrepareDocs" id="doPrepareDocs" /></td>
  				<td><form:checkbox path="doRequestDocs" id="doRequestDocs" /></td>
  				<td><form:checkbox path="doBooking" id="doBooking" /></td>
  				<td><form:checkbox path="doTrans" id="doTrans" /></td>
  				<td><form:checkbox path="doCus" id="doCus" /></td>
  				<td><form:checkbox path="doPacking" id="doPacking" /></td>
  				<td><form:checkbox path="docsgeneral.doDelivery" id="doTruck" />
  				<form:hidden path="docsgeneral.doAccounting" /></td>
  			</tr>
  		</tbody>
	</table>
