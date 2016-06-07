/**
 * Calculate total value for a row
 */
var FEE_TABLE_CONTROL ={
	/**
	 * Calculate total value for a specific row
	 */	
	calculate_total:	function(tr){
			var amount = 0;
			$(tr).find("input.amount").each(function(){
				amount+=parseFloat(accounting.unformat($(this).val()));
			});
			
			var vat = parseFloat(accounting.unformat($(tr).find("input.vat").val())),vatAmount;
			if (vat >0){
				vatAmount = amount*vat/100;
			}else{
				vatAmount = parseFloat(accounting.unformat($(tr).find("input.vatAmount").val()));
			}
			
			var total = vatAmount+amount;
			$(tr).find("input.vatAmount").val(accounting.formatMoney(vatAmount,UTIL.MONEY_STYLE));
			var iTotal = $(tr).find("input.total");
			if ($(iTotal).hasClass("money2")){
				$(tr).find("input.total").val(accounting.formatMoney(total,UTIL.MONEY_STYLE_2_DIGIT));
			}else{
				$(tr).find("input.total").val(accounting.formatMoney(total,UTIL.MONEY_STYLE));
			}
			
	},
	/**
	 * Calculate total value for a specific row
	 */	
	calculate_amount:	function(tr){
			var total = 0;
			$(tr).find("input.total").each(function(){
				total+=parseFloat(accounting.unformat($(this).val()));
			});
			
			var vat = parseFloat(accounting.unformat($(tr).find("input.vat").val())),
			amount = parseFloat(total)*100/parseFloat(vat+100);
			var iTotal = $(tr).find("input.amount");
			if ($(iTotal).hasClass("money2")){
				$(tr).find("input.amount").val(accounting.formatMoney(amount,UTIL.MONEY_STYLE_2_DIGIT));
			}else{
				$(tr).find("input.amount").val(accounting.formatMoney(amount,UTIL.MONEY_STYLE));
			}
			
	},
	//add constraint between 2 class
	checkVatPrice : function(tr,clazz1, clazz2){
		 var val = parseFloat(accounting.unformat($(tr).find(clazz1).val()));
		 if (val >0){
			 if($(tr).find(clazz1).attr("readonly") != "readonly") {
				 $(tr).find(clazz2).attr("readonly","readonly");
			 }
		 }else{
			 $(tr).find(clazz2).removeAttr("readonly");
		 }
	 },
	 clazzVat : ".vat",
	 clazzVatAmount : ".vatAmount",
	 checkVatRow : function(tr){
		 $(tr).find(FEE_TABLE_CONTROL.clazzVat).on("blur",function(){
			 FEE_TABLE_CONTROL.checkVatPrice(tr,FEE_TABLE_CONTROL.clazzVat,FEE_TABLE_CONTROL.clazzVatAmount);
		 });
		 $(tr).find(FEE_TABLE_CONTROL.clazzVatAmount).on("blur",function(){
			 FEE_TABLE_CONTROL.checkVatPrice(tr,FEE_TABLE_CONTROL.clazzVatAmount,FEE_TABLE_CONTROL.clazzVat);
		 });
	 },
	 constrain2class : function(tr,clazz1,clazz2){
		 var val = parseFloat(accounting.unformat($(tr).find(clazz1).val()));
		 if (val >0){
			 $(tr).find(clazz2).attr("readonly","readonly");
		 };
	 },
	 initCheckVat : function(tableId){
		 $("#"+tableId).bind("afterAddRow",function(e,tr){
			 FEE_TABLE_CONTROL.checkVatRow(tr);
		 });
		 $("#"+tableId).find("tbody > tr").each(function(){
			 FEE_TABLE_CONTROL.checkVatRow($(this));
			 FEE_TABLE_CONTROL.constrain2class($(this),FEE_TABLE_CONTROL.clazzVat,FEE_TABLE_CONTROL.clazzVatAmount);
			 var val = parseFloat(accounting.unformat($(this).find(FEE_TABLE_CONTROL.clazzVatAmount).val()));
			 var valAmount = parseFloat(accounting.unformat($(this).find(FEE_TABLE_CONTROL.clazzVat).val()));
			 if (val >0 && valAmount ==0){
				 $(this).find(FEE_TABLE_CONTROL.clazzVat).attr("readonly","readonly");
			 }
		 });
	 },
	/**
	 * Init fee table
	 */
	init	: function(tableId){
		$("#"+tableId).find("tr").each(function(){
//			FEE_TABLE_CONTROL.calculate_total($(this));
			FEE_TABLE_CONTROL.addRowEvents($(this));
		});
		FEE_TABLE_CONTROL.addTableEvents(tableId);
		FEE_TABLE_CONTROL.initTotalTable(tableId);
	},
	/**
	 * Add event for a specific row
	 */
	addRowEvents : function(tr){
		var tableId= $(tr).closest("table").attr("id");
		$(tr).find("input.amount").on("change",function(){
			FEE_TABLE_CONTROL.calculate_total($(this).closest("tr"));
			FEE_TABLE_CONTROL.initTotalTable(tableId);
		});
		
		$(tr).find("input.total").on("change",function(){
			FEE_TABLE_CONTROL.calculate_amount($(this).closest("tr"));
			FEE_TABLE_CONTROL.initTotalTable(tableId);
		});
		
		$(tr).find("input.vat").on("change",function(){
			FEE_TABLE_CONTROL.calculate_total($(this).closest("tr"));
			FEE_TABLE_CONTROL.initTotalTable(tableId);
		});
		
		$(tr).find("input.vatAmount").on("change",function(){
			FEE_TABLE_CONTROL.calculate_total($(this).closest("tr"));
			//FEE_TABLE_CONTROL.initTotalTable(tableId);
		});
		
		$(tr).find("select.masterFee").on("change",function(){
			FEE_TABLE_CONTROL.initTotalTable(tableId);
		});
	},
	/**
	 * Add event for the table
	 */
	addTableEvents : function(tableId){
		$("#"+tableId).bind("afterAddRow",function(ev,tr){
			FEE_TABLE_CONTROL.addRowEvents(tr);
		});
	},
	//SET UP TOTAL TABLE
	initTotalTable : function(tableId){
		var totalTableId = tableId+"Summary",
		tableTotal = $("#"+totalTableId),
		masterList = {};
		//empty content
		$(tableTotal).find("tbody").html("");
		//calculate values for rendering
		var finalTotal = 0;
		$("#"+tableId).find(".masterFee").each(function(){
			var currSelected = $(this).find(":selected").val();
			if (currSelected != undefined){
				if (masterList[currSelected] == undefined){
					masterList[currSelected] = {
							text :  $(this).find(":selected").html(),
							value: 0.0
					};
				}
				
				//add to value
				var value = parseFloat(accounting.unformat($(this).closest("tr").find(".total").val()));
				masterList[currSelected].value = parseFloat(masterList[currSelected].value)+value;
				//finalTotal +=masterList[currSelected].value;
			}
		});
		for (var key in masterList) {
			  if (masterList.hasOwnProperty(key)) {
				  finalTotal +=masterList[key].value;
			    //alert(key + " -> " + p[key]);
			  }
			}
		//render table
		var html="",j=0;
		for (var i in masterList){
			++j;
			html += "<tr>" +
					"<td colType='index'>"+j+"</td>" +
					"<td colType='index'>"+masterList[i].text+"</td>" +
					"<td colType='index'>"+accounting.formatMoney(masterList[i].value,UTIL.MONEY_STYLE)+"</td>" +
					"</tr>";
			
		}
		$(tableTotal).find("tbody").html(html);
		$("#finalValue").val(accounting.formatMoney(finalTotal,UTIL.MONEY_STYLE));
	}
};

$(document).ready(function(){
	//feetable
	$("table.feeTable").each(function(){
		FEE_TABLE_CONTROL.init($(this).attr("id"));
		FEE_TABLE_CONTROL.initCheckVat($(this).attr("id"));
	});
});




