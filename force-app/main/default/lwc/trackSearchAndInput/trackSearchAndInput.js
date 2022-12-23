import { api, LightningElement } from 'lwc';
import performSpotifySearch from '@salesforce/apex/SpotifyAPIRequest.performSpotifySearch';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';
import addTracksToPlaylist from '@salesforce/apex/SpotifyAPIRequest.addTracksToPlaylist';
import {createJSONforUris} from 'c/javascriptUtility';

export default class TrackSearchAndInput extends LightningElement {

    // Id for the playlist the user created in PlaylistCreatorInitialInput component
    @api
    playlistIdFromInputComp = '';

    access_token;

    // provides fresh access token as soon as component is loaded
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


    
    // counterToSend is used to append to the iframe src url in the "?n="paramter so that it refreshes after a new song is added
    counterToSend = 0;

    handleAddTrack(){
        console.log('Made it to handleAddTrack')

        // stores the rows from the datatable that the user selected
        var selectedTrackRowArray = this.template.querySelector('lightning-datatable').getSelectedRows(); 
        console.log('selectedTrackRowArray = ' + selectedTrackRowArray);

        // Utility function converts the obj from the datatable into a JSON that can be used as an argument for 
        // the spotify api
        var trackUriArg = createJSONforUris(selectedTrackRowArray);
        
        addTracksToPlaylist({playlstId: this.playlistIdFromInputComp, uriList: trackUriArg, AccessToken: this.access_token })
        .then(result=>{

            // clears out the search data in the datatable and search bar
            this.searchData =null;  
            let input = this.template.querySelector('lightning-input');
            input.value = '';

            //update iframe URL to appent counterToSend at the end so that it refreshes
            this.counterToSend ++;
            this.dispatchEvent(new CustomEvent('urlupdate', {detail: String('https://open.spotify.com/embed/playlist/'+this.playlistIdFromInputComp+'?n='+this.counterToSend)}))
        })
        .catch(error=>{
            // clears out the search data in the datatable and search bar
            this.searchData =null;
            let input = this.template.querySelector('lightning-input');
            input.value = '';

            alert('Error: ' + error.message + ' error name: ' + error.name);
            console.log('Add tracks to Spotify Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);
            
            this.counterToSend ++;
            this.dispatchEvent(new CustomEvent('urlupdate', {detail: String('https://open.spotify.com/embed/playlist/'+this.playlistIdFromInputComp+'?n='+this.counterToSend)}))
            console.log('Counter from event : ' + this.counterToSend);
            
        })

        
    }


    // holds the returned List<Track> result from the Spotifi callout performed in searchSpotifyForTracks()
    searchData;
    // calls apex class to search Spotify via their api
    searchSpotifyForTracks() {
        performSpotifySearch({userQuery: this.searchText, accessToken: this.access_token})
        .then(result=>{
            this.searchData = result;
        })
        .catch(error=>{
            console.log('searchSpotifyForTracks Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);
        })

    }

    // holds the search text until it is called by incrementSongCounter()
    searchText;
    handleSongTextInput(event) {
        this.searchText = event.target.value;
    }

    // columns for datatable
    columns = [
        { label: 'Song Name', fieldName: 'name' },
        { label: 'Artist', fieldName: 'primaryArtist' },
        { label: 'Album', fieldName: 'albumName'}
        // { label: 'Spotify Link', fieldName: 'trackURL', type: 'url'} 
    ];
    
}