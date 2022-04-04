public class PharmaProductTriggerHandler { /*
    public static void PharmaNameDuplicateCheck(list<Pharma_Product__c> newlist)
    {
        set<string> PharmaName = new set<string>();
        for(Pharma_Product__c p:[select name,pil__c,Pharma_Inventory__c from Pharma_Product__c where name != null])
        {
            PharmaName.add(p.name);
        }
        for(Pharma_Product__c pp:newlist)
        {
            if(PharmaName.contains(pp.name))
            {
              pp.name.addError('Duplicate Pharma Name');  
            }
            else
            {
                pp.pil__c = pp.Pharma_Inventory__c;
            }
        }        
    }  */
}