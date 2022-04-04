Global class InboundMail implements messaging.InboundEmailHandler {
    global messaging.InboundEmailResult handleinboundemail(messaging.InboundEmail email,messaging.inboundenvelope envelope){
        messaging.InboundEmailResult result = new messaging.InboundEmailResult();
        string subToCompare = 'Create Contact';
        if (email.subject.equalsignorecase(subtocompare)){
            contact c = new contact();
            c.lastname = email.fromName;
            c.description = email.plainTextBody;
            system.debug('the value of email is @@@@@@@@@@@' +c);
            insert c;
            system.debug('the value of email is' +c);
            
        }
        result.success = true;
        return  result;
    }

}