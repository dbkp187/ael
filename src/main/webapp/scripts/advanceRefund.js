$(document).ready(function(){
//	$("#startDate").datepicker("setDate",new Date());
//	$("#endDate").datepicker("setDate",new Date());
//	$("#startTimeRefund").datepicker("setDate",new Date());
//	$("#endTimeRefund").datepicker("setDate",new Date());
//	$("#startDate1").datepicker("setDate",new Date());
//	$("#endDate1").datepicker("setDate",new Date());
//	$("#startDateVT").datepicker("setDate",new Date());
//	$("#endDateVT").datepicker("setDate",new Date());
//	$("#startDateVT1").datepicker("setDate",new Date());
//	$("#endDateVT1").datepicker("setDate",new Date());
	//active tab
	if($('#flag').val() == "1"){
		$('.nav-tabs a[href="#home"]').tab('show');
	}
	else if($('#flag').val() == "2"){
		$('.nav-tabs a[href="#settings"]').tab('show');
	}
	else if($('#flag').val() == "3"){
		$('.nav-tabs a[href="#sumary"]').tab('show');
	}
});
	
