({
	InsertRecord : function(component,objDetails) {
		var action = component.get("c.saveRecord");
        action.setParams({
            'objDetail' : objDetails
        });
        action.setCallback(this,function(a){
            console.log('callback');
            var state = a.getState();
            if(state == 'SUCCESS'){
                const abcd = a.getReturnValue("a.Id");
                console.log(abcd);
                alert(abcd.Id);
                component.set("v.parentvalue",abcd.Id);
                var RecId = component.get("v.parentvalue");
                console.log(RecId);
                var evt = $A.get("e.c:NavigateIdTOChild");
                evt.setParams({
                    "navigate":"true",
                    "PharmaId" : RecId
                });
                evt.fire();
            }
        });
        $A.enqueueAction(action);
	},
})