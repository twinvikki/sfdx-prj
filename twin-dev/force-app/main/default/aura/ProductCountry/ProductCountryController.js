({
    doInit : function(component, event, helper) {
        var action = component.get("c.ProductName");
        action.setCallback(this,function(response){
            if(response.getState() == "SUCCESS"){
                var StoreResponse = response.getReturnValue();
                console.log('Retrun-->'+StoreResponse);
                console.log('sucess'); 
                var opts = [];
                for(var i=0;i<StoreResponse.length;i++){
                    opts.push({
                        label:StoreResponse[i],
                        value:StoreResponse[i]
                    })	
                }
                component.set("v.ListOfAllProduct",opts);
            }else{
                alert('Something went wrong..');
            }
        });            
        $A.enqueueAction(action);  
    },
    SelectCases : function(component, event, helper) {
         var controllerValueKeySource = event.getSource().get("v.value");
        if(controllerValueKeySource == '--None--'){
            component.set("v.EnableFetchcases",false);
        }
        else 
        {
            component.set("v.EnableFetchcases",true);
        }
    },
    CallCasesComponent : function(component, event, helper) {
        var controllerValue = component.find("SourceProduct").get("v.value");
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:FetchCaseDetailsForProduct",
            componentAttributes : {
                ProductString : controllerValue 
            }
        });
        evt.fire();
    },
})