public class BankTest {
    public long AccNo;
    public decimal balance;
    public void deposit(Decimal amount) {     //declaring variable in method
        balance = balance + amount;
        system.debug('balance: ' +balance);
    }
    public void withdraw(Decimal amount) {     //declaring variable in method
        balance = balance - amount;
        system.debug('balance: ' +balance);
    }

}