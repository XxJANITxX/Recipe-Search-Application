@RestResource(urlMapping = '/Opportunities/*')
global with sharing class OpportunityManager {
    
    @HttpPost
    global static ID createOpportunity(String name, String stage, String closedate, String source){
        Opportunity newOpportunity = new Opportunity(name=name,
                                                    stageName=stage,
                                                    leadSource=source,
                                                    closedate=Date.valueOf(closeDate));
        insert newOpportunity;
        return newOpportunity.Id;
    }

    @HttpGet
    global static void doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        // Process the GET request
        String requestId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        
        // Example response data
        Map<String, String> responseData = new Map<String, String>();
        responseData.put('requestId', requestId);
        
        // Return response
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(JSON.serialize(responseData));
    }

    @HttpPut
    global static ID upsertOpportunity(String name, String stage, String closedate, String source, String id){
        Opportunity thisOpportunity = new Opportunity(Id = id, 
        name = name,
        stageName = stage,
        leadSource = source,
        closeDate = Date.valueOf(closeDate));

        // Match Opportunity by Id, if present.
        // Otherwise, create new Opportunity

        upsert thisOpportunity;
        // Return the opportunity Id
        return thisOpportunity.Id;
    }

    @HttpPatch
    global static ID updateOpportunityFields(){
        RestRequest request = RestContext.request;
        String OpportunityId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        Opportunity thisOpportunity = [Select Id, Name, LeadSource from Opportunity where Id =: OpportunityId];

        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());

        // Iterate throguh each paramter field and value
        for(String fieldName: params.keySet()){
            // Set the field and value on the Opportunity sObject
            thisOpportunity.put(fieldName, params.get(fieldName));
        }

        update thisOpportunity;
        return thisOpportunity.Id;
    }
}