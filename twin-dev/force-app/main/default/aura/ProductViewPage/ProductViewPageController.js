({
    doInit : function(component, event, helper) {
        var fetchrecid = component.get("v.recordId"); 
        var action = component.get("c.FetchRecordTypesId");
        action.setParams({
            recValue : fetchrecid
        });
        action.setCallback(this,function(res){
            if(res.getState()=='SUCCESS'){
                var recName = res.getReturnValue();
                alert('recName-->'+recName);
                if(recName == 'Four Wheeler'){
                    alert('FourWheeler');
                    component.set('{!v.TwoWheeler}',false);  
                    component.set('{!v.FourWheeler}',true);  
                }else if(recName == 'Two Wheeler'){
                    alert('TwoWheeler');
                    component.set('{!v.TwoWheeler}',true);  
                    component.set('{!v.FourWheeler}',false);  
                }
                
            }
            else
            {
                alert('error');            
            }          
        });
        $A.enqueueAction(action);    
    }
})

/*
                if(recName == 'Two Wheeler'){
                    var evt = $A.get("e.force:navigateToComponent");
                    evt.setParams({
                        componentDef : "c:BikeViewForm"
                    })
                    evt.fire();
                }
                else if(recName == 'Four Wheeler'){
                    var evt = $A.get("e.force:navigateToComponent");
                    evt.setParams({
                        componentDef : "c:CarViewForm"
                    })
                    evt.fire();
                }
                    else if(recName == 'Defence Vehicle'){
                       var evt = $A.get("e.force:navigateToComponent");
                        evt.setParams({
                            componentDef : "c:CarViewForm"
                        })
                        evt.fire(); 
                         alert('no defence vehicles');
                    }
                        else{
                            var evt = $A.get("e.force:navigateToComponent");
                            evt.setParams({
                                componentDef : "c:CarViewForm"
                            })
                            evt.fire();  
                            alert('no heavy vehicles');
                        }
*/