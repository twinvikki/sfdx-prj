({
    openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      component.set("v.isOpen", true);
   },    
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        var recidforNav = component.get("v.recordId");
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recidforNav,
            "slideDevName": "related"            
        });
        navEvt.fire();                
    },
    
    SubmitForApporval: function(component, event, helper) {
        // Display alert message on the click on the "Like and Close" button from Model Footer 
        // and set set the "isOpen" attribute to "False for close the model Box.
          alert('Submitforapproval'+unsaved);
       var unsaved = cmp.find("unsaved").get("v.value");
        alert('Submitforapproval'+unsaved);

        console.log(component.get("v.ReasonEdit"));
        var reasoneditpanel = component.get("v.ReasonEdit");
        var recidforNav = component.get("v.recordId");
        alert('reasoneditpanel-->'+reasoneditpanel);
        var action = component.get("c.UpdateEditReq");
        action.setParams({
            "recId": recidforNav,
            "reasonforedit": reasoneditpanel
        }); 
        action.setCallback(this,function(res){
            if(res.getState()=='SUCCESS'){
                console.log('success');
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": recidforNav,
                    "slideDevName": "related"            
                });
                navEvt.fire();                
            }
            else
            {
                alert('error');            
            }          
        });
        $A.enqueueAction(action);
    },
     makeUnsavedChanges: function(cmp, evt, helper) {
         alert('saved');
         var unsaved = cmp.find("unsaved");
         unsaved.setUnsavedChanges(true, { label: 'My component name' });
     },
     clearUnsavedChanges: function(cmp, evt, helper) {
         alert('Cancelled');
         var unsaved = cmp.find("unsaved");
         unsaved.setUnsavedChanges(false);
     },
})

/*        var findreason = component.find("reasonforeditpanel");
        var reasoneditpanel = findreason.get("v.value");
        var recidforNav = component.get("v.recordId");
        console.log('REDP-->'+reasoneditpanel); */


   // doInit: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
      //  var fetchrecid = component.get("v.recordId");
       // component.set("v.RecId",fetchrecid);
       // component.set("v.isOpen", true);
       // var dismissActionPanel = $A.get("e.force:closeQuickAction"); dismissActionPanel.fire();
        
        
   // },