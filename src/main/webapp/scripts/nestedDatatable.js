/**
 * Define jQuery plugin for dataTable: nested table
 * @param $
 */
(function($) {
    $.nestedTable = function(element, options) {
        var defaults = {
        	tableId: 'nestedTable'
        };

        var plugin = this;
        plugin.settings = {};

        // the "constructor" method that gets called when the object is created
        plugin.init = function() {
            // the plugin's final properties are the merged default and 
            // user-provided options (if any)
            plugin.settings = $.extend({}, defaults, options);
            
            options.detailTableInfo = options.detailTableInfo.split(",");
            options.detailTableMapping = options.detailTableMapping.split(",");
            // code goes here
            this.cloneElements();
            this.initParentTable();
            //this.childsHandler();
        };
        
        /**
	     * Add a column at the beginning
	     */
	    plugin.cloneElements	= function(){
	    	//Insert a 'details' column to the table
            var nCloneTh = document.createElement('th');
            var nCloneTd = document.createElement('td');
            	nCloneTd.innerHTML = "<i class='"+options.openTag+" child'></i>";
            
            nCloneTd.className = "center";
            nCloneTd.setAttribute("colType", "childControl");

            $('#'+options.tableId+' thead tr').each(function () {
                this.insertBefore(nCloneTh, this.childNodes[0]);
            });
            
            $('#'+options.tableId+' tfoot tr').each(function () {
                this.insertBefore(nCloneTh.cloneNode(true), this.childNodes[0]);
            });

            $('#'+options.tableId+' tbody tr').each(function () {
                this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
            });
	    };
	    
	    /**
	     * Initialse DataTables, with no sorting on the 'details' column
	     */
	    plugin.initParentTable	= function(){
	    	var that = this;
            this.oTable = $('#'+options.tableId).dataTable({
                "sPaginationType": "full_numbers",
                "fnDrawCallback": function( oSettings ) {
                	that.childsHandler();
                	$('#'+options.tableId).trigger('redraw');
                },
                "aoColumnDefs": [
                { "bSortable": false, "aTargets": [0] }
            ],
                "aaSorting": [[1, 'asc']]
            });
	    };
	    
	    /**
	     * Add event listener for opening and closing details
         * Note that the indicator for showing which row is open is not controlled by DataTables,
         * rather it is done here
         */
	    plugin.childsHandler = function(){
	    		var that = this;
	    		this.iTableCounter = 1;
	            var oInnerTable;
	            $('#'+options.tableId+' tbody td i.child[hasEvent != "true"]').on('click', function () {
	            		$(this).attr("hasEvent","true");
		                var nTr = $(this).parents('tr')[0];
		                if (that.oTable.fnIsOpen(nTr)) {
		                    /* This row is already open - close it */
		                	$(this).removeClass(options.closeTag);
		                    $(this).addClass(options.openTag);
		                    that.oTable.fnClose(nTr);
		                }
		                else {
		                    /* Open this row */
		                	$(this).removeClass(options.openTag);
		                    $(this).addClass(options.closeTag);
		                    var childDetail = that.loadChildDetail(nTr);
		                    that.oTable.fnOpen(nTr, fnFormatDetails(that.iTableCounter, childDetail), 'details');
		                    oInnerTable = $("#childTable_" + that.iTableCounter).dataTable({
		                        "bJQueryUI": true,
		                        "destroy": true,
		                        "sPaginationType": "full_numbers",
		                         "paging": false,
		                         "searching": false
		                    });
		                    that.iTableCounter = that.iTableCounter + 1;
		                    $(nTr).trigger("afterOpenChild",oInnerTable);
		                }
	            });
	            $('#'+options.tableId+' tbody td i.child[hasEvent != "true"]').attr("hasEvent","true");
	    };
	    
	    /**
	     * Call ajax to get content of this row
	     * @param tr
	     * @returns
	     */
	    plugin.loadChildDetail = function(tr){
	    	var that = this,htmlData = "test", params=$(tr).attr("params");
	    	$.ajax({
				  type: "POST",
				  async:false,
				  url: options.urlForChild+"?"+params,
				  success: function(data){
					  if (data != "error"){
						   UTIL.showMessage(options.successLoadMessage, "info");
						   htmlData = data;
					  }
				  },
				  dataType: "json",
				  error: function (xhr, status,response) {
					  UTIL.showMessage(showMessage("ajax.error"), "error");
			      }
				});
	    	
	    	return htmlData;
		};
		/**
		 * Format child table
		 * @param table_id
		 * @param html
		 * @returns {String}
		 */
		var fnFormatDetails = function(table_id, html) {
			//action
			var actionCheckText = "",actionvalues="", actionIcon="fa fa-pencil-square-o";
			if (options.actionIcon != undefined && options.actionIcon.length>0){
				actionIcon = options.actionIcon;
			}
			if (options.actionCheck != undefined && options.actionCheck.length>0){
				var tem = options.actionCheck.split(":");
				actionCheckText = tem[0],
				actionvalues = tem[1].split(",");
			};
			
	        var sOut = "<table class='detailTable' id=\"childTable_" + table_id + "\">";
	        sOut += "<thead><tr>";
	        for (var header in options.detailTableInfo){
	        	sOut+="<th>"+options.detailTableInfo[header]+"</th>";
	        }
	        sOut += "</tr></thead><tbody>";
	        for (var i in html){
	        	var index = parseInt(i)+1;
	        	sOut+="<tr><td>"+index+"</td>";
	        	for (var j in options.detailTableMapping){
	        		sOut+="<td>"+getValue(html[i],options.detailTableMapping[j])+"</td>";
	        	}
	        	if (options.editDetail){
	        		var hasAction = false;
	        		if (actionCheckText != ""){
	        			for (var id in actionvalues){
	        				if (html[i][actionCheckText]+"" === actionvalues[id]){
	        					hasAction = true;
	        				}
	        			}
	        		}else{
	        			hasAction = true;
	        		}
	        		
	        		if (hasAction){
	        			sOut+="<td class='actions'><a href="+options.editDetail+"?id="+html[i]["id"]+" class='iconButton' target='_blank'><i class='"+actionIcon+"'></i></a></td>";
	        		}else{
	        			sOut+="<td></td>";
	        		}
	        	}
	        	sOut+="</tr>";
	        }
	        sOut += "</tbody></table>";
	        return sOut;
	    };
	    
	    var getValue = function(json,path){
	    	//get type of path
	    	var type=path.indexOf('[') >0 ? path.substring(path.indexOf('[')): "",
	    	//get value first
	    	paths=path.replace(type,'').split("."),
	    	value = json;
	    	for (var i in paths){
	    		if (value){
	    			if (paths[i].charAt(paths[i].length-1) == "*"){
	    				value = value[paths[i].substring(0, paths[i].length-1)];
	    				value = showMessage(value);
	    			}else{
	    				value = value[paths[i]];
	    			}
	    			
	    		}
	    	};
	    	//check type
	    	if (value && type == "[Date]"){
	    		value =(new Date(value)).toLocaleDateString("vn");
	    	}
	    	
	    	if (value && type == "[Key]"){
	    		value = showMessage(value);
	    	}
	    	
	    	if (value && type == "[money]"){
	    		value = accounting.formatMoney(value,UTIL.MONEY_STYLE);
	    	}
	    	
	    	if (!value){
	    		value = "";
	    	}
	    	return value;
	    };	    	   
	    
        // fire up the plugin!
        // call the "constructor" method
        plugin.init();
    };

    // add the plugin to the jQuery.fn object
    $.fn.nestedTable = function(options) {
        // iterate through the DOM elements we are attaching the plugin to
        return this.each(function() {
            // if plugin has not already been attached to the element
            if (undefined == $(this).data('nestedTable')) {
                var plugin = new $.nestedTable(this, options);
                $(this).data('nestedTable', plugin);
            }
        });

    };
})(jQuery);
