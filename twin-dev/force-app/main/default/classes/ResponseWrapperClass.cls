public class ResponseWrapperClass {
public static void getsObjectRecords() {
 RequestJsonWrapper wRequest= new RequestJsonWrapper(); 
wRequest.billingAccountNumber = 'ban';
wRequest.fromDate = 'fromDate';
wRequest.toDate = 'toDate';
system.debug('wRequest'+wRequest);
    
 /* //  list<WrapperClassList> wraplist = new list<WrapperClassList>();
    string stringJson = '{' +
     '"primaryCardDetails":"xxxxxxxxxxxx0987",'+
     '"autoPay": "false",'+
     ' "paymentDetails": ['+
     '  {'+
     ' "transactionDate":"2020-06-24 17:17:49",'+
     ' "postingDate":"2020-06-24 17:17:49",'+
     ' "amount":"150",'+
     ' "channel":"Mobile-App",'+
     ' "type":"Recurring",'+
     ' "mode":"card",'+
     ' "details":"XXXXXXXXXXX0002",'+
     ' "requestId":"R-sfaf633538ffd"'+
    ' },'+
    ' {'+
    ' "transactionDate":"2020-06-24 17:17:49",'+
    '  "postingDate":"2020-06-24 17:17:49",'+
    '  "amount":"150",'+
    '  "channel":"miscrosite",'+
    '  "type":"Auto",'+
    '  "mode":"card",'+
    '  "details":"XXXXXXXXXXX0002",'+
    '  "requestId":"A-sfaf633538ffd"'+
    ' }'+   
    ' ]'+
   '}';  
    system.debug(stringJson);
 WrapperRecords wResp=(WrapperRecords) JSON.deserialize(stringJson,WrapperRecords.class); 
  system.debug('wResp-->'+wResp);
  //  return wraplist;
  system.debug(wResp.paymentDetails); */
}


//Wrapper class 
public class WrapperRecords{
    @AuraEnabled
    public string primaryCardDetails;   
    @AuraEnabled
    public string autoPay;  
    @AuraEnabled
    public list<WrapperClassList> paymentDetails;
}
public class WrapperClassList{  
    @AuraEnabled
    public string transactionDate; 
    @AuraEnabled
    public string postingDate;     
    @AuraEnabled
    public string amount;     
    @AuraEnabled
    public string channel; 
    @AuraEnabled
    public string type; 
    @AuraEnabled
    public string mode; 
    @AuraEnabled
    public string Details;
    @AuraEnabled
    public string RequestId;
    public WrapperClassList(string TransactionDate,
    string PostingDate,string Amount,string Channel
    ,string Type,string Mode,string Details,string RequestId){
        this.TransactionDate = TransactionDate;
        this.PostingDate = PostingDate;
        this.Amount = Amount;
        this.Channel = Channel;
        this.Type = Type;
        this.Mode = Mode;
        this.Details = Details;
        this.RequestId = RequestId;

    }
}
 public class RequestJsonWrapper{      
   String billingAccountNumber;
   String fromDate;
   String toDate;
}
}