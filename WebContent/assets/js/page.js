function hideContent(d) {
	document.getElementById(d).style.display = "none";
}

function showContent(d) {
	document.getElementById(d).style.display = "block";
}

function reverseDisplay(d) {
	// if(document.getElementById(d).style.display == "none"), and then check whether "inline". Weird!
	if(document.getElementById(d).style.display == "block") { 
		document.getElementById(d).style.display = "none"; 
	}
	else { 
		document.getElementById(d).style.display = "block"; 
	}
}

function ReverseDisplay(c) {
	// if(document.getElementById(d).style.display == "none"), is the same
	if(document.getElementById(c).style.display == "block") { 
		document.getElementById(c).style.display = "none"; 
	}
	else { 
		document.getElementById(c).style.display = "block"; 
	}
}