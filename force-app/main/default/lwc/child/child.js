import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {
    @api childPercent;

    get customStyle(){
        return `background-color:red; min-height:50px; width:${this.childPercent}%; min-width: 10%`;
    }
}