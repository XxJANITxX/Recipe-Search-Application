// This class is regarding fetching data from spoonacular api

public with sharing class Sponacular_Class {
    private static final string SPONACULAR_API = 'https://api.spoonacular.com';
    private static final string API_KEY = '2097a1960ad64ea8ad321e3a8d317690';
    
    @AuraEnabled(cacheable=true)
    public static String getRandomRecipes(){
        // Making an http callout instanse
		Http http = new Http();

		// Setting request instanse by filling requirements
		HttpRequest request = new HttpRequest();
		request.setEndPoint(SPONACULAR_API + '/recipes/random?apiKey=' + API_KEY);
		request.setMethod('GET');

		// Passing request instanse in http callout send method
		// to get a response from the requested server
		HttpResponse response = http.send(request);

		// All respones methods will give the data from 
		if(response.getStatusCode() == 200){
    		return response.getBody();
		}
        return '';
    }
    
    @AuraEnabled(cacheable=true)
    public static String getRecipe(String recipeId){
        Http http = new Http();

		HttpRequest request = new HttpRequest();
		request.setEndPoint(SPONACULAR_API + '/recipes/'+ recipeId + '/information?apiKey=' + API_KEY);
        request.setMethod('GET');

		HttpResponse response = http.send(request);

		if(response.getStatusCode() == 200){
    		return response.getBody();
		}
        
        return '';
    }
    
    @AuraEnabled(cacheable=true)
    public static String getRecipeByIngredient(String ingredients){
        // Making an http callout instanse
		Http http = new Http();

		// Setting request instanse by filling requirements
		HttpRequest request = new HttpRequest();
		request.setEndPoint(SPONACULAR_API + '/recipes/findByIngredients?apiKey=' + API_KEY + '&ingredients='+ingredients);
		request.setMethod('GET');

		// Passing request instanse in http callout send method
		// to get a response from the requested server
		HttpResponse response = http.send(request);

		// All respones methods will give the data from 
		if(response.getStatusCode() == 200){
    		return response.getBody();
		}
        
        return '';
    }
}