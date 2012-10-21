var HID = require('HID.node');
var devices = HID.devices();
var mydevice;
var readtimes = 0;

if (!(typeof devices[0] === "undefined")){
	mydevice = new HID.HID(devices[0]['path']);
	if (typeof mydevice === "undefined") {
		console.log("undefined device");
	} else {
		async_read();
		console.log('async read begin');
	}
} else {
	console.log('USB NOT PLUGGED IN');
}

function read(error, data) {
	if (readtimes > 10) {
		return;
	}
	readtimes++;
	console.log(readtimes, "data length", data.length);
	console.log(data);
	mydevice.write([0x00, 0x01, 0x01, 0x05, 0xff, 0xff]);
	async_read();
}

function async_read() {
	mydevice.read(function(error, data) {
		console.log('read complete');
		if (error) {
			console.log(error);
			return;
		} else {
			read(error, data);
		}
	});
}