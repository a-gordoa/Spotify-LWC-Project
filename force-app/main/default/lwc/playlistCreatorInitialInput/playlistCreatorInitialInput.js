import { LightningElement, wire } from 'lwc';
import calloutForAccessAndRefreshToken from '@salesforce/apex/SpotifyAPIRequest.calloutForAccessAndRefreshToken';
import createPlaylist from '@salesforce/apex/SpotifyAPIRequest.createPlaylist';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';

export default class PlaylistCreatorInitialInput extends LightningElement {


    // stored values that are loaded via the connectedCallback() to be passed
    // to Spotify when making calls to the API
    access_token;
    error;

    // Calls the SpotifyRequestAPI class to get a refreshed Access Token from Spotify when the
    // component loads
    connectedCallback() {
        getRefreshedAccessToken()
        .then(result =>{
            this.access_token = result[0];
            console.log('result = ' + result);
            console.log('this.access_token = ' + this.access_token);
        })
        .catch(error=>{
            this.error = error;
            console.log(error);
        })
    }


    // Parameters to be filled for the createPlaylist method
    playlistName;
    playlistDescription;
    playlistPublicCheckbox = true;

    handlePlaylistName(event){
        this.playlistName = event.target.value;
    }

    handlePlaylistDescription(event){
        this.playlistDescription = event.target.value;
    }

    newlyCreatedPlaylist;
    createPlaylistError;
    appAccountID = '31xsewkexphjzpb4zw2kk3yitrcq'; 
    personalAccountID = '12820729'; 
    submitted = false;
    handlePlaylistSubmit(){
        this.submitted = true;
        
        createPlaylist({name: this.playlistName, description: this.playlistDescription ,  publicBool: this.playlistPublicCheckbox,  spotUserId: this.personalAccountID,  token: this.access_token})
            .then((result) => {
                console.log()
                console.log('PL should be created');
                this.newlyCreatedPlaylist = result;
                this.error = undefined;
                console.log('PL '+this.newlyCreatedPlaylist);
                console.log('PL Name '+this.newlyCreatedPlaylist.name);
            })
            .catch((error) => {
                console.log('!!!!!error message: ' + error.message + 'error name: ' + error.name + 'error stack: ' + error.stack);
                this.createPlaylistError = error;
                this.newlyCreatedPlaylist = undefined;
            });
            console.log('MADE IT2');
    }

    




}