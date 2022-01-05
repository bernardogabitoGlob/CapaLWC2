import { LightningElement } from 'lwc';

export default class Pokedex extends LightningElement {

    
    handleKeyUp(evt) {
        const isEnterKey = evt.keyCode === 13;
        if (isEnterKey) {
            this.queryTerm = evt.target.value;
        }
    }
}