$(document).ready(function(){

	if ($(".comments").length){
    var $request = $.ajax({
    	method: "GET",
    	url: $('.discussion-link').children()[0].href
    });

    $request.done(function(response){
    	$(".comments").empty()
      $(".comments").append(response)
    })
	}

	$(".comments").on("click" ,".comment-link" ,function(event){
		event.preventDefault();
    var $request = $.ajax({
    	method: "GET",
    	url: $(this)[0].href
    });

    $request.done(function(response){
    	
    	$(".new-comment h4").hide()
    	$(".new-comment").append(response)
    
    })
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

	$('.comments').on("submit", ".new_comment", function(event){
		event.preventDefault();
    var content = $(this).find(".mytextarea").val()
		var $request = $.ajax({
			method: "POST",
			url: $(this)[0].action,
			data: {comment: {content: content}}
		});

		$request.done(function(response){
			$(".new-text").remove()
			$(".new-comment h4").show()

			$(".comments-container").append(response)
		
		});

	})
});