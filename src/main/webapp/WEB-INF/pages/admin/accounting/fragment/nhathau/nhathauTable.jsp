<%@ include file="/common/taglibs.jsp"%>
<table id="detailsList"
	class="display table table-condensed no-more-tables feeTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th rowspan="2" style="max-width:10px;"><fmt:message key="trucking.tooglefeeTables" /></th>
			<th rowspan="2"><fmt:message key="table.no" /></th>
			<th rowspan="2"><fmt:message key="accountingtrans.dateDev"/></th>
			<th rowspan="2"><fmt:message key="accountingtrans.jobNo" /></th>
			<th rowspan="2"><fmt:message key="customer.title" /></th>
			<th rowspan="2"><fmt:message key="accountingtrans.contNo" /></th>
			<th rowspan="2"><fmt:message key="accountingnhathau.hangnhapxuat"/></th>
			<th rowspan="2"><fmt:message key="accountingtrans.placegetcont" /></th>
			<th rowspan="2"><fmt:message key="accountingtrans.placeputcont" /></th>
			<th colspan="2" class="centerText"><fmt:message key="accountingtrans.typeOfContainer"/></th>			
			<th rowspan="2"><fmt:message key="accountingnhathau.noidi" /></th>
			<th rowspan="2"><fmt:message key="accountingnhathau.noiden" /></th>
			<th rowspan="2"><fmt:message key="accountingnhathau.phuthu" /></th>
			<th rowspan="2"><fmt:message key="accountingtrans.total" /></th>
		</tr>
		<tr>
			<th class="numberCol"><fmt:message key="accountingtrans.20"/></th>
			<th class="numberCol"><fmt:message key="accountingtrans.40"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${accountingNhathau.truckingdetails}" var="truck" varStatus="idx">
			<tr>
				<td>
					<button class="btn-link toogle" type="button" data-toggle="collapse" data-target="#child${idx.index}" aria-expanded="false" aria-controls="collapseExample">
						<i class="fa fa-money"></i>
					</button>
				</td>
				<td colType="index" data-title="<fmt:message key="table.no" />">${idx.index+1}</td>
				<td class="hidden">
					<form:hidden path="truckingdetails[${idx.index}].id"/>
					<form:hidden path="truckingdetails[${idx.index}].truckingservice.id"/>
				</td>
				<td data-title="<fmt:message key="accountingtrans.dateDev" />">
					<div class="form-group">
					<fmt:formatDate value="${truck.dateDev}" pattern="dd/MM/yyyy"/>					
				    </div>				    
				</td>
				 <td data-title="<fmt:message key="accountingtrans.jobNo" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.jobNo}
				    </div>
				</td>
				<td data-title="<fmt:message key="customer.title" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.customer.name }
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingtrans.contNo"/>">
					<div class="form-group">
							${truck.consteal.noOfCont}
					</div>
				</td>
				<td data-title="<fmt:message key="accountingnhathau.hangnhapxuat" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.typeOfImport.value }
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingtrans.placegetcont"/>">
					<div class="form-group">
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty truck.truckingservice.docsgeneral.packageinfo && truck.truckingservice.docsgeneral.typeOfImport.id == -3}"> --%>
<%-- 								${truck.truckingservice.docsgeneral.packageinfo.portOfArrival} --%>
<%-- 						  	</c:when> --%>
<%-- 						  	<c:when test="${not empty truck.truckingservice.docsgeneral.inland}"> --%>
								${truck.placeGetCont}
<%-- 						  	</c:when> --%>
<%-- 						  	<c:otherwise> --%>
<%-- 						  		${truck.truckingservice.docsgeneral.placeRev} --%>
<%-- 						  	</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</div>
				</td>
				<td data-title="<fmt:message key="accountingtrans.placeputcont"/>">
					<div class="form-group">
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty truck.truckingservice.docsgeneral.packageinfo && truck.truckingservice.docsgeneral.typeOfImport.id == -3}"> --%>
<%-- 								${truck.truckingservice.departure} --%>
<%-- 						  	</c:when> --%>
<%-- 						  	<c:when test="${not empty truck.truckingservice.docsgeneral.inland}"> --%>
								${truck.placePutCont}
<%-- 						  	</c:when> --%>
<%-- 						  	<c:otherwise> --%>
<%-- 						  		${truck.truckingservice.docsgeneral.placeDelivery} --%>
<%-- 						  	</c:otherwise> --%>
<%-- 						</c:choose>						  --%>
					</div>
				</td>
				<td data-title="<fmt:message key="accountingtrans.typeOfContainer"/>:<fmt:message key="accountingtrans.20"/>">
					<div class="form-group">
					<c:choose>
						<c:when test="${fn:containsIgnoreCase(truck.consteal.typeOfCont.value, '20')}">
								1
						</c:when>
						<c:otherwise>
						 0
						</c:otherwise>
					</c:choose>
						
					</div>
				</td>
				<td data-title="<fmt:message key="accountingtrans.typeOfContainer"/>:<fmt:message key="accountingtrans.40"/>">
					<div class="form-group">
						<c:choose>
						<c:when test="${fn:containsIgnoreCase(truck.consteal.typeOfCont.value, '40')}">
								1
						</c:when>
						<c:otherwise>
						 0
						</c:otherwise>
					</c:choose>
					</div>
				</td>
				<td data-title="<fmt:message key="accountingnhathau.noidi" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.placeRev }
				    </div>
				</td>
				<td data-title="<fmt:message key="accountingnhathau.noiden" />">
					<div class="form-group">
				        ${truck.truckingservice.docsgeneral.placeDelivery }

				    </div>
				</td>
				<td data-title="<fmt:message key="accountingnhathau.phuthu"/>">
					<div class="form-group">
						<form:input path="truckingdetails[${idx.index}].phuthu"  maxlength="16"  cssClass="form-control money" />
					</div>
				</td>
				
				<td data-title="<fmt:message key="accountingtrans.total"/>">
					<div class="form-group">
						<form:input path="truckingdetails[${idx.index}].total" class="form-control total money" disabled="true"/>
					</div>
				</td>
			</tr>
			<tr colType="truck" class="${truck.isAdded == true ? 'hidden' :''}">
				<td colspan="16" style="border-top:none;">
					<!-- 				DETAIL -->
					<div class="in" id="child${idx.index}">

						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a
								href="#home${idx.index}" aria-controls="home" role="tab"
								data-toggle="tab"> <fmt:message
										key="exhibition.feeTablesDetail" />
							</a></li>
							<li role="presentation"><a href="#profile${idx.index}"
								aria-controls="profile" role="tab" data-toggle="tab"> <fmt:message
										key="exhibition.feeTablesSummary" />
							</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active"
								id="home${idx.index}">
								<h3>
									<fmt:message key="exhibition.feeTables" />
								</h3>
								<table id="childTable${idx.index}"
									class="display table table-condensed inFormTable feeTable"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th><fmt:message key="table.no" /></th>
											<th><fmt:message key="inland.masterFee" /></th>
											<th><fmt:message key="inland.feeName" /></th>
											<th><fmt:message key="inland.feevalue" /></th>
											<th><fmt:message key="inland.feevavat" /></th>
											<th><fmt:message key="inland.total" /></th>
											<th><fmt:message key="inland.feeInvoiceNo" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${truck.exfeetables}" var="exfeetable"
											varStatus="idxx">
											<tr class="${exfeetable.isAdded == true ? 'hidden' :''}">
												<td colType="index"
													data-title="<fmt:message key="table.no"/>">${idxx.index+1}</td>
												<td colType="generalInfo" class="hidden"><form:hidden
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].id" />
													<form:hidden
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].isAdded"
														valueType="added" /> <form:hidden
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].isDeleted"
														valueType="deleted" /></td>
												<td><spring:bind
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].masterFee.id">
														<div
															class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
													</spring:bind> <form:select
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].masterFee.id"
														id="masterFee${idx.index}" 
														cssClass="form-control masterFee"
														items="${selections['masterFees']}" disabled="disabled"/> <form:errors
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].masterFee.id"
														cssClass="help-block" />
													</div></td>
												<td data-title="<fmt:message key="inland.feeName"/>"><spring:bind
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].name.id">
														<div
															class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}"
															addUrl="/admin/config/constant" type="19">
													</spring:bind> <form:select
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].name.id"
														id="name${idxx.index}" 
														cssClass="form-control"
														items="${selections['exhFeeNames']}" disabled="disabled"/> <form:errors
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].name.id"
														cssClass="help-block" />
													</div></td>
												<td data-title="<fmt:message key="inland.feevalue"/>"><spring:bind
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].amount">
														<div
															class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
													</spring:bind> <form:input
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].amount"
														id="amount${idxx.index}" maxlength="45" 
														cssClass="form-control amount money" readonly="true"/> <form:errors
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].amount"
														cssClass="help-block" />
													</div></td>
												<td data-title="<fmt:message key="inland.feevavat"/>"><spring:bind
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].vat">
														<div
															class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
													</spring:bind> <form:input
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].vat"
														id="vat${idxx.index}" maxlength="45" 
														cssClass="form-control vat money" readonly="true"/> <form:errors
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].vat"
														cssClass="help-block" />
													</div></td>
												<td data-title="<fmt:message key="inland.total"/>"><form:input
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].total"
														id="total${idxx.index}" maxlength="45" 
														cssClass="form-control total money" readonly="true"/></td>
												<td data-title="<fmt:message key="inland.feeInvoiceNo"/>"><spring:bind
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].invoiceNo">
														<div
															class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
													</spring:bind> <form:input
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].invoiceNo"
														id="vat${idxx.index}" maxlength="45" 
														cssClass="form-control" readonly="true"/> <form:errors
														path="truckingdetails[${idx.index}].exfeetables[${idxx.index}].invoiceNo"
														cssClass="help-block" />
													</div></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile${idx.index}">
								<table id="childTable${idx.index}Summary"
									class="display table table-striped ">
									<thead>
										<tr>
											<th><fmt:message key="table.no" /></th>
											<th><fmt:message key="inland.masterFee" /></th>
											<th><fmt:message key="inland.total" /></th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script type="text/javascript" src="<c:url value='/scripts/custom/feeTables.js'></c:url>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//feetable
		$("table.feeTable").each(function(){
			FEE_TABLE_CONTROL.init($(this).attr("id"));
		});
		$('select').attr("disabled", "disabled");
		$("button.toogle").click();
	});
</script>