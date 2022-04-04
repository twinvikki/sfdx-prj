({
 doInit : function(component, event, helper) { 
        // get the fields API name and pass it to helper function
        var fetchrecid = component.get("v.recordId"); 
        var objDetails = component.get("v.objDetail");   
        var APIFeildName  = component.get("v.StagePickNameAPI");        
        helper.fetchPickListVal(component, objDetails, APIFeildName,fetchrecid);       
    }, 
})