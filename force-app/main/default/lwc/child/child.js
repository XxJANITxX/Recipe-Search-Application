import { LightningElement, api} from 'lwc';

export default class Child extends LightningElement {
    
    // Video 16
    uppercaseItemName = 'Default value';

    // child component of video 16
    // @api decorator is used to make the property public for 
    // parent component
    @api
    get itemName(){
        return this.uppercaseItemName;
    }

    set itemName(value){
        this.uppercaseItemName = value.toUpperCase();
    }

    // Video 17
    // This property is provate till the time @api is not used
    @api
    firstName = "Sanjay";
}