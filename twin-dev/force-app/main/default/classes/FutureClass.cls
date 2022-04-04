global class FutureClass {
    
    @future
    public static void callAccountMethod()
    {
      list<Account> Acclist = [select name,Email_id__c from account where name =:'sdgvsd'];
      for(Account acc: Acclist ) 
      {
         acc.Email_id__c = 'vickyvikranth016@gmail.com';
         
      }
        if(Acclist.size()>0)
        {
           update Acclist; 
        }
        
    }

}