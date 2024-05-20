trigger InvoiceTrigger on Invoice_Line_Item__c (after insert, after update) {
    
    Id invoiceId = Trigger.New[0].Invoice__c;
	Invoice__c lic = [Select Id, Total_Amount__c from Invoice__c where Id =: invoiceId limit 1];
    
    
    for(Invoice_Line_Item__c ili: Trigger.New){
        lic.Total_Amount__c += Trigger.New[0].Price__c;
    }
    
    
    update lic;
}