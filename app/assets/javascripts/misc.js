var session_refresh = setInterval( function() {  $("div.session_timer").load('/application/update_timer')  }, 8000 );

$("a.edit_materials").click(function() {
	$("a.edit_materials").getAttribute("data-id").slideUp();
});