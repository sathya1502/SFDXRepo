({
    handleEcho : function(cmp, event) {
        var action = cmp.get("c.echoServer"); //calling APEX Method 
        action.setParams({firstName:cmp.get("v.fName")}); //setting the parameters for APEX method
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                alert("Success "+response.getReturnValue()); //captures the Apex method return value
            }
            else if(state === "INCOMPLETE"){
                alert("Incomplete ")
            }
            else if(state === "ERROR"){
                 alert("Error "+response.getError())
            }
        });
        $A.enqueueAction(action);
        
        
    }
})