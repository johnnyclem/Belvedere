$(document).ready(function() {
$('a.remote-delete').click(function() {
if(confirm("This Will Delete All Of Your Footage And Project Data, Are You Sure?")){
$.post(this.href, { _method: 'delete' }, null, "script");
location.reload();
return false;
} else {
	return false;
}	
});
$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-confirm" ).dialog({
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Delete all items": function() {
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			}
		});	
});
