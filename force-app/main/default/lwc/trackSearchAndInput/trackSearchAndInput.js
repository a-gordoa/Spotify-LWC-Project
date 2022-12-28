import { api, LightningElement } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import performSpotifySearch from '@salesforce/apex/SpotifyAPIRequest.performSpotifySearch';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';
import addOrDeleteTracksFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.addOrDeleteTracksFromPlaylist';
import getTrackListFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.getTrackListFromPlaylist';

import {createJSONforUris} from 'c/javascriptUtility';

export default class TrackSearchAndInput extends LightningElement {

    // Id for the playlist the user created in PlaylistCreatorInitialInput component
    @api
    playlistIdFromInputComp = '';

    access_token;

    showSearchResultsTable = false;

    showRemoveTable = true;

    showSearchSpinner = false;

    showAddTrackSpinner = false;

    showRemoveTrackDatatable = false;

    playlistTrackListForRemoveDatatable;

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
        console.log('Made it to handleAddTrack');

        this.showAddTrackSpinner = true;

        // stores the rows from the datatable that the user selected
        var selectedTrackRowArray = this.template.querySelector('lightning-datatable').getSelectedRows(); 
        console.log('selectedTrackRowArray = ' + selectedTrackRowArray);

        // Utility function converts the obj from the datatable into a JSON that can be used as an argument for 
        // the spotify api
        var trackUriArg = createJSONforUris(selectedTrackRowArray);
        
        addOrDeleteTracksFromPlaylist({playlstId: this.playlistIdFromInputComp, uriList: trackUriArg, AccessToken: this.access_token, add_or_delete: 'add'})
            .then(result=>{
                // toggles off the loading spinner after reuslts are returned
                this.showAddTrackSpinner = false;
                
                console.log(' made it to addOrDeleteTracksFromPlaylist result');

                // clears out the search data in the datatable 
                this.searchData =null;  
                // clears out the search bar by storing the value in input, then overriding it
                let input = this.template.querySelector('lightning-input');
                input.value = '';

                // toggles the datatable that shows search results off
                this.showSearchResultsTable = false;

                //update iframe URL to appent counterToSend at the end so that it refreshes
                this.counterToSend ++;
                this.dispatchEvent(new CustomEvent('urlupdate', {detail: String('https://open.spotify.com/embed/playlist/'+this.playlistIdFromInputComp+'?n='+this.counterToSend)}))
            })
            .catch(error=>{
                // clears out the search data in the datatable and search bar
                this.searchData =null;
                // clears out the search bar by storing the value in input, then overriding it
                let input = this.template.querySelector('lightning-input');
                input.value = '';

                // toggles the datatable that shows search results off
                this.showSearchResultsTable = false;

                // toggles off the loading spinner after reuslts are returned
                this.showAddTrackSpinner = false;

                alert('Error: ' + error.message + ' error name: ' + error.name);
                console.log('Add tracks to Spotify Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);
                
                this.counterToSend ++;
                this.dispatchEvent(new CustomEvent('urlupdate', {detail: String('https://open.spotify.com/embed/playlist/'+this.playlistIdFromInputComp+'?n='+this.counterToSend)}))
                console.log('Counter from event : ' + this.counterToSend);  
            });
    }

    // holds the returned List<Track> result from the Spotifi callout performed in searchSpotifyForTracks()
    searchData;
    // calls apex class to search Spotify via their api
    searchSpotifyForTracks() {
        this.showSearchSpinner = true;

        performSpotifySearch({userQuery: this.searchText, accessToken: this.access_token})
        .then(result=>{
            this.showSearchSpinner = false;
            // toggles the datatable holding the results to visible
            this.showSearchResultsTable = true;

            // stores the results that populate the datatable
            this.searchData = result;
        })
        .catch(error=>{
            this.showSearchSpinner = false;
            console.log('searchSpotifyForTracks Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);
        });

    }

    // holds the search text until it is called by incrementSongCounter()
    searchText;
    handleSongTextInput(event) {
        this.searchText = event.target.value;
    }

    handleShowRemoveTrackDatatable(event) {

        getTrackListFromPlaylist({token: this.playlistIdFromInputComp})
        .then(result=>{
            console.log('getTrackListFromPlaylist result ' + JSON.stringify(result));
            this.playlistTrackListForRemoveDatatable = result;
            this.showRemoveTrackDatatable = true;
            // refreshApex(this.playlistTrackListForRemoveDatatable)
            // .then(() => {
            //     console.log('Made it pased RefreshApex() + this.playlistTrackListForRemoveDatatable = ' + this.playlistTrackListForRemoveDatatable);
            // });
        })
        .catch(error=>{
            console.log('getTrackListFromPlaylist error');
            console.log('handleShowRemoveTrackDatatable Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);
        })
    }

    // columns for datatable
    columns = [
        { label: 'Song Name', fieldName: 'name' },
        { label: 'Artist', fieldName: 'primaryArtist' },
        { label: 'Album', fieldName: 'albumName'}
        // { label: 'Spotify Link', fieldName: 'trackURL', type: 'url'} 
    ];
    
}