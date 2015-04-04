jQuery ->
	### form is inactive on initial page load therefore form_active = false ### 
	form_active = false

	### showUpdateForm loads the edit form via AJAX get request
	 appends retrieved data to the container div
	 hides the row of data being edited 

				if ($('form.edit_post').length = 1)
				for i in [0...4]

	###
	showForm = (target, selector_css) ->
		$.get 'mats/' + target, (data) ->
			$(selector_css[0]).append data
			$(selector_css[1]).hide()

	updateFormActive = (target, selector_css) -> 
		if (!form_active)
			form_active = true
			return showForm(target, selector_css)
		else if ($('form.new_mat').length = 1)
			active_id = $('div.form_uni').attr("data-id")
			$('form.edit_mat').remove()
			$('tr.m' + active_id).show()
			return showForm(target, selector_css)

	 
	###	directions available ->
			(true)Top: -$(document).height() 
			(false)Bottom: $(document).height() 
	###
	scrollWhere = (direction) ->
		return $("html, body").animate({ 
			scrollTop: 
				if direction then -$(document).height() else $(document).height() 
			})
			

	$('a.new_mat').click ->
		showForm("new", ["#add_material", "a.new_mat"])
		scrollWhere(false)

	$('a.edit_mat').click ->
		updateFormActive(this.id + "/edit", ["#form", ""])
		scrollWhere(true)