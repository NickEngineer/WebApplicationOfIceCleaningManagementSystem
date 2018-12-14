var angle = 0;
var speedOfRounding = 0;
var deviceStatus = false
//var csrf_token = '<%= token_value %>';
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var temp1Global = "";


$(document).ready(function () {
    addDeviceNameToTitle();

    addAjaxFunctionXCSRFTokenHandler();

    rotateFanImage();

    sliderForPower();

    onAndOffDevice();

    $(function () {
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });

    updateTemp1();
});


function addDeviceNameToTitle() {
    var deviceName = $("#deviceName").attr('value');
    $("#deviceNameTitle").html(deviceName);
}

function rotateFanImage() {
    setInterval(function () {
        if (deviceStatus) {
            angle += speedOfRounding;
            $("#fanImage").css({
                transform: 'rotate(' + angle + 'deg)'
            });
        }
    }, 100);
}

function sliderForPower() {
    $(document).ready(function () {
        $("#slider").slider({
            value: 1,
            min: 1,
            max: 100,
            step: 1,
            create: function (event, ui) {
                val = $("#slider").slider("value");
                $("#contentSlider").html(val);
            },
            slide: function (event, ui) {
                $("#contentSlider").html(ui.value);
                speedOfRounding = ui.value;

                var query = "2n1n" + speedOfRounding;
                sendInformationToDeviceTest(query);
            }
        });
    });
}

function onAndOffDevice() {

    $('.statusImage').bind('click', function () {
        if (deviceStatus) {
            var newId = "off";
            var newImageOff = "/managesyst.com/resources/photos/on.png";
            setNewStatusImage(newImageOff, newId);
            deviceStatus = false;

            var query = "2n2n" + speedOfRounding;
            sendInformationToDeviceTest(query);

        } else {
            var newId = "on";
            var newImageOn = "/managesyst.com/resources/photos/off.png";
            setNewStatusImage(newImageOn, newId);
            deviceStatus = true;

            var query = "2n1n" + speedOfRounding;
            sendInformationToDeviceTest(query);
        }
    });
}

function setNewStatusImage(newSrc, newId) {
    $('.statusImage').attr("src", newSrc);
    $('.statusImage').attr("id", newId);
}

function getIngormationFromDevice() {

}

function sendPowerModeToDevice() {

}

function turnOnDevice() {

}

function turnOffDevice() {

}

function sendInformationToDeviceTest(query) {

    var request = {};
    request["query"] = $("#changeMode").attr("value");


    var user;


    $.ajax({
        url: '/managesyst.com/private-cabinet/smart-ventilation/smart-device/execute-query/todevice',
        type: "POST",
        data: {
            query: String(query)
        },
        dataType: 'json',
        success: function (msg) {

            temp1Global = msg.temp1;
        }

    });


    function onAjaxSuccess(data) {

        alert(data);
    }

}

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}


function addAjaxFunctionXCSRFTokenHandler() {
    $("body").bind("ajaxSend", function (elm, xhr, s) {
        if (s.type == "POST") {
            xhr.setRequestHeader('X-CSRF-Token', csrf_token);
        }
    });
}

function updateTemp1() {
    setInterval(function () {

        if (deviceStatus) {

            var query = "2n1n" + speedOfRounding;
            sendInformationToDeviceTest(query);

            $("#temp1").html("Temp1: " + temp1Global + " C");
        }


    }, 1000);
}

