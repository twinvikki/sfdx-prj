public class Vfp {
    Public Opportunity opp{get;set;}
    // used to pass values from controller to VF page and ViceVersa.
    
    public List<opportunity> oppList = new List<opportunity>();
    
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
/*    public Pagereference saveMethod(){
        try{                                
            update opp;
            Pagereference tocase = new Pagereference('/'+oppid); // Redirects to New VisualForce Page.
            tocase.setRedirect(true);
            return tocase;
        }
        catch(Exception e){
            Apexpages.addMessages(e);   // It displays Error Message when Validation rule fires.
        }
        return null;  
    } */