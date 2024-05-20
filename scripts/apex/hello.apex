// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

Map<String, Integer> mapsOf = new Map<String, Integer>();
mapsOf.put('key1', 12);
mapsOf.put('key2', 13);
mapsOf.put('key3', 14);

Integer value1 = mapsOf.get('key1');
System.debug(mapsOf);

// Http Request Code
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://www.googleapis.com/youtube/v3/search?key=AIzaSyB1F_PICJpyCapYDTQPRsrNutvXxpLNrUY&part=snippet&q=cars&maxResults=15');
request.setMethod('GET');

// Http Response Code
HttpResponse response = http.send(request);

// If the request is successful, parse the JSON response

if(response.getStatusCode() == 200){
    System.debug(response.getBody());

    YoutubeApiClass result = YoutubeApiClass.parse(response.getBody());
    
    for(YoutubeApiClass.Items itm: result.items){
        System.debug('Recieved the following statistics: ');
        System.debug(itm.statistics);
    }
}


if(response.getStatusCode() == 200){
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

    // Cast the values in the 'animals' key as a list
    List<Object> items = (List<Object>) results.get('items');

    for(Object item: items){
        Map<String, Object> childItems = (Map<String, Object>)items;
        System.debug('Recieved the following statistics :');
        System.debug(childItems.get('statistics'));
    }
}
