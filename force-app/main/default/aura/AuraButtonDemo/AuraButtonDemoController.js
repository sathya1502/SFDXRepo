({
	handleClick : function(cmp, event) {
        var attributeValue = cmp.get("v.text");
        alert("Hello "+ attributeValue);
        var target;
        if(event.getSource)
        {
            target=event.getSource();
            cmp.set("v.text", target.get("v.label"));
            alert("Button pressed is: "+ target.get("v.label"))
        }
        else 
        {
            target = event.target.value;
            cmp.set("v.text",target+"***");
            alert("button pressed is:" +target);
        }
	}
})