<%@ include file="/common/taglibs.jsp"%>
<hr>
<table id="detailsList"
	class="display table table-condensed no-more-tables feeTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th rowspan="2"><fmt:message key="table.no" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.customer" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.jobNo" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.ngaynhanlenh" /></th>
			<%-- <th rowspan="2"><fmt:message key="accountingvantai.closetime" /></th> --%>
			<th rowspan="2"><fmt:message key="accountingvantai.ngaythuchien"/></th>
			
			<th rowspan="2"><fmt:message key="accountingvantai.noidi" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.noiden" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.lcl"/></th>
			<th colspan="2" class="centerText"><fmt:message key="accountingvantai.typeOfContainer"/></th>
			<th rowspan="2"><fmt:message key="accountingvantai.tencont"/></th>
			<th rowspan="2"><fmt:message key="accountingvantai.nhathau" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.thanhtoannangha" /></th>
			<th rowspan="2"><fmt:message key="accountingvantai.ghichu" /></th>

		</tr>
		<tr>
			<th class="numberCol"><fmt:message key="accountingvantai.20"/></th>
			<th class="numberCol"><fmt:message key="accountingvantai.40"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${accountingVantai.map}" var="map" varStatus="id">
		
			<tr>
				<td rowspan="${fn:length(map.value) }" colType="index" data-title="<fmt:message key="table.no" />">${id.index+1}</td>				
				<td rowspan="${fn:length(map.value) }" data-title="<fmt:message key="customer.title" />">
					<div class="form-group">
				       ${map.value[0].truckingservice.docsgeneral.customer.name}
				    </div>
				</td>
				<c:forEach items="${map.value}" var="truck" varStatus="idx">
					<c:if test="${idx.index > 0 }">
						</tr><tr>
					</c:if>
				<td class="hidden">
					<form:hidden path="map[${map.key }][${idx.index}].id"/>
					<%-- <form:hidden path="map[${map.key }][${idx.index}].truckingservice.id"/> --%>
				</td>
				<td data-title="<fmt:message key="accountingvantai.jobNo" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.jobNo}
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.ngaynhanlenh" />">
					<div class="form-group">
					<fmt:formatDate value="${truck.truckingservice.docsgeneral.docReceiveDate}" pattern="dd/MM/yyyy"/>
				    </div>
				</td>				 				
				<%-- <td data-title="<fmt:message key="accountingvantai.closetime"/>">
					<div class="form-group">
							${truck.consteal.noOfCont}
					</div>
				</td> --%>
				<td data-title="<fmt:message key="accountingvantai.ngaythuchien" />">
					<div class="form-group">
				        <fmt:formatDate value="${truck.dateDev}" pattern="dd/MM/yyyy"/>
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.noidi"/>">
					<div class="form-group">
						${truck.truckingservice.departure }
					</div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.noiden"/>">
					<div class="form-group">
						${truck.truckingservice.arrival }
					</div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.lcl"/>">
					<div class="form-group">
						<c:if test="${ not empty truck.truckingservice.docsgeneral.typeOfContainer}">
							${truck.truckingservice.docsgeneral.typeOfContainer.value }
						</c:if>
					</div>
				</td>
				<td data-title="<fmt:message key=".accountingvantai.typeOfContainer"/>:<fmt:message key="accountingvantai.20"/>">
					<div class="form-group">
						${truck.truckingservice.docsgeneral.noOf20Cont}
					</div>
					<form:hidden path="truckingdetails[${idx.index}].truckingservice.docsgeneral.noOf20Cont"/>
				</td>
				<td data-title="<fmt:message key="accountingvantai.typeOfContainer"/>:<fmt:message key="accountingvantai.40"/>">
					<div class="form-group">
						${truck.truckingservice.docsgeneral.noOf40Cont}
					</div>
					<form:hidden path="truckingdetails[${idx.index}].truckingservice.docsgeneral.noOf40Cont"/>
				</td>
				<td data-title="<fmt:message key="accountingvantai.tencont" />">
					<div class="form-group">
				        <c:forEach items="${truck.truckingservice.docsgeneral.contseals }" var="contseal">
				        	${contseal.noOfCont }/${contseal.noSeal }<br>
				        </c:forEach>
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.nhathau" />">
					<div class="form-group">
				        ${truck.nhathau.name }
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingvantai.thanhtoannangha"/>">
					<div class="form-group">
						${truck.total }
					</div>
				</td>
				
				<td data-title="<fmt:message key="accountingvantai.ghichu"/>">
					<div class="form-group">
						<form:textarea path="map[${map.key }][${idx.index}].truckingservice.docsgeneral.note" id="note"  cssClass="form-control" readonly="true"/>
					</div>
				</td>
				<c:if test="${idx.index > 0 }">
					</tr><tr class="hidden">
				</c:if>
				</c:forEach>
			</tr>
			
		</c:forEach>
	</tbody>
</table>
<script type="text/javascript" src="<c:url value='/scripts/custom/feeTables.js'></c:url>"></script>