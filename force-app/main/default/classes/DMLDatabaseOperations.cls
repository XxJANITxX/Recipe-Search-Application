public with sharing class DMLDatabaseOperations {
    public DMLDatabaseOperations() {

    }

    public void insertOperation(){
        List<Account> ac = new List<Account>{new Account(Name = 'Test Account'), new Account(Name = 'Test Account 2')};

        Database.SaveResult[] lsr = Database.insert(ac, false);
        
        for(Database.SaveResult l: lsr){
            System.debug(l.isSuccess());
            System.debug(l.getErrors());
        }
    }

    public void updateOperation(){
        List<Account> ac = [Select Id, Name, AnnualRevenue from Account where name like 'Test Account%'];
        
        for(Account a: ac){
            a.AnnualRevenue = 75000000;
        }

        Database.SaveResult[] saveResult = Database.update(ac, false);

        for(Database.SaveResult l: saveResult){
            if(l.isSuccess()){
                System.debug('Success Update');
            }else{
                System.debug('Update Failed');
            }
        }
    }

    public void upsertOperation(){
        List<Account> ac = [Select Id, Name, NumberOfEmployees from Account where name like 'Test Account%'];
        
        ac.add(new Account(Name = 'Test Account 3'));

        for(Account a: ac){
            a.NumberOfEmployees = 1000;
        }

        Database.UpsertResult[] results = Database.upsert(ac, false);

        for(Database.UpsertResult res: results){
            if(res.isSuccess()){
                System.debug('Successfully Upserted');
            }else{
                System.debug('Upsert Failed');
            }
        }
    }

    public void mergeOperation(){
        List<Account> ac = [Select Id, Name from Account where name like 'Test Account%'];

        Database.MergeResult result = Database.merge(ac[0], ac[1]);
        
        if(result.isSuccess()){
            System.debug('Successfully merged');
        }else{
            System.debug('Merge Failed');
        }

    }

    public void deleteOperation(){
        Database.DeleteResult result = Database.delete([Select Id from Account where name like 'Test Account 3' limit 1].Id);
        if (result.isSuccess()){
            System.debug('Successfully deleted');
        }else{
            System.debug('Deletion Failed');
        }
    }

    public void undeleteOperation(){
        List<Account> deletedAccount = [Select Id from Account where isDeleted = true All rows];
        System.debug(deletedAccount);
        Database.UndeleteResult result = Database.undelete(deletedAccount[0]);

        if(result.isSuccess()){
            System.debug('Successfully UnDeleted');
        }else{
            System.debug('Undeletion Failed');
        }
    }
}