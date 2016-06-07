// jQuery Plugin Boilerplate
// A boilerplate for jumpstarting jQuery plugins development
// version 1.1, May 14th, 2011
// by Stefan Gabos

(function($) {

    $.inFormTableDeatil = function(element, options) {

        var defaults = {
            afterRemoveRow: function() {},
            beforeRemoveRow: function(){},
            beforeAddRow: function(){},
            afterAddRow: function(){}
            
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
    		var lastTr = this._findLastDataRow(table,true).row,
    		lastDetail = $(lastTr).next();
    		if ($(lastTr).hasClass("hidden")){
    			this._refreshDataRow(0, lastTr,true);
    			this._refreshDetailDataRow(0, lastDetail,true);
    		}else{
    			var newRolNum = parseInt($(lastTr).find("td[colType='index']").first().html()) + 1;
    			//add new row with the same content as last row
    			$(lastTr).parent().append("<tr>"+$(lastTr).html()+"</tr>");
    			//reload last tr component
    			lastTr = $(table).find('tr').last();
    			//No. col
    			$(lastTr).find("td[colType='index']").first().html(newRolNum);
    			//count current data rows in table
    			var numOfRow = newRolNum - 1;
    			//reset added row content
    			this._refreshDataRow(numOfRow, lastTr,true);
    			// active remove buttons
    			this._addRemoveButtonHandler($(lastTr));
    			plugin.settings.afterAddRow(lastTr);
    			formmatRow(lastTr);
    			this.addRowDetail(lastDetail,newRolNum,numOfRow);
    		}
    		$(table).trigger("afterAddRow",lastTr);
    		return lastTr;
    	};
    	
    	plugin.addRowDetail		= function(lastDetail,newRolNum,numOfRow){
    		var table = $(this.table), that = this, newIndex = newRolNum-1;
    		if ($(lastDetail).attr("colType") == "detail"){
    			//append to tr
    			//add new row with the same content as last row
    			$(lastDetail).parent().append("<tr colType='detail'>"+$(lastDetail).html()+"</tr>");
    			//reload last tr component
    			lastDetail = $(table).find('tr[colType="detail"]').last();
    			//change toogle button target
    			$(lastDetail).prev().find("button[data-toggle='collapse']").attr("data-target","#child"+newIndex);
    			//change collapse index
    			$(lastDetail).find(".collapse").attr("id","child"+newIndex);
    			$(lastDetail).find(".in").attr("id","child"+newIndex);
    			//remove other rows
    			var childTableTrs = $(lastDetail).find("table tbody tr");
    			childTableTrs.each(function(idx){
    				if (idx>0){
    					$(this).remove();
    				}
    				else{
    					that._refreshDetailDataRow(numOfRow,$(this),true);
    					formmatRow($(this));
    				}
    				
    			});
    			var newTableId = "childTable"+newIndex;
    			$(lastDetail).find("table").attr("id",newTableId);
    			$(lastDetail).find("span[target-table]").attr("target-table",newTableId);
    			$(lastDetail).find("table.inFormTable").inFormTable({
					tableId:newTableId
				});
    			
    			$(lastDetail).find("[aria-controls='home']").attr("href","#home"+newIndex);
    			$(lastDetail).find("[aria-controls='profile']").attr("href","#profile"+newIndex);
    			$(lastDetail).find("[role='tabpanel']").first().attr("id","home"+newIndex);
    			$(lastDetail).find("[role='tabpanel']").last().attr("id","profile"+newIndex);
    			$(lastDetail).find("table").last().attr("id",newTableId+"Summary");
    			
    			FEE_TABLE_CONTROL.init(newTableId);
    		}
    	};
    	
    	/**
    	 * Format data displaying
    	 */
    	var formmatRow = function(lastTr){
    		$(lastTr).find("select").select2();
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
    				}
    			//empty this row value if necessary
    			if (isEmptyValue == true)
    				{
    					var emptyOnAdd = $(input).attr("empty-on-add");
    					if (!emptyOnAdd || !emptyOnAdd.match("false"))
    						{
    							input.attr("value","");
    						}
    				}
    		}
    	};
    	
    	/**
    	 * Change index of the @row to @newIndex, empty its value if @isEmptyValue is true
    	 * @param newIndex
    	 * @param row
    	 * @param isEmptyValue
    	 */
    	plugin._refreshDetailDataRow		= function(newIndex,row,isEmptyValue)
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
    					var startIndex = name.indexOf('[');
    					var endIndex = name.indexOf(']');
    					//change subscript to @newIndex
    					var id = name.substring(0,startIndex)+(newIndex)+name.substring(endIndex+1);
    					id = id.replace('[','').replace(']','');
    					name = name.substring(0,startIndex+1)+(newIndex)+name.substring(endIndex);
    					input.attr("name",name);
    					input.attr("id",id);
    				}
    			//empty this row value if necessary
    			if (isEmptyValue == true)
    				{
    					var emptyOnAdd = $(input).attr("empty-on-add");
    					if (!emptyOnAdd || !emptyOnAdd.match("false"))
    						{
    							input.attr("value","");
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
    		var rowList = $(table).find("> tbody > tr");
    		
    		for (var i=rowList.length - 1 ;i>=0;--i)
    			{
    				if ($(rowList[i]).find('th').length == 0 && $(rowList[i]).attr("colType") !="detail")
    					{
    						break;
    					}
    			}
    		
    		if (i>=0)
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
    		$(that.table).find("tr.parent").each(function(idx){
//    			if (idx >0)
//    				{
    					that._addRemoveButtonHandler($(this));
//    				}
    		});
    	};

        plugin.init();
    };

    $.fn.inFormTableDeatil = function(options) {

        return this.each(function() {
            if (undefined == $(this).data('inFormTableDeatil')) {
                var plugin = new $.inFormTableDeatil(this, options);
                $(this).data('inFormTableDeatil', plugin);
            }
        });

    }

})(jQuery);