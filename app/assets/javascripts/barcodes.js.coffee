$('input.decrease_amt_value').click ->
	new_val = $('input.amt_left').val-1
	$('input.amt_left').val new_val