({
	handleClick1 : function(component, event, helper) {
        var btn = event.getSource().get("v.label");
        component.set("v.message1",btn)
        alert("The Button Label you have clicked is: "+ event.getSource().get("v.label"));		
	}, 
    handleClick2: function(component, event, helper){
        var btn = event.getSource().get("v.label");
        component.set("v.message2",btn)
        alert("The button Label you have clicked is: "+ event.getSource().get("v.label"));
    }, 
    //The Above two methods can be combined in one using conditional statement to return the respective button label dynamically
    handleClick: function(component, event, helper){
        helper.helperMethod1(component, event);
    }
})