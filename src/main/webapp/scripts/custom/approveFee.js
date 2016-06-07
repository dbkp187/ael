$(document).ready(function(){
	 var checkNestedTable = function(){
		 $(".nestedDatatable tbody td i.child").each(function(){
			 var nTr = $(this).parents('tr')[0];
			 var reloadChild = function(tr){
				 $(tr).find("td i.child").click();
				 $(tr).find("td i.child").click();
			 };
			 
			 $(nTr).bind("afterOpenChild",function(ev,oInnerTable){
				 $(oInnerTable).find("td.actions a").on("click",function(e){
					 e.preventDefault();
					 e.stopPropagation();
					 var link = $(this).attr("href");
					 $.confirm({
					     text: 'Are you sure?',
					     confirm: function() {
					    	 $.ajax({
								  type: "POST",
								  async:false,
								  url: link,
								  success: function(data){
									  if (data == "error"){
										  UTIL.showMessage(showMessage("accounting.changeApprovalError"), "error");
									  }else{
										  reloadChild(nTr);
									  }
								  },
								  dataType: "text",
								  error: function (xhr, status,response) {
									  UTIL.showMessage(showMessage("ajax.error"), "error");
							      }
								});
					     },
					     cancel: function() {
					         // nothing to do
					     }
					 });
				 });
			 });
		 });
	 };
	 $('.nestedDatatable').bind('redraw',function(){
	 	checkNestedTable();
	 });
	 checkNestedTable();
 });
