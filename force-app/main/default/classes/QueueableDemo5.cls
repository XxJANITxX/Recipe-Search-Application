public class QueueableDemo5 implements System.Queueable {
    public void execute(System.QueueableContext context){
        System.debug('Inside the execute method of Queueable Job');
        
        List<Account> listOfAccounts = new List<Account>([Select Id, Name from Account Limit 50]);
        System.debug('List of Accounts: '+listOfAccounts);
    }
}