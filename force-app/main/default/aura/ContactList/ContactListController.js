({
    doInit : function(cmp, event) {
        var action = cmp.get("c.findAll");
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                cmp.set("v.conList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },

    searchKeyChange : function(cmp, event) {
        var searchKey = event.getParam("searchKey");
        console.log("Received search key:", searchKey);

        var action = cmp.get("c.findByName");
        action.setParams({ searchKey: searchKey });
        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                cmp.set("v.conList", response.getReturnValue());
            } else {
                console.error(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})