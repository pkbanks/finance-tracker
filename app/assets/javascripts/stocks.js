var init_stock_lookup = function(){
	console.log("stock lookup")
	$('#stock-lookup-form').on("ajax:success", function(event, data, status){
		console.log("form ajax success");
		$('#stock-lookup').replaceWith(data);
		init_stock_lookup();
	})
}

$(document).ready(function(){
	console.log("document ready")
	init_stock_lookup();
})