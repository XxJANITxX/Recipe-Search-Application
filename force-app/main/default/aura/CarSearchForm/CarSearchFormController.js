({
	// ---- Do Init method ---- //
    doInit : function(component, event, helper) {
   		// Will fetch the car type from the backend using apex controller
   		
       	helper.handleCarTypeFetch(component, helper);
        
        // alert("Init method worked successfully");
    },
    
    
    // ---- On Search Function (First funtion for practice purpose) ---- //
    // First time use of function through controller function
    onSearchClick : function(component, event, helper) {
		alert('On Search function is working successfully !');
        helper.handleOnSearchClick(component, event, helper);
	}
    ,
    
    // ----- New Value Selected ----- //
    // Function to handle option selected dropdown list
    // This function will get triggered on any change in the list
    newValueSelected : function(component, event, helper) {
   		
        // Finding elements through ID  
        var carTypeName = component.find("carTypeList").get("v.value");        
        alert("Value of Selected Car Type - " + carTypeName);
	},
    
    
    //----- Create Record method ----- //
    createRecord: function(component, event, helper){
        let createCarRecord = $A.get("e.force:createRecord");
        
        createCarRecord.setParams({
            "entityApiName": "Car_Type__c"
        });
        
        createCarRecord.fire();
    },
    
    // (---- Not in use ----)
    // ---- Handle render method ---- // (-----Not in use-----)
    handleRender : function(component, event, helper) {
   		// Temporary render function to understand render functionality
        alert("Handle Render worked successfully");
    },
    
    // ---- Toggle button function ---- //  (-----Not in use-----)
    // Created toggle to add or remove button based on true or false
    toggleButton : function(component, event, helper) {
        // Getting value of the isNewAvailable attribute in controller file
        let currentVal = component.get('v.isNewAvailable');
        
        // Checking whether the current value is true or false
        // And setting the opposite value of that in the dsame component
        if(currentVal){
            component.set('v.isNewAvailable',false);
        }else{
            component.set('v.isNewAvailable',true);
        }
	}
    
    /*
    reference code -
    var carTypeId = component.find("carType").get("v.value");
    var createBoatRecord = $A.get("e.force:createRecord");
    */
    
    /*
    * Init and render methods are similar to document.onload in javascript
    * Init method runs before handle render method.
    * Init method runs only once when the document is loaded
    * Render method runs every time some change occurs in the document
    * 'v' - View or value provider (for client side in component controller)
    * 'c' (in component markup) - Client Side Controller
    * 'c' (in client side controller/helper) - Server Side Controller
    */
})