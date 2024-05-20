global class BatchDemo2Stateful implements Database.Batchable<sobject>, Database.Stateful{
    private Integer magicNum = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('In the start method');
        return Database.getQueryLocator('Select Id, Name from Account limit 50');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        
        System.debug('In the execute method');
        
        for(Integer i = 0; i < scope.size(); i++){
            System.debug(scope[i]);
        }
        magicNum += 5;
        System.debug('Magic Num = ' + magicNum);
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('In the finish method');
        System.debug('Magic num - ' + magicNum);
    }
}