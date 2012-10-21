var HID = require('HID.node');
var devices = HID.devices();
var mydevice;
var F = new Array();

if (!(typeof devices[0] === "undefined")){
	console.log(devices[0]['path']);
} else {
	console.log('Device does not exist.');
}