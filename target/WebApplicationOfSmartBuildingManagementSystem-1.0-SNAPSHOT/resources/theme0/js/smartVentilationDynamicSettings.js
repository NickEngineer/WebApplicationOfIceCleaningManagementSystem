jQuery(document).ready(function () {

    $('.openDeviceLink').bind('click', function () {

        var userId = $(this).parent().children('.userId').attr('value');
        var deviceIp = $(this).parent().children('.deviceIp').attr('value');
        var deviceName = $(this).parent().children('.deviceNameShell').children('.deviceName').html();

        addUserIdToForm(userId);
        addDeviceIpToForm(deviceIp);
        addDeviceModelToForm(deviceName);

        sendForm();
    });
});

function addUserIdToForm(userId) {
    $('#userId').val(userId);
}

function addDeviceIpToForm(deviceIp) {
    $('#deviceIp').val(deviceIp);
}

function addDeviceModelToForm(deviceName) {
    $('#deviceName').val(deviceName);
}

function sendForm() {
    $('#sendForm').trigger('click');
}