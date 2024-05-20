public class FutureMethodDemo4 {
    public void invokeFutureCall(){
        String primitiveValue = 'Input to future method';
        List<String> listOfPrimitiveValue = new List<String>{primitiveValue};
         
        // Account accountRec = [Select Id, Name from Account limit 1][0];
        // System.debug('accountList: ' + accountRec);
        
        futureMethod1(listOfPrimitiveValue);
        futureMethod2();
        futureMethod3();
    }
    
    @future(callout = true)
    public static void futureMethod1(List<String> inputParam){
        System.debug('Inside futureMethod1');
        System.debug('Input param: ' + inputParam);
    }
    
    
    @future
    public static void futureMethod2(){
        System.debug('Inside future Method 2');
    }
    
	@future
    public static void futureMethod3(){
        System.debug('Inside future Method 3');
    }
	
}