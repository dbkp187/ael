<%@ include file="/common/taglibs.jsp"%>
<table id="generalList"
	class="display table table-condensed inFormTable feeTable no-more-tables" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th rowspan="2"><fmt:message key="table.no" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feeName" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feeDescription"/></th>
			<th colspan="4" class="centerText"><fmt:message key="accountingcus.typeOfContainer"/></th>
			<th rowspan="2"><fmt:message key="accountingcus.unitPrice" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.total" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.vat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feevat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feewithvat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.note" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.invoice" /></th>
			<th rowspan="2"><fmt:message key="table.action"/></th>
		</tr>
		<tr>
			<th class="numberCol"><fmt:message key="accountingcus.20"/></th>
			<th class="numberCol"><fmt:message key="accountingcus.40"/></th>
			<th class="numberCol"><fmt:message key="accountingcus.otCont"/></th>
			<th class="numberCol"><fmt:message key="accountingcus.LCL"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${accountingcus.accountingcusdetails}" var="detail" varStatus="idx"  >
			<tr class="${detail.isAdded == true ? 'hidden' :''}">
				<td colType="index" data-title="<fmt:message key="table.no" />">${idx.index+1}</td>
				<td colType="generalInfo" class="hidden"><form:hidden
						path="accountingcusdetails[${idx.index}].id" /> <form:hidden
						path="accountingcusdetails[${idx.index}].isAdded"
						valueType="added" /> <form:hidden
						path="accountingcusdetails[${idx.index}].isDeleted"
						valueType="deleted" /></td>
				<td data-title="<fmt:message key="accountingcus.feeName" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].name.id">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="23">
					</spring:bind>
					<form:select onchange="changeDes(this);"
							path="accountingcusdetails[${idx.index}].name.id"
							id="descriptionSer${idx.index}" 
							items="${selections['debitfees']}"
							empty-on-add="false"
							cssClass="form-control"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].name.id"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.feeDescription" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].name.description">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="24">
					</spring:bind>
					<%-- <form:select
						path="accountingcusdetails[${idx.index}].name.id"
						id="description${idx.index}" 
						empty-on-add="false"
						items="${selections['debitfees']}"
						cssClass="form-control">							
					</form:select>  
					<form:errors
								path="accountingcusdetails[${idx.index}].name.id"
								cssClass="help-block" /> --%>
						<form:input id="description${idx.index}" type="text" path="accountingcusdetails[${idx.index}].name.description" cssClass="form-control descript"/>
					</div>
				</td>
				<script>
					$(document).ready(function(){
						$("#description${idx.index}").prop('disabled', true);
						var id = $( "#descriptionSer${idx.index} option:selected" ).val();
						$.ajax({
						    type: "GET",
						    url: "<c:url value='/admin/accounting/custom/ajax'/>",
						    data: "id=" + id,
						    success: function(msg){
						    	$("#description${idx.index}").val(msg);
						    }
						});
						
					});
					function changeDes(obj){
						var id = $(obj).find('option:selected').val();
						$.ajax({
						    type: "GET",
						    url: "<c:url value='/admin/accounting/custom/ajax'/>",
						    data: "id=" + id,
						    success: function(msg){
						    	$(obj).parents('td').next('td').find('.descript').val(msg);
						    }
						});
					}
				</script>
				<td data-title="<fmt:message key="accountingcus.typeOfContainer"/>:<fmt:message key="accountingcus.20" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].quantity20">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" defaultValue="${accountingcus.docsgeneral.noOf20Cont}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].quantity20" 
							id="description${idx.index}"  value="${accountingcus.docsgeneral.noOf20Cont}"
							cssClass="form-control number quantity" /> 
					<form:errors
								path="accountingcusdetails[${idx.index}].quantity20"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.typeOfContainer"/>:<fmt:message key="accountingcus.40" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].quantity40">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" defaultValue="${accountingcus.docsgeneral.noOf40Cont}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].quantity40" 
							id="description${idx.index}" 
							cssClass="form-control number quantity"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].quantity40"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.typeOfContainer"/>:<fmt:message key="accountingcus.otCont" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].quantityOt">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" defaultValue="${accountingcus.docsgeneral.otCont}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].quantityOt" 
							id="description${idx.index}" 
							cssClass="form-control number quantity"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].quantityOt"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.typeOfContainer"/>:<fmt:message key="accountingcus.LCL" />">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].quantityLCL" >
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" defaultValue="${accountingcus.docsgeneral.isLCL ? 1 : 0}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].quantityLCL"
							id="description${idx.index}" 
							cssClass="form-control number quantity"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].quantityLCL"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.unitPrice"/>">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].unitPrice">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].unitPrice"
							id="description${idx.index}" 
							cssClass="form-control money unitPrice"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].unitPrice"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.total"/>">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].total">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].total"
							id="description${idx.index}" 
							cssClass="form-control money amount"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].total"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.vat"/>">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].generalVat">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].generalVat"
							id="description${idx.index}" 
							cssClass="form-control money2 vat"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].generalVat"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.feevat"/>">
					<div class="form-group">
				        <form:input path="accountingcusdetails[${idx.index}].vatAmount" cssClass="form-control money vatAmount " />
				    </div>
			    </td>
			    <td data-title="<fmt:message key="accountingcus.feewithvat"/>">
					<div class="form-group">
				        <form:input path="accountingcusdetails[${idx.index}].feewithvat" cssClass="form-control money total readonly" readonly="true"/>
				    </div>
			    </td>
			    <td data-title="<fmt:message key="accountingcus.note"/>">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].note">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].note"
							id="description${idx.index}" 
							cssClass="form-control"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].note"
								cssClass="help-block" />
					</div>
				</td>
				<td data-title="<fmt:message key="accountingcus.invoice"/>">
					<spring:bind path="accountingcus.accountingcusdetails[${idx.index}].invoice">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind>
					<form:input
							path="accountingcusdetails[${idx.index}].invoice"
							id="description${idx.index}" 
							cssClass="form-control"/> 
					<form:errors
								path="accountingcusdetails[${idx.index}].invoice"
								cssClass="help-block" />
					</div>
				</td>
				<td rowType="actions"><span class="iconButton removeRow"
					title="<fmt:message key='table.buttonEditTitle'/>"> <i
						class="fa fa-trash"></i>
				</span></td>
			</tr>			
		</c:forEach>
	</tbody>
</table>
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-2">
		<span class="btn btn-primary" target-table="generalList"> <i class="fa fa-plus"></i> <fmt:message key="button.add" /></span>
	</div>
</div>
<script type="text/javascript" src="<c:url value='/scripts/custom/feeTables.js'></c:url>"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 var checkUnitPrice = function(tr){
			 var val = parseFloat(accounting.unformat($(tr).find(".unitPrice").val()));
			 if (val >0){
				 $(tr).find(".amount").attr("readonly","readonly");
				 //sum quantity
				 var totalQuantity = 0;
				 $(tr).find(".quantity").each(function(){
					 totalQuantity += parseInt($(this).val());
				 });
				 $(tr).find(".amount").val(accounting.formatMoney(val*totalQuantity,UTIL.MONEY_STYLE));
				 $(tr).find(".amount").trigger("change");
			 }else{
				 $(tr).find(".amount").removeAttr("readonly");
			 }
	 },
	 checkOneRow = function(tr){
		 $(tr).find(".unitPrice").on("blur",function(){
			 checkUnitPrice(tr);
		 });
		 $(tr).find(".quantity").on("blur",function(){
			 checkUnitPrice(tr);
		 });
	 };
	 
	 	 
	 $("#generalList").bind("afterAddRow",function(e,tr){
		 checkOneRow(tr);
		 var id = $(tr).find('select option:selected').val();
			$.ajax({
			    type: "GET",
			    url: "<c:url value='/admin/accounting/custom/ajax'/>",
			    data: "id=" + id,
			    success: function(msg){
			    	$(tr).find(".descript").val(msg);
			    }
			});
	 });
	 
	 $("#generalList").find("tbody > tr").each(function(){
		 checkOneRow($(this));
		 FEE_TABLE_CONTROL.calculate_total($(this));
		 FEE_TABLE_CONTROL.constrain2class($(this),".unitPrice",".amount");
	 });
 });
</script>
