({
	handleApplicationEvent : function(component, event) {
        var FinalValue = event.getParam("PharmaId");
        component.set("parentId",FinalValue);
        var parent = component.get("parentId");
        console.log(parent);
		
	}
})