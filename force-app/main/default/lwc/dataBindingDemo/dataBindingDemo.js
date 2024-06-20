import { LightningElement, track } from 'lwc';

export default class DataBindingDemo extends LightningElement {
    
    // This is data binding through property
    // To use variables in the html page, we created private variable - Video 12
    greeting = 'Sanjay';
    
    
    // This function handles data passed as input in the lightning-input element - Video 12
    handleChange(event){
        this.greeting = event.target.value;
    }
    
    // This variables are of video 13
    firstName = '';
    lastName = '';
    
    // This is data binding through getters video 13
    handleChange2(event){
        const field = event.target.name;
        
        if(field === 'fname'){
            this.firstName = event.target.value;
        }else if(field === 'lname'){
            this.lastName = event.target.value;
        }
    }

    // Getter to deal with upper case full name
    get upperCasedFullName(){
        return `${this.firstName} ${this.lastName}`.toUpperCase();
    }

    // When you create a getter of a value, you won't crete a variable for that
    // And this is because, the value will not reflect any change.
    

    // Video 14
    greet = 'Hello There';

    handleClick(event){
        this.greet = this.template.querySelector("lightning-input").value;
    }

    // Video 15
    firNa = '';
    lasNa = '';

    handleClick2(event){
        let input = this.template.querySelectorAll("lightning-input");

        input.forEach((element)=> {
            if(element.name == 'frname' ){
                this.firNa = element.value;
            }else if(element.name == 'laname'){
                this.lasNa = element.value;
            }
        }, this)
    }
}