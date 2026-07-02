import {LightningElement} from 'lwc';
export default class ConditionalRendering extends LightningElement{
    isVisibility = true; 

    handleToggle(event){
        this.isVisibility = !this.isVisibility;

    }
}