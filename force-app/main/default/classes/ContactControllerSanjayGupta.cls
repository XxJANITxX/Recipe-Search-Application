public with sharing class ContactControllerSanjayGupta {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String contactId){
        try {
            return [Select Id, Name 
            from Contact 
            where Id=:contactId
            limit 1
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}