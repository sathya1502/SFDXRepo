({
	getNumbers : function(component) {
        var numbersList = [];
        for(var i=0;i<=10;i++)
        {
            numbersList.push({value:i});
        }
		component.set("v.numbers",numbersList);
	}
})