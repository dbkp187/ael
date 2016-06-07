$(document).ready(function(){
    		var updateExtension = function(scope){
    			$(scope).find('input[type="file"]').on("change",function(){
        			var data = $(this).val().split("."),
        			fileName = data[0].split("\\"),
        			fileName = fileName[fileName.length-1];
        			extension = data[data.length-1];
        			$(this).next().val(extension);
        			$(this).closest("tr").find("input.fileName").val(fileName);
        		});
    		};
    		updateExtension($("#attachmentList"));
    		
    		$("#attachmentList").bind("afterAddRow",function(e,tr){
    			updateExtension(tr);
    		});
    	});