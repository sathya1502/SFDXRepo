({
	doInit : function(component, event, helper) {
        var action = component.get("c.getAccount"); //fetching froom the APEX Controller
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){ //If fetch is success then assign the return value to the accList Aura attribute.
                component.set("v.accList", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
	}
})