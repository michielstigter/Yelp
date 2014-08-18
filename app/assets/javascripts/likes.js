$(document).ready(function(){
	$('.like-link').on('click', function(event) {
		var likesCount = $(this).siblings('.likes_count')
		event.preventDefault();
		$.post(this.href, function(response) {
			likesCount.text(response.new_like_count);
		});
	})
})