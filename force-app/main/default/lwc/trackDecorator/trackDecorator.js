import { LightningElement, track } from 'lwc';

export default class TrackDecorator extends LightningElement {

    firstName = '';
    lastName = '';
    email = '';

    // This one will not change when there is a change in component
    studentData = {};

    // This one will change when there is a change in component
    @track reactiveStudentData = {};

    handleCFN(event){
        this.firstName = event.target.value;
        this.studentData.fn = event.target.value;
        this.reactiveStudentData.fn = event.target.value;
    }

    handleCLN(event){
        this.lastName = event.target.value;
        this.studentData.ln = event.target.value;
        this.reactiveStudentData.ln = event.target.value;
    }

    handleE(event){
        this.email = event.target.value;
        this.studentData.email = event.target.value;
        this.reactiveStudentData.email = event.target.value;
    }

}