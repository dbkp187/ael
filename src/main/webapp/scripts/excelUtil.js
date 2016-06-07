var EXCEL = function(data){
	this.data=data;
	this.file=$("#"+data.file);
	this.X = XLS;
	this.init();
};

EXCEL.prototype={
		init:function(){
			var that=this;
			$(this.file).on("change",function(e){
				that._handleFile(e);
			});
		},
		_fixdata: function(data) {
			var o = "", l = 0, w = 10240;
			for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint8Array(data.slice(l*w,l*w+w)));
			o+=String.fromCharCode.apply(null, new Uint8Array(data.slice(l*w)));
			return o;
		},
		_to_json : function(workbook) {
			var result = {}, that=this;
			workbook.SheetNames.forEach(function(sheetName) {
				var roa = that.X.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
				if(roa.length > 0){
					result[sheetName] = roa;
				}
			});
			return result;
		},
		_to_csv: function(workbook) {
			var result = [], that=this;
			workbook.SheetNames.forEach(function(sheetName) {
				var csv = that.X.utils.sheet_to_csv(workbook.Sheets[sheetName]);
				if(csv.length > 0){
					result.push("SHEET: " + sheetName);
					result.push("");
					result.push(csv);
				}
			});
			return result.join("\n");
		},
		_process_wb: function(wb) {
			if (this.data.type == "json"){
				this.output = this._to_json(wb);
			}else{
				this.output = this._to_csv(wb);
			}
			$(this.file).trigger("readed",this.output);
		},
		_handleFile :function(e) {
			var files = e.target.files;
			var f = files[0], that=this;
			{
				var reader = new FileReader();
				var name = f.name;
				reader.onload = function(e) {
					var data = e.target.result;
					var arr = that._fixdata(data);
					wb = that.X.read(btoa(arr), {type: 'base64'});
					that._process_wb(wb);
				}
				reader.readAsArrayBuffer(f);
			}
		}
		
};