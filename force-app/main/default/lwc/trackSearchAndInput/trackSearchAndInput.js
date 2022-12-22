import { api, LightningElement } from 'lwc';
import performSpotifySearch from '@salesforce/apex/SpotifyAPIRequest.performSpotifySearch';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';

export default class TrackSearchAndInput extends LightningElement {

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


    
    counterToSend = 0;
    incrementSongCounter() {
        this.counterToSend ++;
        this.dispatchEvent(new CustomEvent('urlupdate', {detail: String('https://open.spotify.com/embed/playlist/'+this.playlistIdFromInputComp+'?n='+this.counterToSend)}))
        console.log('Counter from event : ' + this.counterToSend);
    }


    // calls apex class to search Spotify via their api
    searchData;
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
    
    
    testData = [ {
        id:'1234',
        name:'Condesa',
        primaryArtist:'Anza',
        trackURL:'https://open.spotify.com/artist/4MBMsq0Rj4A4ML79ceMYlu',
        album:'Tester',
        followers:'123'
        }
    ]
}