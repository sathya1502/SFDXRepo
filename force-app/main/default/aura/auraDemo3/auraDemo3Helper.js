({
	helperMethod1 : function(component, event) {
		var btn = event.getSource().get("v.label");
        if(btn=="First Button"){
            component.set("v.message1",btn);
        }else{
            component.set("v.message2",btn);
        }
        alert("The Button pressed is: " +btn);
	}
})