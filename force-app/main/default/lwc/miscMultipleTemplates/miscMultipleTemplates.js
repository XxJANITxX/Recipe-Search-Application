import { LightningElement } from 'lwc';

// Video 21
// Importing two templates from this particular component folder
import templateOne from './templateOne.html';
import templateTwo from './templateTwo.html'

export default class MiscMultipleTemplates extends LightningElement {
    templateOne = true;

    // Whenever component load on the website, this render function executes
    render(){
        return this.templateOne ? templateOne : templateTwo;
    }

    switchTemplate(){
        this.templateOne = this.templateOne === true ? false : true;
    }
}