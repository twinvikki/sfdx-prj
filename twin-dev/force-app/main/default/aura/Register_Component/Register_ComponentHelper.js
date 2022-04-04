({
	OnClickCheckBoxhelper : function(cmp,evt) {
		//body of helper
		//define your logic in this function. Whatever we write in console.log will appear in console
		console.log("This is helper");
        //to find the aura id in component lightning input aura id we use component.find("id name").get("v.will get any value of attribute")
        //component.find() will return the list of tags which use id . Get function will get the value of attribute
        var checkboxvalue = cmp.find("checkbox").get("v.checked");
        cmp.set("v.Checkboxvalue",checkboxvalue);
	}
})