var angle = 0;
setInterval(function () {
    angle += 3;
    $("#rounding").css({
        transform: 'rotate(' + angle + 'deg)'
    });

}, 40);