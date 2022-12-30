import { LightningElement, api, wire} from 'lwc';
import getTrackListFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.getTrackListFromPlaylist';



   // column for datatable that appear when you want to remove tracks for playlist
const columns = [
    { label: 'Song Name', fieldName: 'name' },
    { label: 'Artist', fieldName: 'primaryArtist' },
    { label: 'Album', fieldName: 'albumName'}
]

const testData = [ {
    id:'1234',
    name:'Condesa',
    primaryArtist:'Anza',
    trackURL:'https://open.spotify.com/artist/4MBMsq0Rj4A4ML79ceMYlu',
    album:'Tester',
    followers:'123'
    }
]

export default class PlaylistCreator extends LightningElement {

    columns = columns;

    testData = testData;

    tracklistDatatable = [];

    playlistToken;

    playlistName;

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
        this.playlistLinkURL = String('https://open.spotify.com/playlist/'+this.playlistToken);
        this.playlistName = event.detail.name;
        console.log('Parent JS file. Token: ' + this.playlistToken);
        console.log('handleCreatedPlaylist. this.iframeURL: ' + this.iframeURL);
        console.log('handleCreatedPlaylist. event.detail.iframeURL: ' + event.detail.iframeURL);
        this.iframeURL = event.detail.iframeURL;
        this.doneLoading = true;

        // queries Spotify and adds teh playlist to the datatable once the playlist is created
        getTrackListFromPlaylist({token: this.playlistToken})
        .then(result=>{
            this.tracklistDatatable = result;
        })
        .catch(error=>{

        })

    }

    handleCounter(event) {
        this.iframeURL = event.detail;
        console.log(' Counter inside PlaylistCreatr event receiver ' + this.iframeURL);

        // queries Spotify and adds the updated tracklist to the datatable as tracks are added
        getTrackListFromPlaylist({token: this.playlistToken})
        .then(result=>{
            this.tracklistDatatable = result;
        })
        .catch(error=>{

        })
        
    }


    

}