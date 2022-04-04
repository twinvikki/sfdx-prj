({
clickAddProduct: function(component, event, helper) 
    { 
     component.set("v.products","products");
     var products = component.get("v.products"); 
        alert('products');
     var createEvent = component.getEvent("addProduct"); 
     createEvent.setParams({"products" : products}); 
     createEvent.fire(); 
    }
})