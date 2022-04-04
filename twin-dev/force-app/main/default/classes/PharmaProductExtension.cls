public class PharmaProductExtension {  /*
    public string valueofInputtext {get;set;}
    public string toAddress{get;set;}
    public string message{get;set;}
    Public string BodyArea{get;set;}
    Public string SubjectArea{get;set;}
    public string EmailToList {get;set;}
    public id urlId {get;set;}
    public boolean showblock{get;set;}
    public boolean Samplepresent {set;}
    public boolean PhInvPresent {set;}
    public boolean MailButton{get;set;}
    public boolean singlemail{get;set;}
    public boolean Groupemail{get;set;}
    public string PName{get;set;}
    public list<WrapperClassList> Wrapperlist {get;set;}
    public list<SecondWrapperClassList> WrapperSecondlist {get;set;}  
    public list<string> ToMailList {get;set;}
//---------------------------------------------------------------------//
    public list<Pharma_Product__c> PharmaAll{get;set;}
    public set<sample__c> SampleSet {get;set;}
    public set<PharmaInvoice__c> PharmaInv {get;set;}
//---------------------------------------------------------------------//        
    

    public PharmaProductExtension(){
        Wrapperlist = new list<WrapperClassList>();
        WrapperSecondlist = new list<SecondWrapperClassList>();
        ToMailList = new list<string>();
        urlId = apexpages.currentpage().getparameters().get('Recordid');
        showblock = false;
        MailButton = false;
        Groupemail=false;
        singlemail = false;
        if(urlId != null)
        {
           showblock = true;
           PharmaAll = new list<Pharma_product__c>();
           SampleSet = new set<sample__c>();
           PharmaInv = new set<PharmaInvoice__c>();
           
           for(Pharma_product__c p:[select id,name,price__c,(select id from samples__r),
                                    (select id from PharmaInvoices__r) from pharma_product__c where id =: urlId])
          {
             if(p.PharmaInvoices__r != null && p.PharmaInvoices__r.size()>0)
             {
                 PhInvPresent = true;
             }
             if(p.Samples__r !=null && p.Samples__r.size()>0) 
             {
                 Samplepresent = true;
             }
             PName = p.name;
             PharmaAll.add(p);
             
          }            
        }
        populateWrapperData();
    }
    public PageReference doSubmit(){
        //this will redirect to new vf page
        PageReference pr = new PageReference('/apex/PharmaProductCustomPage?InputValue='+valueofInputtext);	     
        pr.setRedirect(True);
        system.debug(valueofInputtext);
        return pr;
    }
    public PageReference GeneratePdf(){
        //this will redirect to new vf page
        PageReference pr = Page.PharmaDetailPdf;
        //new PageReference('/apex/PharmaDetailPdf?value='+'pdf');	     
        // pr.setRedirect(True);
        // system.debug(valueofInputtext);
        blob reportPdf;
        reportPdf = pr.getContentAsPDF();
        return pr;
    }
    public Pagereference PressButtonForMail(){
        system.debug('f');        
        messaging.SingleEmailMessage sendmail = new messaging.SingleEmailMessage();
        String[] sendingTo = new String[] {toAddress};
        sendmail.setToAddresses(sendingTo);
        sendmail.setSubject(SubjectArea);
        sendmail.setPlainTextBody(BodyArea);
   //     sendmail.setPlainTextBody('Hello!!!!!This is a test email to test single email message program');
        //mail.setHtmlBody('<b> This is HTML body </b>' );
        PageReference pr = Page.PharmaDetailPdf;
        blob reportPdf;
        reportPdf = pr.getContentAsPDF();
  //      attach.Body = reportPdf;
  //      attach.Name = 'PharmaDetails';
   //     attach.IsPrivate = false;
      //  attach.ParentId = urlId;
     //   insert attach;  
     //   Messaging.Emailfileattachment fileAttachments = new Messaging.Emailfileattachment();
    //    for (Attachment a : [select Name, Body, BodyLength from Attachment where name = :PharmaDetails]){
        Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
        efa.setFileName('PharmaDetail.Pdf');
        efa.setBody(reportPdf);
 
        sendmail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
      
       // sendmail.setFileAttachments(fileAttachments);
        messaging.sendEmail(new Messaging.SingleEmailMessage[]{sendmail});
        message='Email Sent!!!'; 
        return null;  
       }
     public Pagereference PressButtonForGroupMail(){
          system.debug('EmailToList');
          ToMailList = EmailToList.split(',');
          system.debug(ToMailList);
          list<Messaging.SingleEmailMessage> masterlist = new list<Messaging.SingleEmailMessage>();
          string sendToMail;
          integer i;
          for(i=0;i<ToMailList.size();i++)
          {  
            messaging.SingleEmailMessage SMail = new messaging.SingleEmailMessage();
            sendToMail = ToMailList.get(i);
            list<string> SendTo = new list<string>();
            sendTo.add(ToMailList.get(i));
            SMail.setToAddresses(sendTo);
            sMail.setSubject(SubjectArea);
            sMail.setPlainTextBody(BodyArea);
       //     smail.setPlainTextBody('Hello!!!!!This is a test email to test Group email message program');
            masterlist.add(smail);           
           }
           Messaging.sendEmail(masterlist);
           message='Email Sent!!!'; 
           return null;             
        }
                    
    public void singlemail(){
        singlemail = true;
        Groupemail = false;
        MailButton=true;
    }
    public void GroupMail(){
         Groupemail = true;
         singlemail = false;
         MailButton=true;        
    }
    public void populateWrapperData(){
       system.debug('populateWrapperData');
       showblock= true;
       set<id> VisitId = new set<id>();
       set<id> FrId = new set<id>();
       set<id> InvId = new set<id>();
        
       map<id,sales_team__c> SalesTeamdetails = new map<id,sales_team__c>();
       map<id,visit__c> Visitdetails = new map<id,visit__c>();
       map<id,hospital__c> Hospitaldetails = new map<id,hospital__c>();
       map<id,Invoice__c> InvoiceList = new map<id,Invoice__c>();
        
       list<sample__c> SampleDetails  = new list<sample__c> ();
       list<PharmaInvoice__c> PharmaInvoiceAll = new list<PharmaInvoice__c>();
       urlId = apexpages.currentpage().getparameters().get('Recordid');
       system.debug('urlId'+urlId);
        
       for(sample__c s:[select id,name,FR_Name__c,Quantity__c,Visit__c,Pharma_Product__c from sample__c where Pharma_Product__c =: urlId ])
       {
           VisitId.add(s.Visit__c);
           FrId.add(s.FR_Name__c);
           SampleDetails.add(s);
       }
       for(sales_team__c st:[select id,name,email__c,phone__c from sales_team__c where id in:FrId])
       {
           if(!SalesTeamdetails.containskey(st.id))
           {
               SalesTeamdetails.put(st.id,st);
           }
       }
       for(visit__c v:[select id,name,Feedback__c,Hospital__c,Visit_Date__c from visit__c where id in:VisitId]){
            for(hospital__c hp:[select id,name,Geo_Region__c from hospital__c where id =: v.Hospital__c]){
                if(!Hospitaldetails.containskey(v.id)){
                    Hospitaldetails.put(v.id,hp);
                }  
            }
            if(!Visitdetails.containskey(v.id)){
                Visitdetails.put(v.id,v);
            }
        }
        for(sample__c sam:SampleDetails)
        {
            Wrapperlist.add(new WrapperClassList(false,sam,SalesTeamdetails.get(sam.FR_Name__c),Visitdetails.get(sam.visit__c),Hospitaldetails.get(sam.Visit__c)));
        }
        for(PharmaInvoice__c PInv:[select id,name,Invoice__c,Pharma_Product__c 
                                   from PharmaInvoice__c where Pharma_Product__c =: urlId ])
        {
             InvId.add(PInv.Invoice__c);
             PharmaInvoiceAll.add(PInv);
            
        }
        for(Invoice__c Invoice:[select id,name,Amount__c,Amount_After_Discount__c,Bulk__c,
                                Comments__c,Hospital__c,Invoice_Date__c,Invoice_Reg_Number__c,Status__c from Invoice__c where id in:InvId ])
        {
            if(!InvoiceList.containskey(Invoice.id)){
                InvoiceList.Put(Invoice.id,Invoice);
            }
        }
        for(PharmaInvoice__c PInvoice:PharmaInvoiceAll){
            WrapperSecondlist.add(new SecondWrapperClassList(PInvoice,InvoiceList.get(PInvoice.Invoice__c)));
        }     
    }
    
    public class SecondWrapperClassList{
        public PharmaInvoice__c PharmaInvoice{get;set;} 
        public Invoice__c Inv{get;set;}
        public SecondWrapperClassList(PharmaInvoice__c PharmaInvoice,Invoice__c Inv)
        {
            this.PharmaInvoice=PharmaInvoice;
            this.Inv = Inv;
        }
    }    
    //inner wrapper class
    public class WrapperClassList{
        public boolean isSelected {get;set;}
        public sample__c samRecord{get;set;}
        public sales_team__c salesteam{get;set;}
        public visit__c visitdet{get;set;}
        public Hospital__c hospitalteam{get;set;}
        public WrapperClassList(boolean isSelected,sample__c samRecord,sales_team__c salesteam,
                                visit__c visitdet,Hospital__c hospitalteam){
            this.isSelected = isSelected;
            this.samRecord = samRecord;
            this.salesteam = salesteam;
            this.visitdet = visitdet;
            this.hospitalteam = hospitalteam;
        }
    }  */
}
                                  
 /*     urlId = apexpages.currentpage().getparameters().get('Recordid');
       PageReference pr = Page.PharmaDetailPdf;
       Attachment attach = new Attachment();
       blob reportPdf;
       try{
            reportpdf = pr.getContent();
       }
       catch (VisualforceException e) {
            reportPdf=Blob.valueOf('some text');
       }
       attach.Body = reportPdf;
       attach.Name = 'PharmaDetails';
       attach.IsPrivate = false;
       attach.ParentId = urlId;
       insert attach;  */
       
  //    return pr;