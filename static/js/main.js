$(document).ready(function () {

    $("body").on("click", "#styleSwitch", function () {
        var styleSheet = staticCss + $(this).attr('title').toLowerCase() + '.min.css';
        setCookie('styleSheet', styleSheet, "Thu, 31 Dec 2099 12:00:00 UTC;", "/");
        setStyleSheet();
    });

});

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