({
	addnum : function(component, event, helper) {
        var sum= component.get("v.input1")+component.get("v.input2");
        if(sum==null || sum=='undefined' ){
        sum.set("v.errors", [{message:"cannot be blank"}]);

        }
        else
        {
          sum.set("v.sum",sum);  
        }             
    },
	addnums : function(component, event, helper) {
        var sum= component.get("v.input1")+component.get("v.input2");
        if(sum==null || sum=='undefined' ){
        sum.set("v.errors", [{message:"cannot be blank"}]);

        }
        else
        {
          sum.set("v.sum",sum);  
        }             
    },	
    clearNum : function(component, event, helper) { 
    
    component.set("v.input1",0);
      component.set("v.input2",0);

   }
 
})