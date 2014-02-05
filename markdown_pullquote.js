__when = function(condition, callback, interval){
		 if (!condition){
          setTimeout(function(){ __when(condition,callback,interval);},interval);
		 }else{
		    callback();
		 }
};
selection_to_markdown = function(){
   var dlg = document.getElementById('__dlg');
   if (dlg == null){
	   dlg = document.createElement('div');
   	dlg.id = "__dlg";
   	document.body.appendChild(dlg);
   	dlg.innerHTML = "<textarea id='__ta' width='80' height='25' style='width:100%;height: 200px;background:black;color:yellow;'></textarea>";
   }
   var ws = window.getSelection;
   var ds = document.getSelection;
   var dss = document.selection;
   var sel = ( ws ? ws() : (ds) ? ds() : (dss?dss.createRange().text:0) );
   sel = sel.toString();
   var filled = fill_text(sel);
   var quoted = markdown_quote(filled);
   rc=prompt("refcode(e.g.'1'","")
   quoted = quoted + "  \n> -- [" + document.title + "][" + rc + "]\n\n[" + rc + "]: " + location.href;
   var ta = document.getElementById('__ta');
   ta.value = quoted;
};

tools_loaded = function(){	return typeof(fill_text) != "undefined";}
__when(tools_loaded,selection_to_markdown,3);

