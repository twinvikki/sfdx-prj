({
   doInit : function(component, event, helper) {
      $A.createComponent("c:AllAppsMainPage",
         {
 
         },
         function(newCmp){
            if (component.isValid()) {
               component.set("v.body", newCmp);
            }
         }
      );
   },
   NavigateComponent : function(component,event,helper) {
      alert('event no list');
      if(event.getParam("navigate") == "true")
      {
        location.href = '/Login/UserRegistrationPage';        
     }
    },
})