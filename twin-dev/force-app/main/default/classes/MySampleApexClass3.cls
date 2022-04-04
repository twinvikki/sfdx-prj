public class MySampleApexClass3 {  // Class definition and body
   public static Double myValue;   // Class Member variable
   public static String myString;  // Class Member variable

   public MySampleApexClass3 () {
      myValue = 100; // initialized variable when class is called
      System.debug('myValue variable with no Overaloading'+myValue);
   }

   public MySampleApexClass3 (Integer newPrice) { // Overloaded constructor
      myValue = newPrice; // initialized variable when class is called
      System.debug('myValue variable with Overaloading'+myValue);
   }
}