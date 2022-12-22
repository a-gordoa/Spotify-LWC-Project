import { LightningElement, api } from 'lwc';
import calloutForAccessAndRefreshToken from '@salesforce/apex/SpotifyAPIRequest.calloutForAccessAndRefreshToken';
import createPlaylist from '@salesforce/apex/SpotifyAPIRequest.createPlaylist';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';



export default class PlaylistCreator extends LightningElement {


    // Handles the event from the child component passing in the 
    // id/token for the playlist created by the user

    playlistToken;

    iframeURL;

    doneLoading;

    songCounterForEmbed;



    handleCreatedPlaylist(event){
        
        // assigns the object values from the playlistcreated 
        // custom event that was sent from playlistCreatorInitialInput.js
        this.playlistToken = event.detail.id;
        console.log('Parent JS file. Token: ' + this.playlistToken);
        this.iframeURL = event.detail.iframeURL;
        this.doneLoading = true;

    }

    handleCounter(event) {
        this.iframeURL = event.detail;
        console.log(' Counter inside PlaylistCreatr event receiver ' + this.iframeURL);
    }


}