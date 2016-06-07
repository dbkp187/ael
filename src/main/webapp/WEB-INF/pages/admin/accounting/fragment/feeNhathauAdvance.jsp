<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="feeTablesacc.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>


	<h2><fmt:message key="feeNhathauTableAcc.heading"/></h2>
    <jsp:include page="searchFeeNhathauTablesAdvance.jsp"></jsp:include>
    
    <form:form>
	    <div class="row">
	   		<div class="form-group col-md-6" >
	   			<a id="selectBtn" class="btn btn-primary btn-select"><fmt:message key="accounting.fee.selectAll" /></a>
	   			<a id="deselectBtn" class="btn btn-primary btn-deselect"><fmt:message key="accounting.fee.unselectAll" /></a>
	   			<a id="approvedBtn" class="btn btn-success btn-approve"><fmt:message key="accounting.fee.approve" /></a>
	   		</div>
	   		<div class="form-group col-md-6" >
	   			<b style="color: red;">
	   				<input id="sumValue" class="form-control sum-value" placeholder="0" />
	   			</b>
	   		</div>
	    </div>
    </form:form>
    <hr>
    <table id="feeListAdvance" class="display datatable dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="accounting.nhathau"/></th>
                <th><fmt:message key="contseal.noOfCont" /></th>
                <th><fmt:message key="contseal.typeOfCont" /></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="packageInfo.masterFee" /></th>
                <th><fmt:message key="packageInfo.feeName" /></th>
				<th><fmt:message key="packageInfo.feevalue" /></th>
				<th><fmt:message key="packageInfo.feevavat" /></th>
				<th><fmt:message key="packageIngo.total" /></th>
				<th><fmt:message key="accounting.kt.approval" /></th>
				<th><fmt:message key="accounting.approvalDate" /></th>
				<th><fmt:message key="accounting.feeAdminApproval" /></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="trucking.refNo"/></th>
                <th><fmt:message key="accounting.nhathau"/></th>
                <th><fmt:message key="contseal.noOfCont" /></th>
                <th><fmt:message key="contseal.typeOfCont" /></th>
                <th><fmt:message key="trucking.searchDate"/></th>
                <th><fmt:message key="packageInfo.masterFee" /></th>
                <th><fmt:message key="packageInfo.feeName" /></th>
				<th><fmt:message key="packageInfo.feevalue" /></th>
				<th><fmt:message key="packageInfo.feevavat" /></th>
				<th><fmt:message key="packageIngo.total" /></th>
				<th><fmt:message key="accounting.kt.approval" /></th>
				<th><fmt:message key="accounting.approvalDate" /></th>
				<th><fmt:message key="accounting.feeAdminApproval" /></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${exfees}" var="exfee" varStatus="idx">
        	<tr id="${exfee.id}">
                <td>${idx.index+1}</td>
                <td>${exfee.truckingdetail.truckingservice.docsgeneral.jobNo}</td>
                <td>${exfee.truckingdetail.nhathau.code}</td>
                <td>${exfee.truckingdetail.consteal.noOfCont }</td>
                <td>${exfee.truckingdetail.consteal.typeOfCont.value }</td>
                <td><fmt:formatDate value="${exfee.truckingdetail.dateDev}" pattern="dd/MM/yyyy"/></td>
              	<td>${exfee.masterFee.value}</td>
              	<td>${exfee.name.value}</td>
              	<td><fmt:formatNumber>${exfee.amount}</fmt:formatNumber></td>
              	<td><fmt:formatNumber>${exfee.vat}</fmt:formatNumber></td>
              	<td><fmt:formatNumber>${exfee.total}</fmt:formatNumber></td>
              	<td><fmt:message key="${exfee.approvedText}" /></td>
              	<td><fmt:formatDate value="${exfee.dateChange}" pattern="dd/MM/yyyy"/></td>
              	<td><fmt:message key="${exfee.checkByAdminText}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <hr>
    <form:form>
	    <div class="row">
	   		<div class="form-group col-md-6" >
	   			<a id="selectBtn" class="btn btn-primary btn-select"><fmt:message key="accounting.fee.selectAll" /></a>
	   			<a id="deselectBtn" class="btn btn-primary btn-deselect"><fmt:message key="accounting.fee.unselectAll" /></a>
	   			<a id="approvedBtn" class="btn btn-success btn-approve"><fmt:message key="accounting.fee.approve" /></a>
	   		</div>
	   		<div class="form-group col-md-6" >
	   			<b style="color: red;">
	   				<input id="sumValue" class="form-control sum-value" placeholder="0" />
	   			</b>
	   		</div>
	    </div>
    </form:form>
 <c:set var="now" value="<%=new java.util.Date()%>" />
 <script>

 var approvedIds = [];
 var approvedGroupString = "";
 var rows;
 var sumValue = 0;
 var money = "";
 var table = $("#feeListAdvance");
 $(document).ready(function() {
	onOffButton();
 	table.on( "click", "tr:has(td)", function() {
 		clickRow($(this));
 	})
 	
 	$(".btn-select").on( "click", function() {
		table.find("tr:has(td)").each(function() {
			if (!$(this).hasClass('highlight')) {
				clickRow($(this));
			}
		})
 	})
 	
 	$(".btn-deselect").on( "click", function() {
		table.find("tr:has(td)").each(function() {
			if ($(this).hasClass('highlight')) {
				clickRow($(this));
			}
		})
 	})
 	
 	$(".btn-approve").on( "click", function() {
 		approveBulk();
 	})
 });

 function clickRow(tr) {
	var id = tr.attr('id');
	var notApproved = tr.find("td").eq(11).html().indexOf('C') > -1;
	var money = tr.find('td').eq(10).text();
	var moneyValid = money != null && money != 0;

	if (id != null && notApproved && moneyValid) {
		if(tr.hasClass("highlight")) {
			tr.removeClass("highlight");
			var index = approvedIds.indexOf(id);
			if (index > -1) {
				approvedIds.splice(index, 1);
				
				//money = tr.find('td').eq(9).text();
				sumValue -= parseInt(money.replace(/,/g, "")); 
				$(".sum-value").val(sumValue.toLocaleString('en-IN'));
			}
		} else {
			approvedIds.push(id);
			tr.addClass("highlight");
			
			//money = tr.find('td').eq(9).text();
			sumValue += parseInt(money.replace(/,/g, "")); 
			$(".sum-value").val(sumValue.toLocaleString('en-IN'));
		}
		
	} 
	onOffButton();
 }
 
 function onOffButton() {
 	if (approvedIds.length > 0) {
 		$('.btn-approve').removeClass('disabled');
 	} else {
 		$('.btn-approve').addClass('disabled');
 	}
 }
 
 function approveBulk() {
	if (confirm("Are you sure?")) {
	 	if (approvedIds.length > 0) {
	 		var ids = approvedIds[0];
	 		for(var i = 1; i < approvedIds.length; i ++) {
	 			ids += "," + approvedIds[i];
	 		}
	 
			$.ajax({
			    type: "POST",
			    url: "./changeApprovalBulk",
			    data: {"ids": ids},
			    success: function(msg){
			    	$('.btn-approve').addClass('disabled');
			    	$("#btn-search-advance").click();
			    	/* for (var i = 0; i < approvedIds.length; i++) {
			    		$('#' + approvedIds[i]).removeClass('highlight');
			    		$('#' + approvedIds[i]).find('td:eq(11)').text("<fmt:formatDate type='time' value='${now}' pattern='dd/MM/yyyy'/>");
			    		$('#' + approvedIds[i]).find('td:eq(10)').text("<fmt:message key='accounting.fee.isApproved' />");
			    	}
			    	$(".sum-value").val(0);
			    	onOffButton(); */
			    }
			}); 
	 	}
 	}
 }


</script>   