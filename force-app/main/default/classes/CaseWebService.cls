// This is a restful class api used to simply send the data from the org
// 
// This was created to be saved in another organisation

@RestResource(urlMapping='/Cases/*')
global class CaseWebService {
    @HttpGet
    global static List<Case> getCaseById(){
        RestRequest request = RestContext.request;
        
        // Grab the caseId from the end of the URL
                
        List<Case> result = [Select CaseNumber, Subject, 
                       Status, Origin, Priority From
                      Case Limit 10];
        
        return result;
    }
    
    @HttpPost
    global static Id createCase(String subject, String status,
                                String origin, String priority){
        Case thisCase = new Case(
            Subject=subject,
            Status=status,
            Origin=origin,
            Priority=priority
        );
        
        insert thisCase;
        return thisCase.Id;
    }
    
    @HttpDelete
    global static void deleteCase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/') + 1);
        
        Case thisCase = [Select Id from Case Where Id =: caseId];
        delete thisCase;
    }
    
    @HttpPut
    global static Id upsertCase(String subject, String status,
                                String origin, String priority, 
                                String id){
         Case thisCase = new Case(
             Id = id,
             Subject = subject,
             Status = status,
             Origin = origin,
             Priority = priority);
                                    
         upsert thisCase;
                                    
         return thisCase.Id;
                                    
    }
    
    @HttpPatch
    global static ID updateCaseFields(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/') + 1);
        
        Case thisCase = [Select Id From Case Where Id =: caseId];
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        for(String fieldName: params.keySet()){
            thisCase.put(fieldName, params.get(fieldName));
        }
        
        update thisCase;
        return thisCase.Id;
    }
}