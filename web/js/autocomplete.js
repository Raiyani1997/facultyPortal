$(document).ready(function(){
	$('.facultynm').autocomplete({
		source:"contract_completer",
		select: function(event,ui){
			$('.facultynm').val(ui.item.value);
		}
	});
});