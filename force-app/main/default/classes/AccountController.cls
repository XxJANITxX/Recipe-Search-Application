public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)     
    public static List<Account> getHighRevenueAccounts(){
        return [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue > 500000000 Limit 5];
    }

    @AuraEnabled(cacheable=true)     
    public static List<Account> getHighRevenueAccountsPerCount(Integer count){
        return [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue > 500000000 Limit :count];
    }
}