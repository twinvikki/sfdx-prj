public class VFDemo9 {

    public List<SelectOption> accpList {get; set;}
    public Id selectedAccountId {get; set;}
    public Account selectedAccount {get; set;}
    public List<Contact> relatedContacts {get; set;} 	
    public Id selectedContactId {get; set;}
    public Contact selectedContact {get; set;}
    public List<WrapperClassDemo> wrapperClassList {get; set;}
    public Boolean showEdit {get; set;}
    
    public VFDemo9() {
        selectedAccount = new Account();
        accpList = new List<SelectOption>();
        relatedContacts = new List<Contact>();
        selectedContact = new Contact();
		wrapperClassList = new List<WrapperClassDemo>();        
        accpList.add(new SelectOption('','None'));
        for(Account acc: [SELECT Id,Name
                          FROM Account
                          LIMIT 50]) {
                              
                              //dynamic picklist
                              accpList.add(new SelectOption(acc.Id,acc.Name));
                              
        }
        
    }
    
    //mapping js function with controller function
    public void showAccountData(){
        relatedContacts.clear(); // used to clear lisit whenever picklist value is changed 
        wrapperClassList.clear();
        for(Account acc: [SELECT Id,Name,OwnerId,Active__c,
                         (SELECT Id,FirstName,LastName,Email,BirthDate
                          FROM Contacts)
                          FROM Account
                          WHERE Id =:selectedAccountId]){
            selectedAccount = acc;
            relatedContacts.addAll(acc.Contacts);                  
            //message for data display                  
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Data Displayed'));
        }
        
        if(selectedAccountId == null){
            selectedAccount = new Account();
            //message for none value in picklist 
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Select Account to  Display Data'));
        }
        populateWrapperData();
    }
    
    //mapping this method with js function
    public void fetchContactRecord() {
        for(Contact con: [SELECT Id,FirstName,LastName,Email,BirthDate
                          FROM Contact
                          WHERE Id=:selectedContactId]) {
                              
            selectedContact = con;
        }
    }
    
    //action for save button
    public void save() {
        update selectedContact;
        selectedContact = new Contact();
        showAccountData(); // to refresh list of contacts 
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record Updated successfully'));

    }
    public void saveWrapper(){
        List<Contact> contactUpdtList = new List<Contact>();
        List<User> userUpdtList = new List<User>();
        Set<Id> userIdSet = new Set<Id>();
        for(WrapperClassDemo wrap: wrapperClassList){
            if(wrap.isSelected) {
                contactUpdtList.add(wrap.conRecord);
                if(!userIdSet.contains(wrap.userRecord.Id)){
                    userUpdtList.add(wrap.userRecord);
                    userIdSet.add(wrap.userRecord.Id);
                }
            }
        }
        if(contactUpdtList.size() > 0) {
            update contactUpdtList;
        }
        if(userUpdtList.size() > 0) {
            update userUpdtList;
        }
        showEdit = false;
        showAccountData();
    }
    
    public void edit() {
        //making showEdit checbox to true
        for(WrapperClassDemo wrap: wrapperClassList){
            if(wrap.isSelected) {
                showEdit = true;
                break;
            }
        }
    }
    
    public void showWarning() {
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Unsaved changes, please save it !'));

    }
    
    public void populateWrapperData() {
        Set<Id> ownerIdSet = new Set<Id>();
        Map<Id,User> userToRecordIdMap = new  Map<Id,User>();
        List<Contact> conList = new List<Contact>();
        for(Contact con: [SELECT FirstName,LastName,OwnerId
                          FROM Contact
                          WHERE AccountId=:selectedAccountId]) {
            ownerIdSet.add(con.OwnerId);
            conList.add(con);
        }
        for(User usr: [SELECT Id,Email,City
                       FROM User
                       WHERE Id IN :ownerIdSet]) {
            userToRecordIdMap.put(usr.Id,usr);
        }
        for(Contact con : conList){
            wrapperClassList.add(new WrapperClassDemo(false,con,userToRecordIdMap.get(con.ownerId)));
        }
    }
    
    //inner wrapper class
    public class WrapperClassDemo {
        
        public boolean isSelected {get; set;} //for checkbox
        public Contact conRecord {get; set;} 
        public User userRecord {get; set;}
        
        
        public WrapperClassDemo(boolean isSelected,Contact conRecord,User userRecord) {
           this.isSelected = isSelected;
           this.conRecord = conRecord;
           this.userRecord = userRecord;
        }
        
    }
}