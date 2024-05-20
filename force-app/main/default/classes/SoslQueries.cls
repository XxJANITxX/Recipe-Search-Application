public class SoslQueries {
    // In Apex
    // Basic Syntax - Find 'What' [What type] Returning [Where]
    // 
    // In Query Editor
    // Find {What} [What type] Returning [Where]
    
    public static void basicDataFetch(){
        // If writing in Query Editor -
        //    Find {John}
        // This will give result as where all the 
        // Name 'John' is present
        // 
        // Where ?
        // Find {John} Returning Account, Contact
        // 
        // What Type ?
        // find {John} in Name Fields 
        // Find {John} in Email Fields
        // 
        // Return which fields ?
        // Find {John} returning Account(Name, Phone), Contact(LastName), student__c(Name, Name__c)        
        
    }
    
    public static void apexProgramDataFetch(){
        // Get the records through SOSL Query in Apex (Id only)
        List<List<sObject>> records1 = [Find 'John' in All Fields returning Contact, Account];
        System.debug(records1);
        
        // Get the records through SOSL Query (with columns required)
        List<List<sObject>> records2 = [Find 'VolksWagon' returning 
                                        Account(Name, NumberOfEmployees),
                                        Opportunity(Name, Amount)];
        System.debug(records2);
        
        // looping through retrieved data after assigning it to List of different sObjects
        List<Account> accounts = records2[0];
        List<Opportunity> opportunities = records2[1];
        
        for(Account ac: accounts){
            System.debug(ac.Name);
            System.debug(ac.NumberOfEmployees);
        }
        
        for(Opportunity opp: opportunities){
            System.debug(opp.Name);
            System.debug(opp.Amount);
        }
        
        // Note: If we are trying to ask for data which is not fetched in query,
        // Then it will create run-time error
    }
    
    public static void searchGroups(){
        // Search groups are groups in which, the query of sosl find the asked term
        // These are of 5 types -
        // All Fields
        // Phone Number Fields
        // Email fields
        // Name fields
        // Sidebar fields
        
        List<List<sObject>> records1 = [Find 'John' in All Fields returning Opportunity(Name)];
        List<List<sObject>> records2 = [Find 'John' in Name Fields returning Contact(Name, AccountId, Phone)];
        List<List<sObject>> records3 = [Find 'John' in Email Fields returning Contact(Name, Email)];
        List<List<sObject>> records4 = [Find 'John' in Sidebar Fields returning Opportunity(Name)];
        List<List<sObject>> records5 = [Find '(512) 757-6000' in Phone Fields returning Contact(Name, Phone)];
        
        System.debug(records1);
        System.debug(records2);
        System.debug(records3);
        System.debug(records4);
        System.debug(records5);
    }
    
    // For finding data based on half information
    public static void wildCard(){
        
        System.debug('wild Card');
        List<List<sObject>> sList1 = [Find 'Univ*' In Name Fields Returning Account(Name), Contact(Name)];
        List<List<sObject>> sList2 = [Find 'Jo?n' Returning Account(Name), Contact(Name)];
        System.debug(sList1);
        System.debug(sList2);
    }
    
    // For using conditions in SOSL
    public static void clauses(){
          
        System.debug('Clauses');

        // We are using every clause we used in SOQL query
        List<List<sObject>> sList1 = [Find 'Univ*' returning Account(Name, BillingCountry Where CreatedDate < Today)];
        System.debug(sList1);
        
        List<List<sObject>> sList2 = [Find 'Test' returning Account(Name, Phone Where website!= null Order by Name Desc)];
        System.debug(sList2);
        
        List<List<sObject>> sList3 = [Find 'Univ*' returning Account(Name, BillingCountry Limit 50)];
    System.debug(sList3);
        // We are using limit clause to limit the data fetched for a particular object
        // We can define these clause for every object independently
    }
    
    // To fetch data dynamically using SOSL
    public static void dynamicSL(){
        System.debug('Dynamic SL');
        String quer = 'Find \'John\' returning Account(Name), Contact(Name)';
        List<List<sObject>> records = Search.query(quer);
        
        System.debug(records);
    }
}