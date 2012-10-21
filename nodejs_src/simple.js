var HID = require('HID.node');
var devices = HID.devices();
var mydevice;
var values = new Array();
var count = 0;

for (x=0;x<64;x++)
	values[x] = x;

if (!(typeof devices[0] === "undefined")){
	var devicepath = '';
	for (var key in devices) {
		if (
			devices[key]['manufacturer'] == 'Mindanao State University - Iligan Institute of Technology' && 
			devices[key]['product'] == 'Hardware Cron Device'
			) {
			devicepath = devices[key]['path'];
			mydevice = new HID.HID(devicepath);
			break;
			console.log ('found');
			
		} else {
			console.log ('not found');
		}
	}
	
	
	mydevice.write(getCharArrayFromString("Initial Message"));
	iterator();
} else {
	console.log('error');
}


function iterator() {
	mydevice.read(function(error, data) {
		if ((typeof error === "undefined")){
			console.log('array length =', data.length);
			//console.log(getStringFromCharArray(data));
			console.log(data);
			mydevice.write(getCharArrayFromString("Hello " + count));
			
			if (count < 20) {
				count++;
				iterator();
			} else {
				count = 0;
			}
			
		} else {
			console.log(error);
		}
	});
	
}

function getStringFromCharArray(msg) {
	result = "";
	for (x in msg) {
		result=result + "" + String.fromCharCode(msg[x]);
	}
	return result;
}

function getCharArrayFromString(msg) {
	result = new Array();
	msglenthd = msg.length;
	for (yd=1; yd<msglenthd+1; yd++) {
		result[yd]=parseInt(msg.charCodeAt(yd-1),10);
	}
	result[0]=0;
	return result;
}