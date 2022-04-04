({
    handleClick : function(component, event, helper) {
        alert('button clicked');
        var navEvt = $A.get("e.force:navigateToSObject");
        alert('navEvt-->'+navEvt);
        navEvt .setParams({
            "recordId": "a0K7F00000Hct8M"
        });
        navEvt.fire();
    }
})