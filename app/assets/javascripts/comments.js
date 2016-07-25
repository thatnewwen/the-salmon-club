$(document).ready(function(){
	var $request = $.ajax({
		method: "GET",
		url: $('.discussion-link').children()[0].href
	});

	$request.done(function(response){
		$(".comments").empty()
	  $(".comments").append(response)
	})

	$('.discussion-link').on("click", function(event){
		event.preventDefault();
    
    var $request = $.ajax({
    	method: "GET",
    	url: $(this).children()[0].href
    });

    $request.done(function(response){
    	$(".comments").empty()
      $(".comments").append(response)
    })
	})
});