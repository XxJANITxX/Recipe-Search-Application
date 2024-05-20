public with sharing class SoqlQueries {
    
    // To fetch data based on single string
    public static List<Account> fetchString(String s){
        return [Select Fields(Standard) from Account where Name = :s limit 200];
    }
    
    // Fetching data based on the names present in a list (Using 'in' and 'not in' keywords)
    public static void fetchDataCompareList(){
        List<String> brandNames = new List<String>{'Volkswagon', 'Genepoint'};
        List<Account> accounts = [Select Name, NumberOfEmployees from Account where Name Not in :brandNames];
        System.debug(accounts);
    }
    
    // Fetching data using like keyword where data is present in different formats
    public static void fetchDataLike(){     
        List<Account> accounts1 = [Select Name, NumberOfEmployees from Account where Name like '%Oil%'];
        List<Account> accounts2 = [Select Name, NumberOfEmployees from Account where Name like '%Oil'];
        List<Account> accounts3 = [Select Name, NumberOfEmployees from Account where Name like '_Oil'];
        System.debug(accounts1);
        System.debug(accounts2);
        System.debug(accounts3);
    }
    
    
    // Fetching data using 'and' & 'or' keyword
    public static void fetchDataAnd(){
        
        List<Account> accounts = [Select Name, NumberOfEmployees 
                                  from Account where Active__c = 'Yes' 
                                  And AnnualRevenue >= 1000 ];
        System.debug(accounts);
    }
    
    public static void fetchDataOr(){
        
        List<Account> accounts = [Select Name, NumberOfEmployees 
                                  from Account where Active__c = 'Yes' 
                                  or AnnualRevenue >= 1000 ];
        System.debug(accounts);
    }
    
    // Fetching Data using 'order by' keyword
    
    public static void fetchDataOrderby(){
        List<Account> accounts1 = [Select Name, AnnualRevenue from Account order by AnnualRevenue asc ];
        List<Account> accounts2 = [Select Name, AnnualRevenue from Account order by AnnualRevenue desc ];
        List<Account> accounts3 = [Select Name, AnnualRevenue from Account order by AnnualRevenue asc nulls last];
        List<Account> accounts4 = [Select Name, AnnualRevenue from Account order by AnnualRevenue desc nulls first];
        
        System.debug(accounts1);
        System.debug(accounts2);
        System.debug(accounts3);
        System.debug(accounts4);
    }
    
    // Aggregate Results 
    public static void aggregateResults(){
        AggregateResult ar1 = [Select Count(Name) from Account];
        AggregateResult ar2 = [Select Avg(AnnualRevenue) from Account];
        AggregateResult ar3 = [Select Sum(AnnualRevenue) from Account];
        AggregateResult ar4 = [Select Min(AnnualRevenue) from Account];
        AggregateResult ar5 = [Select Max(AnnualRevenue) from Account];
        System.debug(ar1.get('expr0'));
        System.debug(ar2.get('expr0'));
        System.debug(ar3.get('expr0'));
        System.debug(ar4.get('expr0'));
        System.debug(ar5.get('expr0'));
        System.debug(' ');
    }
    
    
    // Getting data through group by and aggregate functions
    public static void groupBy(){
        List<AggregateResult> li1 = [Select Count(Id),StageName from Opportunity group by StageName];
        List<AggregateResult> li2 = [Select StageName from Opportunity group by StageName];
        List<AggregateResult> li3 = [Select Count(Id) from Opportunity group by StageName];
        List<AggregateResult> li4 = [Select Max(Amount),StageName from Opportunity group by StageName];
        System.debug(li1);
        System.debug(li2);
        System.debug(li3);
        System.debug(li4);
    }
    
    // Getting limited data using LIMIT
    public static void limitData(){
        List<Account> a1 = [Select Name from Account limit 15];
        Account a2 = [Select Name from Account limit 1];
        
        System.debug(a1);
        System.debug(a2);
    }
    
    // Locking Data using for update 
    // Data will be locked till the time, execution of the function gets completed
    public static void forUpdate(){
        List<Account> li = [Select Name from Account for update];
    }
    
    // To fetch records present in the recycle bin of the org, use 'All rows'
    public static void allRows(){
        List<Account> rows = [Select Name from Account ALL ROWS];
        System.debug(rows);
        
        // If we want to get all the rows present in recycle bin, we must use the 'All Rows' Keyword
        List<Account> deleted = [Select Name from Account where isDeleted = True ALL ROWS];
        System.debug(deleted);
    }
    
    
    // To fetch parents data from child record
    public static void childToParent(){
    List<Contact> contacts = [Select Name, Account.Name, Account.AnnualRevenue from Contact];
        System.debug(contacts);
        
        // To describe the custom relations between child and parent, we use __r with the custom object
        // List<Test_Object_2__c> records = [Select Test_Object__r.Name from Test_Object_2__c];
        // System.debug(records);
    }
    
    // Fethcing data from parent to child
    public static void parentToChild(){
        List<Account> accounts = [Select Name, (Select Name, Email from Contacts) from Account];
        System.debug(accounts);
        
        // When fetching data from parent to child, Remember to use child relationship name 
        // (present in the object details) instead of actual name
        // don't forget to use __r for referring to child or parent relationship of a custom object
        
        // List<Test_Object__c> records = [Select Name, (Select Name from Test_Objects_2__r) from Test_Object__c];
        // System.debug(records);

    }

  // To fetch data from child to grand parent and more   
    public static void fetchGrandParentRelation(){
        
        List<OpportunityLineItem> records = [Select Name, Opportunity.Name, Opportunity.Account.Name from OpportunityLineItem];
        
        // Iteration over Opportunity line item list and fetching the data from it using for loop
        for(OpportunityLineItem op: records){
            System.debug('Opportunity Item - ');
            System.debug(op.Name);
            System.debug(op.Opportunity.Name);
            System.debug(op.Opportunity.Account.Name);
        }
        
        // For Custom Objects
        // List<Test_Object_2__c> testRecords = [Select Name, Test_Object__r.Name,
        //                                      Test_Object__r.Account__r.Name from Test_Object_2__c ];
        // for(Test_Object_2__c op: testRecords){
        //     System.debug('Test Records - ');
        //     System.debug(op.Name);
        //     System.debug(op.Test_Object__r.Name);
        //     System.debug(op.Test_Object__r.Account__r.Name);
        // }
        
        // For parent to grand-child data fetch, one cannot make subquery in subquery
        // Note - Select Name,( (Select Name from OpportunityLineItem) from Opportunity)  from Account
        // This is not allowed
    }
    
    // Dynamic Ql means, creating the query at runtime and fetching data based on that
    public static void dynamicQl(){
        String sr = 'Select Name from Account';
        List<sObject> records = Database.Query(sr);
        System.debug(records);
        
        // Now, this query can be created by any means 
    }
    
}