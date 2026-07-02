({
    searchKeyChange : function(cmp, event) {
        var searchKey = event.target.value;
        console.log("SearchBar input:", searchKey);

        var appEvent = $A.get("e.c:SearchKeyChange");
        if (appEvent) {
            appEvent.setParams({ searchKey: searchKey });
            appEvent.fire();
        } else {
            console.error("Application event not found");
        }
    }
})