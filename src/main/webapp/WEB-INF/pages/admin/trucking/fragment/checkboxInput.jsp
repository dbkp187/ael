<%@ include file="/common/taglibs.jsp"%>
<hr>
<table class="table">
  		<thead>
  			<tr>
	  			<th><fmt:message key="truckingservice.doRecInfo"/></th>
	  			<th><fmt:message key="truckingservice.doPlaning"/></th>
	  			<th><fmt:message key="truckingservice.doBooking"/></th>
	  			<th><fmt:message key="truckingservice.doDelivery"/></th>
	  			<th><fmt:message key="truckingservice.doDoneDeli"/></th>
	  			<th><fmt:message key="truckingservice.doDonePack"/></th>
	  			<th><fmt:message key="truckingservice.doCollectInfo"/></th>
	  			<th><fmt:message key="truckingservice.doAccounting"/></th>
  			</tr>
  		</thead>
  		<tbody>
  			<tr style="text-align: center">
  				<td><form:checkbox path="doRecInfo" id="doRecInfo" /></td>
  				<td><form:checkbox path="doPlaning" id="doPlaning" /></td>
  				<td><form:checkbox path="doBooking" id="doBooking" /></td>
  				<td><form:checkbox path="doDelivery" id="doDelivery" /></td>
  				<td><form:checkbox path="doDoneDeli" id="doDoneDeli" /></td>
  				<td><form:checkbox path="doDonePack" id="doDonePack" /></td>
  				<td><form:checkbox path="doCollectInfo" id="doCollectInfo" /></td>
  				<td><form:checkbox path="docsgeneral.doAccounting" id="doAccounting" /></td>
  			</tr>
  		</tbody>
	</table>
