({
	popup : function(component, event, helper) {
        var check = component.get("v.input1");
        var disptrue = component.get("v.disp");
        alert('disp-->'+disptrue);
        component.set("v.disp",true);
        alert('check-->'+check);
		
	},
	vikas : function(component, event, helper) {
       var check = component.get("v.input1");
        var disptrue = component.get("v.disp");
        alert('disp-->'+disptrue);
        component.set("v.disp",false);
        component.set("v.input1","")
        var check = component.get("v.input1");
        alert('check-->'+check);
		
	},
})