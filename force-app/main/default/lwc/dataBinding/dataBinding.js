import {LightningElement } from 'lwc';
export default class DataBinding extends LightningElement {

    oneWayBinding = 'One Way Binding';
    twoWayBinding = 'D';

    callOnChange(event){
        this.twoWayBinding = event.target.value;
    }
}

