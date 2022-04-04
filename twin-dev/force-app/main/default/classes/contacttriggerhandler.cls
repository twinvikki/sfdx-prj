public class contacttriggerhandler {
    public static void preventduplicatecontact(list<contact> newlist,map<id,contact> oldmap){
        set<string> fname = new set<string>();
        set<string> lname = new set<string> ();
        set<string> Conemail = new set<string>();
        set<Date> ConDate= new set<Date>();
        set<string> uNIQUESTRINGSET = new set<string>();
        for(contact cont:newlist){
            if(oldmap == null ||(cont.firstname != oldmap.get(cont.id).firstname ||
                                cont.lastname != oldmap.get(cont.id).lastname 
                                || cont.email != oldmap.get(cont.id).email ||
                                cont.birthdate != oldmap.get(cont.id).birthdate) ){
            fname.add(cont.FirstName);
            lname.add(cont.LastName);
            Conemail.add(cont.Email);
            ConDate.add(cont.Birthdate);
            }

        } //this below for will not through an error for before update but will not work for after updates this will hold for old values
        for(contact c:[select firstname,LASTNAME,EMAIL,BIRTHDATE FROM CONTACT
                      WHERE FIRSTNAME IN: FNAME
                        AND LASTNAME IN: LNAME
                      AND EMAIL IN: CONEMAIL
                       AND BIRTHDATE IN:CONDATE]){
                           
         STRING UNIQUESTRING = C.FIRSTNAME+ C.LASTNAME + C.EMAIL + C.BIRTHDATE;
               UNIQUESTRINGSET.ADD(UNIQUESTRING);
                       }
        for(contact c:newlist){
            STRING UNIQUESTRING = C.FIRSTNAME+ C.LASTNAME + C.EMAIL + C.BIRTHDATE;
            IF(UNIQUESTRINGSET.CONTAINS(UNIQUESTRING) ){
                C.ADDERROR(SYSTEM.LABEL.CONTACTTRIGGER_ERROR);  // if we remove else part then while we try to insert two duplicates using data loader then it will through an error
            }
            else{
                uniquestringset.add(uniquestring);
            }
    }

}
    public static void preventduplicationforupdate(list<contact> newlist,map<id,contact> oldmap){
                  
        set<string> fname = new set<string>();
        set<string> lname = new set<string> ();
        set<string> Conemail = new set<string>();
        set<Date> ConDate= new set<Date>();
       
        map<string,integer> uniquestringmap = new map<string,integer>();
        for(contact cont:newlist){
            if(oldmap == null || cont.firstname != oldmap.get(cont.id).firstname ||
                                cont.lastname != oldmap.get(cont.id).lastname 
                                || cont.email != oldmap.get(cont.id).email ||
                                cont.birthdate != oldmap.get(cont.id).birthdate)
            {
            fname.add(cont.FirstName);
            lname.add(cont.LastName);
            Conemail.add(cont.Email);
            ConDate.add(cont.Birthdate);
            }
        }
        for(contact c:[select firstname,LASTNAME,EMAIL,BIRTHDATE FROM CONTACT
                      WHERE FIRSTNAME IN: FNAME
                      AND LASTNAME IN: LNAME
                      AND EMAIL IN: CONEMAIL
                      AND BIRTHDATE IN:CONDATE])
        {                  
         STRING UNIQUESTRING = C.FIRSTNAME+ C.LASTNAME + C.EMAIL + C.BIRTHDATE;
         IF(!UNIQUESTRINGMAP.CONTAINSKEY(UNIQUESTRING))
         {
             UNIQUESTRINGMAP.PUT(UNIQUESTRING,0);
         }             
             INTEGER TEMP = UNIQUESTRINGMAP.GET(UNIQUESTRING);
             TEMP++;
             UNIQUESTRINGMAP.put(uniqueString,temp);
         }
        FOR(CONTACT C:NEWLIST){
            STRING UNIQUESTRING = C.FIRSTNAME + C.LASTNAME + C.EMAIL + C.BIRTHDATE;
            IF(UNIQUESTRINGMAP.CONTAINSKEY(UNIQUESTRING) && UNIQUESTRINGMAP.GET(UNIQUESTRING)>1){
              C.ADDERROR(SYSTEM.LABEL.CONTACTTRIGGER_ERROR);  
            }
        }

/* this for update so we need to check that above code wroks for update or not
    public static void preventduplicatecontact(list<contact> newlist){
        set<string> fname = new set<string>();
        set<string> lname = new set<string> ();
        set<string> Conemail = new set<string>();
        set<Date> ConDate= new set<Date>();
        set<string> uNIQUESTRINGSET = new set<string>();
        for(contact cont:newlist){
            if(oldmap == null ){
            fname.add(cont.FirstName);
            lname.add(cont.LastName);
            Conemail.add(cont.Email);
            ConDate.add(cont.Birthdate);
            }

        }
        for(contact c:[select firstname,LASTNAME,EMAIL,BIRTHDATE FROM CONTACT
                      WHERE FIRSTNAME IN: FNAME
                        AND LASTNAME IN: LNAME
                      AND EMAIL IN: CONEMAIL
                       AND BIRTHDATE IN:CONDATE]){
                           
         STRING UNIQUESTRING = C.FIRSTNAME+ C.LASTNAME + C.EMAIL + C.BIRTHDATE;
               UNIQUESTRINGSET.ADD(UNIQUESTRING);
                       }
        for(contact c:newlist){
            STRING UNIQUESTRING = C.FIRSTNAME+ C.LASTNAME + C.EMAIL + C.BIRTHDATE;
            IF(UNIQUESTRINGSET.CONTAINS(UNIQUESTRING) ){
                C.ADDERROR(SYSTEM.LABEL.CONTACTTRIGGER_ERROR);  // if we remove else part then while we try to insert two duplicates using data loader then it will through an error
            }
            else{
                uniquestringset.add(uniquestring);
            }
    }
}
*/
}
}