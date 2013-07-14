/**
 * ExpressionEngine Page Helper Accessory
 *
 * Helps users generate a Pages Module URI by allowing them to generate a Page URI by selecting a parent page
 * and automatically pulling the URL Title from the entry.
 *
 * @package		Page Helper
 * @author		Conflux Group, Inc. <support@confluxgroup.com>
 * @link		http://confluxgroup.com
 * @addon link	http://devot-ee.com/add-ons/page-helper/
 * @copyright 	Copyright (c) 2010 Conflux Group, Inc.
 * @license   	http://confluxgroup.com/addons/license.txt
 */
$(document).ready(function (){
	
	
	// Find the Pages URI text field in the DOM and store a reference to it
	var uri_field = $("#pages_uri");
	
	// Fix for EE Build 20101215, where Pages URI field ID changed.
	if(uri_field.length == 0)
	{
		uri_field = $("#pages__pages_uri");
	}
	
	// See if there is no value (or the example text) in the Pages URI field. 
	// If there is, don't do anything, since we don't want to mess with existing URIs.
	if(uri_field.val() == "" || uri_field.val() == "/example/pages/uri/")
	{
		// Find the URL Title text field in the DOM and store a reference to it.
		var url_title_field = $("#url_title");
	
		// Add an instructional paragraph before the <fieldset> containing the Pages URI text field
		uri_field.parent().before('<div class="instruction_text"><p><strong>Instructions:</strong>&nbsp;Select the page\'s category. Leave if not in any category.</p></div>');
		
		// Find the generated Pages <select> menu from the Page Helper accessory tab in the DOM and store
		// a reference to it.
		var pages_dropdown = $("#pages_dropdown");
		
		// Store the HTML of the Pages <select> menu.
		var pages_dropdown_html = pages_dropdown.html();
		
		// Remove the Page Helper accessory tab from the DOM.
		$("#accessoryTabs a.pagehelper").parent().remove();
		
		// Add the Pages <select> menu,the new Page URL Title text field, and the Generate Page URL
		// button before the Pages URI text field.
		uri_field.before('<select id="pages_dropdown">' + pages_dropdown_html + "</select>");
		uri_field.before('<input style="display: none;" type="text" id="page_url_title">');
		uri_field.before('<input style="display:none;" type="button" id="generate_uri" class="submit" value="Generate Page URL">');
		// Bind the Keyup event of the URL Title text field to update the Page URL Title text field.
		url_title_field.keyup(function (){
			$("#page_url_title").val(url_title_field.val());
		});
	
		// Bind the Keyup event of the Title text field to update the Page URL Title text field.
		$("#title").keyup(function (){
			$("#page_url_title").val(url_title_field.val());

			// Find the two needed fields in the DOM and store references to them.
			page_url_title_field = $("#page_url_title");
			pages_dropdown = $("#pages_dropdown");
			
			// Create a new_uri string containing the two field values joined by a slash.
			var new_uri = pages_dropdown.val() + '/' + page_url_title_field.val();
			
			// Replace any double slashes with a single slash.
			while(new_uri.indexOf('//') != -1)
			{
				new_uri = new_uri.replace('//', '/');
			}
			
			// Update the Pages URI text field with the newly generated URI.
			uri_field.val(new_uri);

		});
		
		$('#pages_dropdown').change(function(){
			// Find the two needed fields in the DOM and store references to them.
			page_url_title_field = $("#page_url_title");
			pages_dropdown = $("#pages_dropdown");
			
			// Create a new_uri string containing the two field values joined by a slash.
			var new_uri = pages_dropdown.val() + '/' + page_url_title_field.val();
			
			// Replace any double slashes with a single slash.
			while(new_uri.indexOf('//') != -1)
			{
				new_uri = new_uri.replace('//', '/');
			}
			
				if($(this).val() == '/gardening'){
					$('#status').val('gardening');
				}
				if($(this).val() == '/car-washing'){
					$('#status').val('car-washing');
				}
				if($(this).val() == '/cleaning'){
					$('#status').val('cleaning');
				}
				if($(this).val() == '/grandmas-pantry'){
					$('#status').val('grandmas-pantry');
				}
				if($(this).val() == ''){
					$('#status').val('open');
				}
				
			// Update the Pages URI text field with the newly generated URI.
			uri_field.val(new_uri);
		});
		
		// Bind the click event of the Generate Page URL button to assemble the two pieces of the new
		// URL, remove any double slashes and place the value in the Pages URI text field.
		$("#generate_uri").click(function(){
		
			// Find the two needed fields in the DOM and store references to them.
			page_url_title_field = $("#page_url_title");
			pages_dropdown = $("#pages_dropdown");
			
			// Create a new_uri string containing the two field values joined by a slash.
			var new_uri = pages_dropdown.val() + '/' + page_url_title_field.val();
			
			// Replace any double slashes with a single slash.
			while(new_uri.indexOf('//') != -1)
			{
				new_uri = new_uri.replace('//', '/');
			}
			
			// Update the Pages URI text field with the newly generated URI.
			uri_field.val(new_uri);
			
		});
		
		
	
	} // End of if(uri_field.val() == "" || uri_field.val() == "/example/pages/uri/")
/*		$('#pages_dropdown option').each(function(){
			if($(this).val() == '' || $(this).val() == '/gardening' || $(this).val() == '/car-washing' || $(this).val() == '/cleaning' || $(this).val() == '/grandmas-pantry' || $(this).val() == 'select a parent'){
				if($(this).val() == '/gardening'){
					$(this).html('Gardening');
				}
				if($(this).val() == '/car-washing'){
					$(this).html('Car Washing');
				}
				if($(this).val() == '/cleaning'){
					$(this).html('Cleaning');
				}
				if($(this).val() == '/grandmas-pantry'){
					$(this).html('Grandma\s Pantry');
				}
				if($(this).html() == '/ (No Parent)'){
					$(this).html('No Parent');
				}
			} else{
				$(this).remove();
			}
		});*/
}); // End of $(document).ready(function () {});