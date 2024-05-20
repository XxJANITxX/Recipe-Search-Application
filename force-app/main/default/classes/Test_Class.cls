@isTest
public class Test_Class {
    
    @isTest
    static void insertData(){
        Account acc = new Account(Name='Test Account 5');
        insert acc;
        
        MyDebugPrinter db = new MyDebugPrinter();
        db.justAMethod();
    }
}