public with sharing class SalesforceConnect {
    
    // This class is regarding fetching the data from other salesforce org ( jacobAndCompany )
    public static String getCasesFromSalesforceOrgB(){
        // Making an http callout instanse
		Http http = new Http();

		// Setting request instanse by filling requirements
		HttpRequest request = new HttpRequest();
		// request.setEndPoint('https://jacobandcompany-dev-ed.develop.my.salesforce.com/services/apexrest/Cases');
		// request.setMethod('GET');
        // request.setHeader('Authorization','Bearer !AR4AQIK5Wsx9ya4zDglyqz7o8HtGV3niLsZ3mpMm9POP6u3f46iB3bXC0L_HDX_98QwTIQa5T0OEsLmb6b7l_MW8HIt3zNBb');

        request.setEndpoint('callout:SFDCB/services/apexrest/Cases');
        request.setMethod('GET');
        
		// Passing request instanse in http callout send method
		// to get a response from the requested server
		HttpResponse response = http.send(request);

		// All respones methods will give the data from 
		if(response.getStatusCode() == 200){
            List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            
            for(Object result: results){
                Map<String, Object> caseProps = (Map<String, Object>) result;
                System.debug('CaseNumber: ' + caseProps.get('CaseNumber') + ' - Subject: ' + caseProps.get('CaseNumber'));
            }
    		return response.getBody();
		}
        
        return '';
    }
    
    public static void createCaseInSalesforceOrgB(){
        // Making an http callout instanse
		Http http = new Http();

		// Setting request instanse by filling requirements
		HttpRequest request = new HttpRequest();
		
        request.setEndpoint('callout:SFDCB/services/apexrest/Cases');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json; charset=UTF-8');
        request.setBody('{"subject":"Case from Salesforce Org A","status":"New","origin":"Phone","priority":"Medium"}');
        
		// Passing request instanse in http callout send method
		// to get a response from the requested server
		HttpResponse response = http.send(request);

		// All respones methods will give the data from 
		if(response.getStatusCode() == 200){
    		System.debug(response.getBody());
		}        
    }
    
    // Notes -> 
    // * The session ID of an org can be used as Authorization - bearer token in the other org
    // * Inorder to get the session-id from salesforce
    // * Use the following code in apex - 
    // -> System.debug(System.UserInfo.getSessionId().substring(15));
    // 
    // * You also need to get the URI which can be used to fetch the data from org
    // * This url can be fetched using the following code
    // * System.debug(System.URL.getOrgDomainUrl());
}