public class CustomerAppiro { 
@InvocableMethod(label='Update CustomerAppiro' description='Updates the specified record with userforapprovale feilds.')
    public static  void customerAppiroFeildUpdate(){
        set<id> idforCust = new set<id>();
        set<id> RecordCreator = new set<id>();
        map<id,id> RecordUserID = new map<id,id>();
        list<CustomerAppiro__c> CustAppi = new list<CustomerAppiro__c> ();
        for(customerappiro__c c:[select id,name,AppiroCurrency__c,UserForApproval__c,CreatedById 
                                 from customerappiro__c where AppiroCurrency__c != null])
        {
        RecordCreator.add(c.CreatedById);
        user ur = [SELECT Id,name,userrole.name,manager.name, manager.id,manager.manager.id FROM User where userrole.name like '%fsr%'                          
                     and manager.name !=null and id in: recordCreator];
        system.debug(RecordCreator);
        system.debug(c.id+c.name+c.Appirocurrency__c);
        if(!RecordUserID.containskey(c.id))
        {
             if(c.AppiroCurrency__c >= 900)
            {  
              RecordUserID.put(c.id,ur.manager.manager.id);
              system.debug('for amount > 900:' +RecordUserID.get(c.id));                           
            }
            else
            {
               RecordUserID.put(c.id,ur.manager.id); 
              system.debug('for amount < 900:' +RecordUserID.get(c.id)); 
            } 
        }    
        idforCust.add(c.id);
        recordcreator.clear();
        system.debug(recordcreator);
        }
        for(customerappiro__c c:[select id,name,AppiroCurrency__c,UserForApproval__c 
                                 from customerappiro__c ]){
        system.debug('id checking:'+c.id+ 'contains in set:' +idforcust);
        if(RecordUserID.containskey(c.id))
        {
         c.UserForApproval__c = RecordUserID.get(c.id);
         CustAppi.add(c);
        }
        system.debug(c.userforapproval__c);                             
        }
        if(custappi.size()>0)
        {
            update custappi;
        }
    }
}