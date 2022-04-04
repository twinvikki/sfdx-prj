({
	 doInit : function(component, event, helper) {
    var action = component.get("c.FetchAllObject");
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
                component.set("v.listofProfile",opts);
                component.set("v.options",opts);
            }else{
                alert('Something went wrong..');
            }
        });            
        $A.enqueueAction(action);  
     },
})