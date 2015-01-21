$(document).ready(function () {
	
	// variables
	var intervalId;

	// clear $(".main-content").html() if loading search results
	// $.methods.search was NOT defined
	if($('#blog-search-text').val() && $('#blog-search-text').val() != 'undefined'){
		$(".main-content").html('');
	}

	// bind actions
    $(".styleSwitch").unbind('click').bind('click', function (e)  {
        var styleSheet = staticCss + $(this).attr('title').toLowerCase() + '.min.css';
        setCookie('styleSheet', styleSheet, "Thu, 31 Dec 2099 12:00:00 UTC;", "/");
        setStyleSheet();
    });

	$('#blog-search-text').unbind('keyup').bind('keyup', function (e) {
		
		if (!(e.which >= 46 && e.which <= 90 || e.which >= 96 && e.which <= 105 || e.which == 8 || e.which == 13)) {
			return;
		}
		
		var text = $(this).val();
		clearInterval(intervalId);
		
		if (e.which == 13) {
			$.methods.search(text);
		} else {
			intervalId = setTimeout(function () {
				$.methods.search(text);
			}, 500);
		}
	});
	
	// JQuery methods
	$.methods = {
		
		addLoader: function () {
			// add loader here
		},
		
		removeLoader: function () {
			// remove loader here
		},
		
		// $.methods.addLoader and  $.methods.removeLoader was defined
		search: function (text) {
			$.postsResponse = $.ajax({

				type: "POST",
				url: "/blog/search/",
				dataType: "json",
				async: true,

				data: {
					'text':text,
					'csrfmiddlewaretoken':csrf
				},
				
				beforeSend: function () {
					$.methods.addLoader();
				},
				
				success: function (data) {
					if (data.status === 'ok') {
						$(".main-content").html(
							" <h1>" + data.text + 
							" <small>search results</small></h1>" + data.content);
						$("#pagination").html(data.pager);
						$.methods.removeLoader();
					}
					$.postsResponse = null;
				}
			});
		},
	};
	// $.methods.search was defined and #blog-search-text has text
	if($('#blog-search-text').val() && $('#blog-search-text').val() != 'undefined'){
		$.methods.search($('#blog-search-text').val());
	}

});

////////////////////////////////
// @todo move it to $.methods //
////////////////////////////////

function setStyleSheet() {
    styleSheet = getCookie('styleSheet');
    if (styleSheet) $('#styleSheet').attr('href', styleSheet);
}

function getCookie(name) {
    var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function setCookie(name, value, expires, path, domain, secure) {	// Send a cookie
    expires instanceof Date ? expires = expires.toGMTString() : typeof(expires) == 'number' && (expires = (new Date(+(new Date) + expires * 1e3)).toGMTString());
    var r = [name + "=" + escape(value)], s, i;
    for (i in s = {expires: expires, path: path, domain: domain}) {
        s[i] && r.push(i + "=" + s[i]);
    }
    return secure && r.push("secure"), document.cookie = r.join(";"), true;
}
