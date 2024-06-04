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
        // -> Understanding URL Usage and connectivity -
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
        // We first need to use the '?' symbol and after that, we need to pass the 
        // parameters using the '&' symbol as follows ->
        // 
        // https://github.com/janitgarg?apiKey=edcndenc&name=janit
        // 
        // * Some important classes of in this org for integration ->
        // - SalesforceConnect.apxc
        // - Sponacular_Class.apxc
        // - CaseWebService.apxc
        // - HttpCalloutDemo.apxc
        // - OpportunityManager.apxc
        // 
        // -> Connecting two salesforce orgs ->
        // 
        // When connecting two salesforce orgs, there are two ways ->
        // 
        // * Either you can get the session-id (as authorization token), and can use it everytime while requesting 
        // to the endpoint. But, this will require you to get the session-id everytime the org is refreshed.
        // 
        // * Other way is to make authorization automatic, this can be done by following method ->
        // 		* Create a connected app in salesforce org B
        // 			* Enable Auth 
        // 			* Give proper access and permissions required
        // 		* Now, Authorize the app in salesforce org A
        // 			* Select the provider first
        // 			* Go to auth providers and enter the following details
        // 			* Consumer Key, Consumer Secret, Name
        // 			* Then save
        // 		* After creating the auth provider, you are going to get the Callback url, this callback url is going to get
        // 		saved in the salesforce org B.
        // 		
        // 		* Now, you have to create a named credential in salesforce org A. This will include endpoint from Salesforce org B.
        // 		Named Credentials in Salesforce provide a secure and streamlined way to manage authentication details for making HTTP callouts to external systems. 
        //			* Check the website bookmarked on how to connect the two orgs in salesforce.
        //			
        //		* After saving and authorizing, simply make the changes to the Http Call.
        //			* Change the URL of the website to - callout:Name_on_Name_Credential/services/apexrest/Object_name';
        //			* Make the 'Get' request.
    }
}