public class TestMail2 {
 list<string> st = new list<string>();
    public string name{get; set;}
    public string mail{get; set;}    
    public void sendemail_customer(){
        st.add(mail);
       messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        //mail.setToAddresses(New String[]{'vickyvikranth016@gmail.com'});
        mail.setccaddresses(st);
        mail.setSenderDisplayName('Vikranth');
        mail.setsubject('Test email from salesforce');
        mail.setplaintextbody('your case: has been created. ');
        messaging.sendemail(new messaging.singleemailmessage[] { mail });
            }
}