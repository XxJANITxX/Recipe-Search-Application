({
	handleOnSearchClick : function() {
        alert('On Search Helper function is working successfully !');
	}
    ,
    
    handleCarTypeFetch : function(component, helper) {	
        let action = component.get("c.getCarTypes");
    	
    	action.setCallback(this, function(data){
    		let state = data.getState();
    		if(state === "SUCCESS"){
    			component.set("v.carTypes", data.getReturnValue());
			}else if(state === "ERROR"){
    			alert("Unknown Error");
			}
		});
		$A.enqueueAction(action);
	}
})