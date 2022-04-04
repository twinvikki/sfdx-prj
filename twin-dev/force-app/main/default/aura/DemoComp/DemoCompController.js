({
	SearchAccount : function(component, event, helper) {
        alert('button');
       var action = component.get("c.Accountsearch");
        action.setParams({
            accser : component.get("v.SearchAccount")  
        });
        action.setCallback(this,function(response){
            if(response.getState() == "SUCCESS"){
                var StoreResponse = response.getReturnValue();
                alert('Retrun-->'+StoreResponse);
                console.log('sucess'); 
                var opts = [];
                for(var i=0;i<StoreResponse.length;i++){
                    opts.push({
                        label:StoreResponse[i],
                        value:StoreResponse[i]
                    })	
                }
                component.set("v.listofaccname",opts);
            }else{
                alert('Something went wrong..');
            }
        });            
        $A.enqueueAction(action);  
    },		
})