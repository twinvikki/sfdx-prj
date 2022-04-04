public class VFDemo9Controller {
    public list<SelectOption> accpList{get;set;}
    public id selectedAccountId {get;set;}
    public Account selectedAccount {get;set;}
    public list<contact> contactlist{get;set;}
    public Contact selectedContact{get;set;}
    public id selectedcontactid{get;set;}
    public list<WrapperClassDemo> WrapperClassDemoList {get;set;} //list for wrapper class
    public boolean Cbox{get;set;}
    public VFDemo9Controller ()
    {
        selectedAccount = new Account();  
        //intializing the selectedaccount in constructor or else we will get error 
        //'The value of the "id" parameter contains a character that is not allowed or the value exceeds the maximum allowed length. 
        //Remove the character from the parameter value or reduce the value length and resubmit. 
        //If the error still persists, report it to our Customer Support team. 
        //Provide the URL of the page you were requesting as well as any other related information. 
        accpList= new list<SelectOption>();
        contactlist = new list<Contact>();
        accpList.add(new SelectOption('','None'));
        selectedContact = new Contact();
        WrapperClassDemoList = new list<WrapperClassDemo>();  //initalizing wrapper class in constructor
         
        for(Account acc:[select id,name from account limit 10])
        {
            //dynamic picklist
            accpList.add(new SelectOption(acc.id,acc.name));
        }
    } 
    //Connecting js function with controller funtion
    public void showAccountData()
    {
        contactlist.clear(); 
        WrapperClassDemoList.clear();
        for(Account acc:[select id,name,ownerid,SLAExpirationDate__c,Email_id__c 
                         ,(select id,firstname,lastname from contacts) from Account where id =:selectedAccountId])
        {
            selectedAccount = acc;
            contactlist.addall(acc.contacts);
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Data Displayed'));
            
        }
        if(selectedAccountid == null)
        {
            selectedAccount = new Account();
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Select Account to Display'));
        }
        populateWrapperData(); //calling populate wrapper data in showaccount method                    

    }
    //mapping this method with javascript in controller
    public void fetchContactRecord()
    {
        for(Contact con:[select id,firstname,lastname,email,birthdate 
                         from contact where id=:selectedContactId])
        {
            selectedContact = con;
        }
        
    }
    public void save()
    { 
      update selectedContact;  
      selectedContact = new Contact();
      //we need to refresh this complete list here we call the method shoaccountdata in another method
      showAccountData();  //we need to take care what all screen should get refresh. we need to give reRender=id.2 o/p panels
    }
    public void ShowWarning()
    {
      ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Unsaved Changes Save to make changes'));   
    }
    public void populateWrapperData() //method for wrapper class
    {
        set<id> OwnerIdSet = new set<id>();
        list<contact> conList = new list<contact>();
        map<id,user> UserIdRecordMap = new map<id,user>();
        for(Contact con:[select firstname,lastname,ownerid from contact
                        where AccountId=:selectedAccountId])
        {
            ownerIdSet.add(con.OwnerId);
            conList.add(con);
        }
        for(User userRec:[select id,email,city from user where id in:OwnerIdSet])
        {
            UserIdRecordMap.put(userRec.id,userRec);
        }
        for(Contact con: conList)
        {
            WrapperClassDemoList.add(new WrapperClassDemo(false,con,UserIdRecordMap.get(con.OwnerId)));                       
            // we are now adding records to wrapperlist by creating new instance i.e.
            // Wrapperlist.add(new WrapperClassName(boolean--> false,Records from object1,record from object2, etc)
        }
        for(WrapperClassDemo b: WrapperClassDemoList)
        {
            if(b.isSelected == true)
            {
              cbox=true;  
            }
            else
            {
               cbox=false;
            }
            
        }
    }

    public Class WrapperClassDemo
    {
        public boolean isSelected {get;set;}
        public Contact conRecord {get;set;}
        public User userRecord {get;set;}
        
        public WrapperClassDemo(boolean isSelected,Contact conRecord,User userRecord) //parametrized constructor
        {
            this.isSelected = isSelected;
            this.conRecord = conRecord;
            this.userRecord = userRecord;
        }
    }
    
//Wrapper Class is a inner class
//1. Checkbox
//2. Multiple object records in one table.
//3. Values derived from different records.
//4.Wrapper Class is generally like a innerclass
//We derive wrapper class at end

}