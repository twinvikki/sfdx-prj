public class TestMail {

    
    public void sendemail_customer(){
       messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        mail.setToAddresses(New String[]{'vickyvikranth016@gmail.com'});
        mail.setSenderDisplayName('Vikranth');
        mail.setsubject('Test email from salesforce');
        mail.setplaintextbody('your case: has been created. ');
        messaging.sendemail(new messaging.singleemailmessage[] { mail });
            }
}