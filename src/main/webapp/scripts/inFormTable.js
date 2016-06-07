// jQuery Plugin Boilerplate
// A boilerplate for jumpstarting jQuery plugins development
// version 1.1, May 14th, 2011
// by Stefan Gabos

(function($) {

    $.inFormTable = function(element, options) {

        var defaults = {
            afterRemoveRow: function() {},
            beforeRemoveRow: function(){},
            beforeAddRow: function(){},
            afterAddRow: function(){},
            unRemoveRow: function(){}            
        };

        var plugin = this;

        plugin.settings = {}

        plugin.init = function() {
            plugin.settings = $.extend({}, defaults, options);
            // code goes here
            this.comps = {};
            this.table = $("#"+options.tableId);
    		this._loadAddButton();
    		this.addRemoveButtonHandler();
        };

        /**
    	 * Add new row to table based on @tableId
    	 * It will copy current content of last row of @tableId table, 
    	 * change its index and add it into that table as a new row.
    	 * So, the table must contain at least 1 row for running adding action
    	 */
        plugin.addRow		= function()
    	{
    		//get table object
    		var table = $(this.table);
    		plugin.settings.beforeAddRow();
    		//find last row
    		var lastTr = this._findLastDataRow(table,true).row;
    		if ($(lastTr).hasClass("hidden")){
    			this._refreshDataRow(0, lastTr,true);
    			$(table).trigger("afterAddRow",lastTr);
    		}else{
    			var newRolNum = parseInt($(lastTr).find("td[colType='index']").first().html()) + 1;
    			//add new row with the same content as last row
    			$(lastTr).parent().append("<tr>"+$(lastTr).html()+"</tr>");
    			//reload last tr component
    			lastTr = $(table).find('tr').last();
    			//No. col
    			$(lastTr).find("td[colType='index']").first().html(newRolNum);
    			//count current data rows in table
    			var numOfRow = table.find("tr").length - table.find("thead").find("tr").length-1;
    			//reset added row content
    			this._refreshDataRow(numOfRow, lastTr,true);
    			// active remove buttons
    			this._addRemoveButtonHandler($(lastTr));
//    			this._activeAllRemoveButton();
    			plugin.settings.afterAddRow(lastTr);
    			formmatRow(lastTr);
    			$(table).trigger("afterAddRow",lastTr);
    			return lastTr;
    		}
    		
    	};
    	
    	/**
    	 * Format data displaying
    	 */
    	var formmatRow = function(lastTr){
    		SELECT_CONTROL.init(lastTr);
			$(lastTr).find("input.money").on("blur",function(){
				$(this).val(accounting.formatMoney($(this).val(),UTIL.MONEY_STYLE)); 
			});
			
			$(lastTr).find("input.money2").on("blur",function(){
				$(this).val(accounting.formatMoney($(this).val(),UTIL.MONEY_STYLE_2_DIGIT)); 
			});
			
			$(lastTr).find("input.number").on("blur",function(){
				$(this).val(accounting.formatMoney($(this).val(),UTIL.NUMBER_STYLE)); 
			});
			
			$(lastTr).find('[provide="datepicker"]').datepicker({
				format: "dd/mm/yyyy"
			});
			
			$('[provide="ddatepicker"]').datepicker({
				format: "dd/mm/yyyy",
			});
    	};
    	
    	/**
    	 * Change index of the @row to @newIndex, empty its value if @isEmptyValue is true
    	 * @param newIndex
    	 * @param row
    	 * @param isEmptyValue
    	 */
    	plugin._refreshDataRow		= function(newIndex,row,isEmptyValue)
    	{
    		//get list input
    		$(row).removeClass("hidden");
    		$(row).find("input[valueType='added']").val("false");
    		var newRowInputs = $(row).find("input");
    		
    		//select2
    		if (newIndex >0){
    			$(row).find("select").each(function(){
        			$(this).show();
        			var select = $(this).get(0).outerHTML;
        			$(this).parent().html(select);
        		});
    		}
    		
    		newRowInputs = newRowInputs.add($(row).find("select"));
    		for (var i=0 ; i<newRowInputs.length;++i){
    			var input = $(newRowInputs[i]);
    			//get name attribute
    			var name = input.attr("name");
    			//find subscript in name
    			if (name)
    				{
    					var startIndex = name.lastIndexOf('[');
    					var endIndex = name.lastIndexOf(']');
    					//change subscript to @newIndex
    					var id = name.substring(0,startIndex)+(newIndex)+name.substring(endIndex+1);
    					id = id.replace('[','').replace(']','');
    					name = name.substring(0,startIndex+1)+(newIndex)+name.substring(endIndex);
    					input.attr("name",name);
    					input.attr("id",id);
    					if (!$(input).hasClass("readonly")){
    						$(input).attr("readonly",false);
    					}
    				}
    			//empty this row value if necessary
    			if (isEmptyValue == true)
    				{
    					var emptyOnAdd = $(input).attr("empty-on-add");
    					if (!emptyOnAdd || !emptyOnAdd.match("false"))
    						{
    							input.attr("value","");
    						}
    					if ($(input).parent().attr("defaultValue") != undefined){
    						input.val($(input).parent().attr("defaultValue"));
    					}
    				}
    		}
    	};
    	
    	plugin._loadAddButton	= function()
    	{
    		var that = this;
    		this.comps.addButton = $("[target-table='"+options.tableId+"']");
    		$(this.comps.addButton).on('click', function(){
    			that.addRow();
    		});
    	},
    	/**
    	 * Find last @tr object which cotains @td object in @table table
    	 * @param table
    	 * @returns
    	 */
    	plugin._findLastDataRow	= function(table)
    	{
    		var rowList = $(table).find("tr");
    		
    		for (var i=rowList.length - 1 ;i>=0;--i)
    			{
    				if ($(rowList[i]).find('th').length == 0 )
    					{
    						break;
    					}
    			}
    		
    		if (i>0)
    			{
    				return {row:rowList[i],index:i};
    			}
    		return {row:null,index:-1};
    	};
    	/**
    	 * Remove button for each row
    	 * @param row
    	 */
    	plugin._addRemoveButtonHandler	= function(row)
    	{
    		var that = this;
    		$(row).find(".removeRow").each(function(idx){
    			$(this).on('click', function(){
    				that._toogleRemove(row);
    			});
    		});
    	};
    	/**
    	 * Remove the @tr object which contain @td object in @tableId 
    	 * table if there are currently more than one existing row in the table
    	 * @param td
    	 * @param tableId
    	 * @returns
    	 */
    	plugin._toogleRemove	= function(row,atLeast1Row)
    	{
    		//get table object
    		var table = $(this.table);
    		//find first data row
    		var newRowInputs = $(row).find("input");
    		newRowInputs = newRowInputs.add($(row).find("select"));
    		
    		if ($(row).find("input[valueType='deleted']").val() == "true"){
    			
    			$(row).find("input[valueType='deleted']").val("false");
    			$(row).removeClass("removed");
    			for (var i=0 ; i<newRowInputs.length;++i){
    				if (!$(newRowInputs[i]).hasClass("readonly")){
    					if ($(newRowInputs[i]).is("select")){
    						$(newRowInputs[i]).select2("readonly",false);
    					}else{
    						$(newRowInputs[i]).attr("readonly",false);
    					}
    				}
    			}
    			$(table).trigger('unRemoveRow',[row,table]);
    		}else{
    			$(table).trigger('beforeRemoveRow',[row,table]);
    			$(row).find("input[valueType='deleted']").val("true");
    			
    			for (var i=0 ; i<newRowInputs.length;++i){
    				if ($(newRowInputs[i]).attr("valueType") != "deleted"){
    					if ($(newRowInputs[i]).is("select")){
    						$(newRowInputs[i]).select2("readonly",true);
    					}else{
    						$(newRowInputs[i]).attr("readonly",true);
    					}
    				}
    				
    			}
    			$(row).addClass("removed");
    			$(table).trigger('afterRemoveRow',[row,table]);
    		}
    		
    	};
    	/**
    	 * Add event handler for all remove button
    	 */
    	plugin.addRemoveButtonHandler	= function()
    	{
    		var that = this;
    		$(that.table).find("tr").each(function(idx){
//    			if (idx >0)
//    				{
    					that._addRemoveButtonHandler($(this));
//    				}
    		});
    	};

        plugin.init();
    };

    $.fn.inFormTable = function(options) {

        return this.each(function() {
            if (undefined == $(this).data('inFormTable')) {
                var plugin = new $.inFormTable(this, options);
                $(this).data('inFormTable', plugin);
            }
        });

    }

})(jQuery);