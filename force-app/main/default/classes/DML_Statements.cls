public with sharing class  DML_Statements {
    // Basic syntax
    // --> DMLStatement sObject/ List of sObject
    
    public static void insertList(){
        // Insert - To insert data in salesforce org
        
        List<Account> accList = new List<Account>();
        
        for(integer i = 1; i <= 20; i++){
            Account a = new Account(Name = 'Test Account ' + i);
            accList.add(a);
        }
        
        insert accList;
    }
    
    public static void updateList(){
        // Update - To update data already present in database
        List<Account> updList = [Select Id, Name from Account where name like 'Test%'];
       	
        for(Account acc: updList){
            acc.Name = 'Update' + acc.Name;
        }
        
        update updList;
    }
    
    public static void upsertList(){
        // Upsert - To update already present data and insert new data
        List<Account> records = [Select Name from Account where Name like '%Test%'];
        
        for(Account ac: records){
           	ac.Name = 'Upsert' + ac.Name;
        }

        for(Integer i = 0; i < 10; i++){
           	Account ac = new Account(Name = 'Upsert Account ' + i);
            records.add(ac);
        }
        
        upsert records;
    }
    
    
    public static void deleteList(){
        
        // Delete - To delete the accounts present with passed identity
        List<Account> records = [Select Name, NumberOfEmployees from Account where Name like '%Test%'];
        
        delete records;
        
    }
    
    public static void undeleteList(){
        
        // Undelete - To recover all records from recycle bin
        List<Account> records = [Select Name from Account where isDeleted = True All Rows];
        
        undelete records;
    }
    
    public static void mergeList(){
        
        // Merge - To merge specific records together
        List<Account> records = [Select Name, NumberOfEmployees from Account where Name like '%Test%'];
        
        // Only 2 records can be merged at a single time
        merge records[0] records[1];
        
        // Different Merging Combinations -
        // -> sObject with sObject
        // -> sObject with List<sObject>
        // -> sObject with ID
        // -> sObject with List<ID>
    }
    
    public static void idFetch(){
        
        // When we are tryin to create an account and asscoiate contact with it, 
        // we need to keep in mind that before inserting an account, there is no
        // Id asscociatd to it , but after inserting it to the database, we can use the id
        // associated to it from the reference we created
        
        Account tempAccount = new Account(Name = 'Temp Account', NumberOfEmployees = 100);
        insert tempAccount;
        
        Contact tempContact = new Contact(FirstName = 'Kishori', LastName = 'Lal Brijwasi', AccountId = tempAccount.Id);
        insert tempContact;
    }
    
}