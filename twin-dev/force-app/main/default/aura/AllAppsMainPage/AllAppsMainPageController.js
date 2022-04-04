({
	 doInit : function(component, event, helper) {
        alert('from lightning');
	},
	RedirectToPage : function(component, event, helper) {        
      alert('from lightning');
    //  var ParamInput = "Pharma";
      var settrue = "True";
      alert('settrue-->'+settrue);
      var evt = $A.get("e.c:RedirectToRegisterPage");
      alert('evt-->'+evt);
      evt.setParams({ 
                    "navigate":settrue,
                    });
      evt.fire();
      alert('event fired');
    },

     /*     var action = component.get("c.FetchAllObject");
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
                component.set("v.listofAllObj",opts);
            }else{
                alert('Something went wrong..');
            }
        });            
        $A.enqueueAction(action);   */
})