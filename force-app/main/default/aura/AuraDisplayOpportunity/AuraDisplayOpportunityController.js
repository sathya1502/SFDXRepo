({
	getOpps : function(cmp, event) {
        var action = cmp.get("c.getOpportunities");
        debugger;
        action.setCallback(this, function(response){
            var state = response.getState();
            debugger;
            if(state === 'SUCCESS')
            {
                cmp.set("v.oppList",response.getReturnValue())
            }
            else{
                alert("No Data exported, ERROR")
            }
        });
        $A.enqueueAction(action);
		
	}
})