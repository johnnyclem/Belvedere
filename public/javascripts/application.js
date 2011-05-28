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
});