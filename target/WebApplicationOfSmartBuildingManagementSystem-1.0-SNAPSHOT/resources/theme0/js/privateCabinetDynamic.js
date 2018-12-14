var angle = 0;
setInterval(function () {
    angle += 1;
    $("#rounding").css({
        transform: 'rotate(' + angle + 'deg)'
    });

}, 100);