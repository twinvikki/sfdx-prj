({
	doInit : function(component, event, helper) {
        $A.createComponent("c:PharmaParent",{

        }, function(a){
            if (component.isValid()) {
                component.set("v.body",a);
            }    
        
        });
	},
    Navigatecomponent : function(component, event, helper){
        if(event.getParam("navigate") == "true")
        {
            $A.createComponent("c:PharmaChild",{
                               "parentId":event.getParam("PharmaId")
                               },
                                   function(newCmp){
                                       if(component.isValid()){
                                           component.set("v.body",newCmp);
                                       }
                               });
        }
    }
})