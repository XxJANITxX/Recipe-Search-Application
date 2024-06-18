public with sharing class ContactController2SanGup {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId){
        try {
            return [Select AccountId, Id, FirstName, LastName
            from Contact 
            where AccountId =: accId
            With SECURITY_ENFORCED
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}