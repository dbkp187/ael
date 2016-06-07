var INDEX = {
	cont : 1,
	seal : 2,
	contType: 3,
	Sheet1: 'Sheet1'
};

$(document).ready(function(){
	new EXCEL({file:CONT_IMPORT.fileId,type:"json"});
	$("#"+CONT_IMPORT.fileId).bind("readed",function(e,output){
		var table=$("#"+CONT_IMPORT.tableId),
		addBut = $("[target-table='"+CONT_IMPORT.tableId+"']");
		var curr = 0;
		$(table).bind("afterAddRow",function(e,lastTr){
			var data = output[INDEX.Sheet1][curr];
			if (data != undefined){
				++curr;
				var count = 0;
				for (var k in data){
					if (count == INDEX.cont){
						$(lastTr).find(".cont").val(data[k]);
					}else if (count == INDEX.seal){
						$(lastTr).find(".seal").val(data[k]);
					}else if (count == INDEX.contType){
						var type = $(lastTr).find("select.contType > option:contains('"+data[k]+"')");
						$(lastTr).find("select.contType").select2("val",($(type).attr("value")));
					}
					if (k!= undefined) {count = (count +1)%4};
				}
			}
		});
		
		for (var i in output){
			if (output[i] != undefined){
				for (var j in output[i]){
					if (output[i][j] != undefined){
						$(addBut).click();
					}
				}
			}
		}
	});
	
	
});