/**
 * 
 */
/*var ADVANCE_TABLE_CONTROL ={
		init	: function(tableId){
			$("#"+tableId).find("tr").each(function(){
				ADVANCE_TABLE_CONTROL.addRowEvents($(this));
			});
		},
		addRowEvents : function(tr){
			var tableId= $(tr).closest("table").attr("id");
			$(tr).find("select").on("change",function(){
				getRemainingAdvance();
			});
		},
};
*/
 var addEventForAdvance = function(row){
	 var selectCol = $(row).find('select').first();
   $(selectCol).on("change",function(e){
	   getRemainingAdvance();
   });
 };
 
 $("tr").each(function(){
	 addEventForAdvance($(this));
 });

$("#advanceformList").bind("afterAddRow",function(e,row){
	addEventForAdvance(row);	
 });
$("#advanceformList").change(function(){ 
	getRemainingAdvance();
});

function getRemainingAdvance() {
	var map = new Object();
	var docIdList = [];
	var emp = $('#empId').val();
	var date =$('#date').datepicker( "getDate" );
	var month = date.getMonth() + 1;
	var advanceDate = date.getDate()+"/"+month+"/"+date.getFullYear();
	if (emp==null) {
		emp = $('#employee\\.id').val();
	}
	 $('#advanceformList > tbody > tr').each(function(){
		 if (!$(this).hasClass('hidden')) {
			 var jobNo = $(this).find('select').val();
			 var amount = accounting.unformat($(this).find(".advanceAmount").val());
			 docIdList[docIdList.length] =  jobNo;
			 if (jobNo in map) {
				var tmp = accounting.unformat(map[jobNo]);
				if (!isNaN(amount)) {
					tmp = tmp + amount;
				}				
				map[jobNo]= tmp;
			}
			 else {
				 map[jobNo]= amount;
			}
		}		 
	 });
	 try {
		 if (docIdList.length>0) {
			 $.ajax({
					type : "GET",
					url : ctx + "/users/advanceForm/getRemainAdvance",
					data : "docIdList="+docIdList+"&userId="+ emp +"&date="+ advanceDate ,
					dataType : "text",
					success : function(response) {
						var p = jQuery.parseJSON(response);
						if (isApproved!=true) {
							$('#advanceformList > tbody > tr').each(function(){
								 if (!$(this).hasClass('hidden')) {
									 var docId =  $(this).find('select').val();
									 var amount = $(this).find(".advanceAmount").val();
									 for (var key in p) {
										 if (p.hasOwnProperty(key)) {
											 if (key == docId) {
													$(this).find(".remainAdvance").val(accounting.formatMoney(p[key],UTIL.MONEY_STYLE));
												}
										 }						
										}
								}		 
							 });
						}else {
							$('#advanceformList > tbody > tr').each(function(){
								 if (!$(this).hasClass('hidden')) {
									 var docId =  $(this).find('select').val();
									 var amount = $(this).find(".advanceAmount").val();
									 for (var key in p) {
										 if (p.hasOwnProperty(key)) {
											 if (key == docId) {
												 var remain = 0;
												 if (p[key]!=0) {
													 remain = map[key] - p[key] ;
													 if (remain<0) {
														remain = p[key] - map[key];
													}
												}
													$(this).find(".remainAdvance").val(accounting.formatMoney(remain,UTIL.MONEY_STYLE));
												}
										 }						
										}
								}		 
							 });
						}
						 
						
					},
					error : function(xhr, status, error) {
						alert(xhr.responseText);
					},
					cache : false
			});
				return false;
		}
			
		 }
		catch(err) {
		}
	
}