import { LightningElement } from 'lwc';
import createPlaylist from '@salesforce/apex/SpotifyAPIRequest.createPlaylist';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';
import addOrDeleteTracksFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.addOrDeleteTracksFromPlaylist';

export default class PlaylistCreatorInitialInput extends LightningElement {
    
    // Values to store the ID and Name for the playlst the user created
    createdPlaylistID;
    createdPlaylistName;
    newlyCreatedPlaylist; //PlaylistClass object

    // stored values that are loaded via the connectedCallback() to be passed
    // to Spotify when making calls to the API
    access_token;
    error;

    counterToSend = 0;

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

    // these are the Spotify user ID's that can be passed into the CreratePlaylist method. 
    appAccountID = '31xsewkexphjzpb4zw2kk3yitrcq'; 
    personalAccountID = '12820729'; 
    submitted = false;
    handlePlaylistSubmit(){
        this.submitted = true;
        
        createPlaylist({name: this.playlistName, description: this.playlistDescription ,  publicBool: this.playlistPublicCheckbox,  spotUserId: this.personalAccountID,  token: this.access_token})
            .then((result) => {
                
                // Assigns the returned List<PlaylistClass> to a local object.
                // The newlyCreatedPlaylist contains an id and name value
                this.newlyCreatedPlaylist = result[0];

                this.error = undefined;

                console.log('Made it to result ' + JSON.stringify(this.newlyCreatedPlaylist))

                // --------------
                let uriObj = {uris:['spotify:track:1flWFiusGKhIaewrTnCYGO']};
                let uriString = JSON.stringify(uriObj);


                addOrDeleteTracksFromPlaylist({playlstId: this.newlyCreatedPlaylist.id , uriList: uriString, AccessToken: this.access_token, add_or_delete: 'add'})
                .then(result=>{
                    // sends info in the detail object of the custom event to 
                    // playlistCreator component, so that it can be transfered to the 
                    // embededPlaylist child component 
                    const playlistCreatedEvent = new CustomEvent('playlistcreated', 
                    {detail: 
                        {
                            id : this.newlyCreatedPlaylist.id,
                            iframeURL : String('https://open.spotify.com/embed/playlist/' + this.newlyCreatedPlaylist.id),
                            name : this.newlyCreatedPlaylist.name
                        }
                    });
                    this.dispatchEvent(playlistCreatedEvent);

                })
                .catch(error=>{
                    console.log('addOrDeleteTracksFromPlaylist Error message: ' + error.message + 'error name: ' + error.name + 'error stack: ' + error.stack);
                    this.newlyCreatedPlaylist = undefined;
                    
                })

                // - ---------------



            })
            .catch((error) => {
                console.log('CreatePlaylist Error message: ' + error.message + 'error name: ' + error.name + 'error stack: ' + error.stack);
                this.newlyCreatedPlaylist = undefined;
            });
    }

    




}