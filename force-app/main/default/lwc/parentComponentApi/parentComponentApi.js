import { LightningElement } from 'lwc';

export default class ParentComponentApi extends LightningElement {
    
    parentInput; 
    
    handleChange(event){
        this.parentInput = event.target.value;
    }
}