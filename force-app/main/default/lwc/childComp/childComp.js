import { LightningElement, api } from 'lwc';
export default class ChildComp extends LightningElement{
 @api cName;
 @api cAge;


showConfirmation(event){
    let confirmMsg = "Details successfully displayed";
    const evt = new CustomEvent('confirm',{
        detail: {
            value: confirmMsg
        } 
    });
    this.dispatchEvent(evt);


 }
}
