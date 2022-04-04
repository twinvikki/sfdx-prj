({
    handleSuccess : function(component, event, helper) {
        alert('Sucess');
        var payload = event.getParams().response;
        alert(JSON.stringify(payload));
    },
    handleSubmit: function(component, event, helper) {
      //  event.preventDefault();       // stop the form from submitting
        var fields = event.getParam('fields');
        fields.Street = '32 Prince Street';
        component.find('myRecordForm').submit(fields);
    },
})