public class ContactDuplicate {
      public void checkcontact (){
 /*         map<id,set<string>> Fname = new map<id,set<string>>();
            map<id,string> lname = new map<id,string>();
            map<id,set<string>> Conemail = new map<id,set<string>>();
            map<id,set<date>> ConDate = new map<id,set<date>>();  */
            set<id> idContact = new set<id>();
            set<string> fname = new set<string>();
            set<string> lname = new set<string>();
            set<string> Conemail = new set<string>();
            set<Date> ConDate= new set<Date>();    
            integer i=0;
            /*  for(contact cont:[select id,birthdate,Email,LastName,FirstName from contact where CreatedDate= Last_N_Days:15 ]){
            fname.put(cont.id,new set<string>{cont.FirstName}); 
            lname.put(cont.id,cont.LastName);  
            Conemail.put(cont.id,new set<string>{cont.Email});  
            ConDate.put(cont.id,new set<date>{cont.birthdate});  */
         for(contact cont:[select id,birthdate,Email,LastName,FirstName from contact where CreatedDate= Last_N_Days:15 ]){
            fname.add(cont.FirstName);
            lname.add(cont.LastName);
            Conemail.add(cont.Email);
            ConDate.add(cont.Birthdate);
            idcontact.add(cont.id);
            system.debug('Set Details:::'+''+'Fname:'+''+fname+'|'+'Lname:'+''+Lname+'|'+'Conmail:'+''+Conemail+'|'+'Condat:'+''+Condate);
            list<contact> FetchContact = new list<contact>();
            for(contact con:[select id,birthdate,Email,LastName,FirstName,ContactDuplicate__c from contact where CreatedDate= Last_N_Days:15]){
 /*               if(Fname.containskey(con.id) && lname.containskey(con.id) && Conemail.containskey(con.id) && ConDate.containskey(con.id)) {
                  if (lname.values(con.LastName) && fname.containsvalues(con.FirstName) 
                        && conemail.containsvalues(con.Email) && condate.containsvalues(con.birthdate)){        */  
                system.debug('List Details:::'+''+'Fname:'+''+con.FirstName+'|'+'Lname:'+''+con.LastName+'|'+'Conmail:'+''+con.Email+'|'+'Condat:'+''+con.birthdate);
                system.debug('List Id:' +cont.id);
                system.debug('Set id:' +idcontact);
                if(lname.contains(con.LastName) && fname.contains(con.FirstName) && Conemail.contains(con.Email) 
                   && ConDate.contains(con.birthdate)){
                       system.debug('Succesffuly removed:' +idcontact);
                    }
                    else{
                           system.debug('Not removed'); 
                           
                    }
                if(!idContact.contains(con.id)){
                    i++;
                 system.debug('greater than 1:'+i);   
                }
                
                if(i>1) {
                        con.ContactDuplicate__c = true;
                        system.debug('con.ContactDuplicate__c'+con.ContactDuplicate__c);
                        FetchContact.add(con);    
                }
                if(FetchContact.size()>0){
                 update FetchContact;
                }
             } 
        }
}
}