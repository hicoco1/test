<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function search() {
		$('#searchForm').valid();
	}

	function bindEventHandler() {
		$('#searchForm').validate({
			onfocusout: false,
			rules: {
				searchValue: {
					required: true,
					email : true
				}
			}, messages: {
				searchValue: {
					required: 'search value field is required.',
					maxlength: $.validator.format('Please enter no more than {0} characters.')
				}
			}, errorPlacement: function(error, element) {
				// do nothing
			}, invalidHandler: function(form, validator) {
				 var errors = validator.numberOfInvalids();
		         if (errors) {
		             alert(validator.errorList[0].message);
		             validator.errorList[0].element.focus();
		         }          
			}
		});
	}	

	// document on ready callback function
	$(function() {
		bindEventHandler();
	});
</script>

</head>
<body>
<h3>jQuery validation sample page</h3>
<form id="searchForm">
	<fieldset>
		<label for="searchValue">search value</label> 
		<input type="text" name="searchValue"/>
		<button type="button" onclick="search()">SEARCH</button>
		<button type="button" onclick="document.forms.searchForm.reset()">RESET</button>
	</fieldset>
</form>
</body>
</html>