import { LightningElement } from 'lwc';

export default class ParentComponentApi extends LightningElement {
    
    parentInput; 
    
    handleChange(event){
        this.parentInput = event.target.value;
        this.emptyChildProperty();
    }

    emptyChildProperty(){
        this.template.querySelector('c-child-component-api').childMethod();
    }
}