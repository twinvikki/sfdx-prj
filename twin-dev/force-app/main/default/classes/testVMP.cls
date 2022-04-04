public with sharing class testVMP {
   public static void method1()
   {
       for(Account acc:[select id,name from account])
       {
           system.debug('acc');
       }
   }
}