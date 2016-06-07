/**
 * 
 */

function calculateTotal(){
	var sum = 0;
	$('#refundList  .phieuthuAmount').each(function()
			{
		if (!$(this).is('[readonly]')) {
			sum += parseFloat(accounting.unformat($(this).val()));
		}
			});
	$('#totalVal').val(accounting.formatMoney(sum,UTIL.MONEY_STYLE));
};

$("#refundList").change(function(){ 
	calculateTotal();
});

$("#refundList").bind("afterRemoveRow",function(e,row){
	calculateTotal();
 });

$("#refundList").bind("unRemoveRow",function(e,row){
	alert("yah");
	calculateTotal();
 });