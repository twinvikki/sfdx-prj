({
	doSubmit : function(cmp, evt, hlpr) {
        //accessing the value in attribute abc
       var initalABCValue = cmp.get("v.abc");
        if(initalABCValue == "true")
        {
            alert("Value is True");
            //setting value of abc as false
            cmp.set("v.abc","false");
        }
        else
        {
            alert("Value is False");
            //setting value of abc as true
            cmp.set("v.abc","true");
        }
		
	},
    onClickCheckbox: function(component,event,helper){
        //body for checkbox
        //call another function defined in helper
       //helper.<functionnameinhelper>
       console.log("This is Controller");
       helper.OnClickCheckBoxhelper(component,event);
    }
})