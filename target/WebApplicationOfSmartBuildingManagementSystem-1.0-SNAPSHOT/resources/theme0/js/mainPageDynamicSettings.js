var angleStart = -360;

// jquery rotate animation
function rotate(li, d) {
    $({d: angleStart}).animate({d: d}, {
        step: function (now) {
            $(li)
                .css({transform: 'rotate(' + now + 'deg)'})
                .find('label')
                .css({transform: 'rotate(' + (-now) + 'deg)'});
        }, duration: 5
    });
}

// show / hide the options
function toggleOptions(s) {
    $(s).toggleClass('open');
    var li = $(s).find('li');
    var deg = $(s).hasClass('half') ? 180 / (li.length - 1) : 360 / li.length;
    for (var i = 0; i < li.length; i++) {
        var d = $(s).hasClass('half') ? (i * deg) - 90 : i * deg;
        $(s).hasClass('open') ? rotate(li[i], d) : rotate(li[i], angleStart);
    }
}


$(document).on('click', '.nextStep', function () {
    switch ($(this).attr('id')) {
        case '1L':
            setTimeout(function () {
                var url = window.location.pathname + 'validate';
                $(location).attr('href', url);
            }, 200);
            break;
        case '2L':
            setTimeout(function () {
                var url = window.location.pathname + 'registration';
                $(location).attr('href', url);
            }, 200);
            break;
        case '3L':
            setTimeout(function () {
                var url = window.location.pathname + 'about';
                $(location).attr('href', url);
            }, 200);
            break;
    }
});

$(document).on('click', '.selector button', function () {
    $(this).css('background-color', '#80ff80');
    $(this).css('color', '#000000');
});

setTimeout(function () {
    toggleOptions('.selector');
}, 100);

var angle = 0;
setInterval(function () {
    angle += 3;
    $("#rounding").css({
        transform: 'rotate(' + angle + 'deg)'
    });

}, 40);