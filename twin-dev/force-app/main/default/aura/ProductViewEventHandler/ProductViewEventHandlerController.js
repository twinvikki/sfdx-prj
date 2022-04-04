({
	doInit : function(component, event, helper) {
        alert('Inside Handler');
    $A.createComponent("c:ProductViewPage", {

    }, function(a) {
        if (component.isValid()) {
            component.set("v.body", a);
        }
    });
},

    NavigateBikeComponent : function(component, event, helper) {
        alert('Bike event');
      if(event.getParam("BikeNavigate") == "true")
      {
        $A.createComponent("c:BikeViewForm",
            {
                "recid" : event.getParam("RecId")
            }, 
            function(b) {
                if (component.isValid()) {
                    component.set("v.body", b);
                }
            });
     }
    },

    NavigateCarComponent : function(component, event, helper) {
        console.log('second event');
      
      if(event.getParam("CarNavigate") == "true")
      {
      //    console.log('entered check');
      // console.log(event.getParam("wpsId"));
        $A.createComponent("c:CarViewForm",
            {
                "recid" : event.getParam("RecId")
            }, 
            function(newCmp) {
                if (component.isValid()) {
                    //                    console.log('valid');
                    alert('not valid');
                    component.set("v.body", newCmp);
                }
            });
     }
    },

})