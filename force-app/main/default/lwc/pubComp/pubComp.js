import { LightningElement} from 'lwc';
export default class PubComp extends LightningElement {
    greeting;
    handleInput(event){
        this.greeting = event.target.value;
    }
}