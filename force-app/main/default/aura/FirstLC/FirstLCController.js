({
	handleClick : function(component) {
		component.set("v.Message", "Hello from the Controller");
	},
    
    evenOrOdd : function(component, event){
    var n1 =  event.getSource();
    var msg = n1.get("v.num1");
    var resu;
    if(n1 % 2 == 0)
       resu= "even";
    else
       resu = "odd";
    component.set("v.res",resu);
}
})