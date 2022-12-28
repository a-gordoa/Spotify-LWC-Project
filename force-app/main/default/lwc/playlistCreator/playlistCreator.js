import { LightningElement, api, track } from 'lwc';
import calloutForAccessAndRefreshToken from '@salesforce/apex/SpotifyAPIRequest.calloutForAccessAndRefreshToken';
import createPlaylist from '@salesforce/apex/SpotifyAPIRequest.createPlaylist';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';



export default class PlaylistCreator extends LightningElement {

    
    playlistToken;

    // src for iframe
    iframeURL;

    // toggle for initial input component and track entry component
    doneLoading = false;

    // number that is appended to the end of the iframe src to force it to reload
    songCounterForEmbed;



    // Handles the event from the child component passing in the 
    // id/token for the playlist created by the user
    handleCreatedPlaylist(event){
        
        // assigns the object values from the playlistcreated 
        // custom event that was sent from playlistCreatorInitialInput.js
        this.playlistToken = event.detail.id;
        console.log('Parent JS file. Token: ' + this.playlistToken);
        console.log('handleCreatedPlaylist. this.iframeURL: ' + this.iframeURL);
        console.log('handleCreatedPlaylist. event.detail.iframeURL: ' + event.detail.iframeURL);
        this.iframeURL = event.detail.iframeURL;
        this.doneLoading = true;

    }

    handleCounter(event) {
        this.iframeURL = event.detail;
        console.log(' Counter inside PlaylistCreatr event receiver ' + this.iframeURL);
    }


}