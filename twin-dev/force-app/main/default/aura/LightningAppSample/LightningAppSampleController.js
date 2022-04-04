({
	doInit : function(component, event, helper) {
		alert('Hi you are in doinit');
	},
    fetchaccount : function(component, event, helper){
        alert('Hi you are in popupmessage');
        var accid = component.get("v.accId");
        console.log("acc id=>"+accid);
        var action = component.get("c.fetchAccount");
        action.setParams({
            recid: accid
        });
        action.setCallback(this, function(response)
                           {
                               var state = response.getState();
       //                        if (component.isValid() && state == "SUCCESS")
                               if(state=="SUCCESS")
                               { 
                                   console.log(response.getReturnValue());
        //                           component.set("v.accName",response.getReturnValue());                                  
                               }
                               else
                               {
                                   console.log("failed with state:" +state);
                               }
                               
                           });
        $A.enqueueAction(action);
    }
})