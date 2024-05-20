trigger AccountTrigger on Account (before insert, before update, after update) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
        	System.debug('I am in before insert context');
    	}
    }    
    
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
        	System.debug('I am in before update context');
            
            for(Account acc: Trigger.new){
                System.debug('New name - ' + acc.Name);
                System.debug('Old name - ' + Trigger.oldMap.get(acc.Id).Name);
            }
    	}
        
        if(Trigger.isAfter){
            System.debug('I am in after update context');
            
            for(Account acc: Trigger.new){
                System.debug('New name - ' + acc.Name);
                System.debug('Old name - ' + Trigger.oldMap.get(acc.Id).Name);
            }
        }
    }
    
}