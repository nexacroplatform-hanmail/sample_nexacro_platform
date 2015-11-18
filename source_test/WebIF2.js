if (! window.TOBEHTML) {
	window.TOBEHTML = {};
}

var parent = null;

window.TOBEHTML.Init = function() {


	var loopCnt = 0;
	var interval = setInterval(fn = function() {
	    parent = window.TOBEWEBBROWSER;
      if(loopCnt > 200 || parent) {
	      clearInterval(interval);
	    }
//console.log("Parent:" + loopCnt + ":" + parent.name);
		  loopCnt++;
	}, 50);
}

window.TOBEHTML.FireUserNotify = function(userdata) {
  if (parent) {
	  parent.$fire_onusernotify(parent, userdata);
	} else {
		window.document.title = userdata;
	}			
}