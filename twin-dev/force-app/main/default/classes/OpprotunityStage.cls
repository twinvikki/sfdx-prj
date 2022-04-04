public class OpprotunityStage {
 /*     public list<selectOption> getSelectOptions() {   //a SelectOption object specifies one of the possible values for a for
                                                      // a Visualforce selectCheckboxes, selectList, or selectRadio component.
        list<selectOption> options = new list<selectOption> ();
        options.add(new SelectOption('Select','Select'));
        options.add(new SelectOption('opplist','oppList'));
        options.add(new SelectOption('Closed Lost','Closed Lost'));   
        return options;     
    }    */
     public list<opportunity> Oppsel = new list<opportunity>();
    {
        for(opportunity op:[select stagename from opportunity]){
            oppsel.add(op);
        }
    }
     public List<opportunity> oppList = new List<opportunity>();
     
     public List<opportunity> getRecords(){
         oppList = [Select StageName from Opportunity];
        return oppList;

      }
 

      public String selectedVal{get;set;}
      public list<Opportunity> Opps{get;set;} 

      public pageReference oppList()
      {
      if(selectedVal !=null) 
      {
         Opps= [select name,type,CloseDate from Opportunity where StageName =: selectedVal];
      }
      return null;

      } 
  
}