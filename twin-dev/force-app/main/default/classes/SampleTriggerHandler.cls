public class SampleTriggerHandler {
  /*  public static void Updateinventorylist(list<Sample__c> newlist)
    {
        for(sample__c sample:newlist)
        {
             list<pharma_product__c> pharma = new list<pharma_product__c>();
             for(pharma_product__c pp:[select id,pil__c,Pharma_Inventory__c from pharma_product__c where id =:sample.Pharma_Product__c])
             {
                 if(pp.pil__c != null)
                 {
                     pp.pil__c = pp.pil__c - sample.Quantity__c;
                 }
                 else
                 {
                    pp.pil__c = pp.Pharma_Inventory__c - sample.Quantity__c; 
                 }
                 pharma.add(pp);
             }
            if(pharma.size()>0)
            {
                update pharma;
            }
        }
    } */
}