public class ProductFetch {
    @AuraEnabled
    public static list<string> Accountsearch(string accser){
        string j = '%'+accser+'%';
        list<string> listAccName = new list<string>();
        for(Account pr:[select name from Account where name like :j]){
            listAccName.add(pr.name);
        }
        return listAccName;
    }
    @AuraEnabled
    public static list<string> ProductName(){
        list<string> listProductName = new list<string>();
        for(Product2 pr:[select name,ProductCode from Product2]){
            string nameofproduct = pr.name;
            string codeofproduct = pr.ProductCode;
            string namecodeofproduct = nameofproduct+'-'+codeofproduct;
            listProductName.add(namecodeofproduct);
        }
        return listProductName;
    }
    @AuraEnabled
    public static List<Case> GetRelatedCases(string ProductCombination){
        list<Case> listCases = new list<Case>();
        String str = ProductCombination;
        List<String> res = str.split('-', 2);
        System.debug(res);
        string productName = res[0];
        string productsCode = res[1];
        system.debug(productName);
        system.debug(productsCode);
        product2 pr = [select id from product2 where name = :productName and ProductCode =:productsCode];
        for(Case cs:[select casenumber,ContactEmail,Account.name from case where Product__c =: productsCode]){
            
            listCases.add(cs);
        }
        return listCases;
    }
   @AuraEnabled
   public static List<CaseListWrapper> fetchCaseWrapper(string ProductCombination){   
        String str = ProductCombination;
        List<String> res = str.split('-', 2);
        System.debug(res);
        string productName = res[0];
        string productsCode = res[1];
        system.debug(productName);
        system.debug(productsCode);
        product2 pr = [select id from product2 where name = :productName and ProductCode =:productsCode];
        List<CaseListWrapper> lstCaseListWrapper = new List<CaseListWrapper>(); 
        for(Case cs:[select casenumber,ContactEmail,Account.name from case where Product__c =: productsCode Limit 1000]){
                               // by default checkbox should be false 
                               lstCaseListWrapper.add(new CaseListWrapper(false,cs));
                           } 
        system.debug('lstCaseListWrapper-->'+lstCaseListWrapper);
        return lstCaseListWrapper; 
      
    }
    
    /* wrapper class */  
    public class CaseListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  case objCase{get;set;}
        public CaseListWrapper(boolean isChecked, case objCase){
            this.isChecked = isChecked;
            this.objCase = objCase;
        }
    }

}