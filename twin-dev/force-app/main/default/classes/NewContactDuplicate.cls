public class NewContactDuplicate {
         public void checkcontact (){
         set<string> fname = new set<string>();
         set<string> lname = new set<string>();
         set<string> Conemail = new set<string>();
         set<Date> ConDate= new set<Date>();      
         map<string,set<id>> duplicateMap = new map<string,set<id>>();
             
         for(contact cont:[select id,birthdate,Email,LastName,FirstName from contact where CreatedDate= Last_N_Days:15 ]){
            fname.add(cont.FirstName);
            lname.add(cont.LastName);
            Conemail.add(cont.Email);
            ConDate.add(cont.Birthdate);
         //   system.debug('Set Details:::'+''+'Fname:'+''+fname+'|'+'Lname:'+''+Lname+'|'+'Conmail:'+''+Conemail+'|'+'Condat:'+''+Condate);
         }
         for(contact c:[select id,birthdate,Email,LastName,FirstName,ContactDuplicate__c 
                          from contact where 
                          firstName in:fname and  
                          lastName in: lname and
                          email in: Conemail and
                          birthdate in: Condate])
         {
             string key = c.FirstName+c.LastName+c.Email+string.valueOf(c.Birthdate);  //creating a string for map
             if (!duplicateMap.containskey(key)){      //checking if string key is present or not in map which acts as unique id
                 duplicateMap.put(key,new set<id>());  //if key is not there we are putting key in set and intailizing the set
                 system.debug('Step1:'+'|'+' if key Not there:'+duplicateMap.get(key));
                 system.debug('key added:'+duplicateMap.keyset());
                 }
             else{
                 system.debug('Step1:'+'|'+'if key already present'+duplicateMap.containskey(key));
             }
 
             duplicateMap.get(key).add(c.id);      //adding values to map i.e. for set
             system.debug('After intialization:'+duplicateMap.keyset()+'|'+duplicateMap.get(key));
             
         }
         list<contact> contactlistupdated = new list<contact>();  
         for( string key:duplicateMap.keyset())  //checking if  string key is equal to map key if so checking how many values are present per key. 
                                                 //If values are more than 1 then we are assigning and temporary variable to value of map
                                                 //then intializing contact object and then for contact object we are giving an id and updating a feild to true.
         {   
             system.debug('string is there or not:'+key);
             system.debug('List checking previously string is working here or not:'+duplicateMap.keyset());
             system.debug('map size'+duplicateMap.get(key).size());
             if(duplicateMap.get(key).size()>1){
                 for(id contactid: duplicateMap.get(key)){
                    Contact con = new Contact();
                    con.Id = contactId;
                    con.ContactDuplicate__c = true;
                    contactlistupdated.add(con);

                     
                 }
             }
         }
         if(contactlistupdated.size()>0)
         {
         update contactlistupdated;
         }

}
}