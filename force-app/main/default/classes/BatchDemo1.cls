global class BatchDemo1 implements Database.Batchable<sObject>{
    private Integer magicNum = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('In the start method');
        return Database.getQueryLocator('Select Id, Name from Account');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        
        System.debug('In the execute method');
        
        magicNum = scope.size();
        for(Integer i = 0; i < scope.size(); i++){
            System.debug(scope[i]);
        }
        System.debug('Magic Value = '+magicNum);
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('In the finish method');
        System.debug('Magic num - ' + magicNum);
    }
}


// To execute batch method, use following script -
// BatchDemo1 bd = new BatchDemo1();
// 
// Execute batch method can also be changed with another method
// Database.executeBatch(bd);
// Database.executeBatch(bd, batchSize);