({
	helperMethod : function() {
    var searchTerm=component.get("v.term");
    $A.get("e.bblightning:SearchEvent").
    setParams({term: searchTerm}).fire();
		
	}
})