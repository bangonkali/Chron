function getCharArrayFromString(msg) {
	result = new Array();
	msglenthd = msg.length;
	for (yd=1; yd<msglenthd+1; yd++) {
		result[yd]=parseInt(msg.charCodeAt(yd-1),10);
	}
	result[0]=0;
	return result;
}

x = getCharArrayFromString("Hello world!");
console.log(x);