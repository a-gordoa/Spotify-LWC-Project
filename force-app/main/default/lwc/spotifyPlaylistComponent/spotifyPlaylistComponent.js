import { LightningElement } from 'lwc';

export default class SpotifyPlaylistComponent extends LightningElement {

    //togVal = this.template.querySelector('lightning-input').value; 
    toggleValue = false;
    
    handleToggle(event){
        this.toggleValue = event.detail.checked;


    }

    showModal = false;

    showModalHandler(event){

        if (this.showModal === false) {
            this.showModal = true;
        } else {
            this.showModal = false;
        }

    }
}