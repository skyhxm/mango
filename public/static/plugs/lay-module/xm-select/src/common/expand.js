//拓展Array map方法
if (!Array.prototype.map) {
	Array.prototype.map = function(i, h) {
		var b, a, c, e = Object(this),
			f = e.length >>> 0;
		if (h) {
			b = h
		}
		a = new Array(f);
		c = 0;
		while (c < f) {
			var d, g;
			if (c in e) {
				d = e[c];
				g = i.call(b, d, c, e);
				a[c] = g
			}
			c++
		}
		return a
	}
};

//拓展Array foreach方法
if (!Array.prototype.forEach) {
	Array.prototype.forEach = function forEach(g, b) {
		var d, c;
		if (this == null) {
			throw new TypeError("this is null or not defined")
		}
		var f = Object(this);
		var a = f.length >>> 0;
		if (typeof g !== "function") {
			throw new TypeError(g + " is not a function")
		}
		if (arguments.length > 1) {
			d = b
		}
		c = 0;
		while (c < a) {
			var e;
			if (c in f) {
				e = f[c];
				g.call(d, e, c, f)
			}
			c++
		}
	}
};

//拓展Array filter方法
if (!Array.prototype.filter) {
	Array.prototype.filter = function(b) {
		if (this === void 0 || this === null) {
			throw new TypeError()
		}
		var f = Object(this);
		var a = f.length >>> 0;
		if (typeof b !== "function") {
			throw new TypeError()
		}
		var e = [];
		var d = arguments[1];
		for (var c = 0; c < a; c++) {
			if (c in f) {
				var g = f[c];
				if (b.call(d, g, c, f)) {
					e.push(g)
				}
			}
		}
		return e
	}
};

//拓展Array find方法
if (!Array.prototype.find) {
	Array.prototype.find = function(callback) {
		return callback && (this.filter(callback) || [])[0];
	};
}

//拓展Array findIndex方法
if (!Array.prototype.findIndex) {
	Array.prototype.findIndex = function(predicate) {
		var list = Object(this);
		var length = list.length >>> 0;
		var thisArg = arguments[1];
		var value;

		for (var i = 0; i < length; i++) {
			value = list[i];
			if (predicate.call(thisArg, value, i, list)) {
				return i;
			}
		}
		return -1;
	};
}
