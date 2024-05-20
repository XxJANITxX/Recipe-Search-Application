public class HttpCalloutDemo {
    
    public static void demoCallout(){
        // Making an http callout instanse
		Http http = new Http();

		// Setting request instanse by filling requirements
		HttpRequest request = new HttpRequest();
		request.setEndPoint('https://api.spoonacular.com/recipes/random?apiKey=2097a1960ad64ea8ad321e3a8d317690');
		request.setMethod('GET');

		// Passing request instanse in http callout send method
		// to get a response from the requested server
		HttpResponse response = http.send(request);

		// All respones methods will give the data from 
		if(response.getStatusCode() == 200){
    		System.debug('Response - '+response.getBody());
		}else{
    		System.debug('Response Code - '+response.getStatusCode());
		}
    }
    
    public void importantNotes(){
        // Any http call won't work till the time, it is not authorized in salesforce org and will give an error
        // i.e. you have to add that end point to salesforce org
        // 
        // Inorder to do so,
        // * Go to Setup
        // * Go to Remote Site Settings
        // * Click new remote site
        // * Enter details ( You can add the hostname only - https://googleapi.com )
        // * Click active checkbox
        // 
        // - When creating an end-point, if we are trying to pass some parameters
        // We first need to use the ? symbol and after that, we need to pass the 
        // parameters using the & symbol as follows ->
        // 
        // https://github.com/janitgarg?apiKey=edcndenc&name=janit
        // 
    }
}