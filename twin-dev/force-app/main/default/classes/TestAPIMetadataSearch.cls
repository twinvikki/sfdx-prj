public class TestAPIMetadataSearch {
    public string inputstring{get;set;}
    public list<WrapDetailClass> WrapDetailsList{get;set;}
    public list<String> TriggerListFetch{get;set;}
    public list<string> ProcessDefinitionList {get;set;}
    public void SelectObjectMethod(){
       string objname = inputstring;
        WrapDetailsList = new list<WrapDetailClass>();        
        TriggerListFetch = new list<string>();
        ProcessDefinitionList = new list<string>();
        for(ApexTrigger at:[select name from ApexTrigger where TableEnumOrId =:objname]){
            string TrigName = at.Name;
            TriggerListFetch.add(TrigName);
        } 
        for(ProcessDefinition pr:[select name from ProcessDefinition where TableEnumOrId =:objname]){
            string PrName = pr.name;
            ProcessDefinitionList.add(PrName);
        }
        WrapDetailsList.add(new WrapDetailClass(false,TriggerListFetch,ProcessDefinitionList));
    }
    public class WrapDetailClass{
    public boolean isSelected {get;set;}
    public list<string> TriggerList{get;set;}
    public list<string> ApprovalDef{get;set;}
    public WrapDetailClass(boolean isSelected,list<string> TriggerList,list<string> ApprovalDef){
        this.isSelected = isSelected;
        this.TriggerList = TriggerList;
        this.ApprovalDef = ApprovalDef;
    }
}
}