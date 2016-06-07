var SELECT_CONTROL = {
		init: function(scope){
			if (scope == undefined){
				scope = $("body");
			}
			$(scope).find("select").each(function(){
				if ($(this).parent().attr("addUrl") != undefined){
					var itemType = $(this).parent().attr("type"),
					select = $(this);
					$(this).select2({
					    allowClear:true,
					    formatNoMatches: function(term) {
					        /* customize the no matches output */
					        return "<input class='form-control' id='newTerm' value='"+term+"' itemType='"+itemType+"'><a href='#' id='addNewOption' class='btn btn-link'>"+showMessage('select2.addMissing')+"</a>";
					    }
					  })
					  .parent().find('.select2-with-searchbox').on('click','#addNewOption',function(){
						//add to all selection on pages wait for ajax call to get new id
					    SELECT_CONTROL._addNewOption($('#newTerm').val(), $('#newTerm').attr('itemType'),select);
					  });
				}else{
					$(this).select2();
				}
			});
		},
		/**
		 * Add new item to all selection
		 */
		_addToAllSelection : function(conf,select){
			var newTerm = conf.value;
		    $("div[type='"+conf.type+"']").each(function(){
		    	$('<option value="'+conf.id+'">'+newTerm+'</option>').appendTo($(this).find("select"));
		    });
		    $(select).select2('val',conf.id); // select the new term
		    $(select).select2('close');		// close the dropdown
		},
		_addNewOption : function(value,type,select){
			var postData = {
						value : value,
						type : type
			};
			if (value !=undefined && value.length >0){
				$.ajax({
					headers: {
				        "Accept": "application/json",
				        "Content-Type": "application/json"
				    },
				  type: "POST",
				  url: contextPath+$(select).parent().attr("addUrl"),
				  data: JSON.stringify(postData),
				  success: function(data){
					  if (data.id != undefined){
						  SELECT_CONTROL._addToAllSelection(data,select);
					  }
					  else{
						  UTIL.showMessage(showMessage("ajax.error"), "error");
					  }
				  },
				  dataType: "json",
				  error: function (xhr, status,response) {
					  UTIL.showMessage(showMessage("ajax.error"), "error");
			      }
				});
			}else{
				UTIL.showMessage(showMessage("configuration.add.empty"), "error");
			}
			
		}
};