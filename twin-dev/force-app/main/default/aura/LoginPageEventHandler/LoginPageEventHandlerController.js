({
 doInit  : function(component, event, helper) {
     alert('inside event');	
    $A.createComponent("c:AllAppsMainPage", {        
    }, function(a) {
        if (component.isValid()) {
            component.set("v.body", a);
        }
    });
 },
 NavigateComponent : function(component, event, helper) {
        console.log('event');
      if(event.getParam("navigate") == "true")
      {
        location.href = '/Login/LoginPageVF?LoginParam='+event.getParam("UrlID");
        
     }
    },
    
    
})