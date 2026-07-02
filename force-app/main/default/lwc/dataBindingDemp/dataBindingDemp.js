import { LightningElement } from 'lwc';

export default class DataBindingDemp extends LightningElement {
 firstName = '';
 lastName = '';
 handleChange(event) {
    const field = event.target.name;
    if(field === 'firstname'){
        this.firstName= event.target.value;
    }
    else if(field === 'lastname'){
        this.lastName = event.target.value;
    }
 }

 get fullName(){
    return `${this.firstName} ${this.lastName}`.toUpperCase();
 }
}