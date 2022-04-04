public class EmailManager {

    public static void sendMail(string fromaddress,string address,string subject,string body)
//    public void sendMail(string address,string subject,string body) 
    {
        messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage ();
        string[] toaddresses = new string[] {address};
        string[] fraddresses = new string[] {fromaddress};
        mail.setToAddresses(toaddresses);
        mail.setBccAddresses(fraddresses);
        mail.setSubject(subject);
        mail.setplaintextbody(body);
        
        messaging.SendEmailResult[] results = messaging.SendEmail(new messaging.SingleEmailMessage [] {mail});
        inspectResults(results);
    }
        public static boolean inspectResults(messaging.SendEmailResult[] results){
            	boolean sendResult = true;
            for(messaging.SendEmailResult res : results){
                if (res.isSuccess()){
                    System.debug('Email sent successfully');
                }
                else{
                    sendResult = false;
                    System.debug('The following errors occurred: ' + res.getErrors());            
                }
            }
            return sendResult;
        }
   
    }