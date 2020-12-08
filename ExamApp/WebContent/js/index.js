$(document).ready(function(){
	$('#btn-insert-questions').click(function(){
		$('#insert-form').toggle();
		$('#update-form').hide();
	});
	
	$('#close-insert-form').click(function(){
		$('#insert-form').toggle();
	});
	
	$('#btn-update-questions').click(function(){
		$('#update-form').toggle();
		$('#insert-form').hide();
	});
	
	$('#close-update-form').click(function(){
		$('#update-form').toggle();
	});
	
//	$("#btn-start-exam").hide();
});

