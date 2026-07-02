({
	getInput : function(cmp, event) {
        var fName= cmp.find("fname").get("v.value");
        var oName = cmp.find("oname");
        oName.set("v.value",fName);
        
		
	}
})