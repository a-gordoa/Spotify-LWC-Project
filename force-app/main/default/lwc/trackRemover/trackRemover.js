import { LightningElement, api } from 'lwc';
import addOrDeleteTracksFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.addOrDeleteTracksFromPlaylist';
import getTrackListFromPlaylist from '@salesforce/apex/SpotifyAPIRequest.getTrackListFromPlaylist';
import {createJSONforUris} from 'c/javascriptUtility';


export default class TrackRemover extends LightningElement {

    // The following 3 properties are paseed down from tha parent component, trackSearchAndInput
    @api
    trackListForDatatable = [];

    @api 
    playlistId = '';

    @api
    accessToken = '';

    // This is set to start at 1000 locally so that it doesn't interfere with the counter from the 
    // trackSearchAndInput (parent), since that one starts at 0. 
    counterToSend = 1000;


    trackUriArg;
    handleRemoveTracks(){
        let selectedTrackRowArray = this.template.querySelector('lightning-datatable').getSelectedRows(); 
        this.trackUriArg = createJSONforUris(selectedTrackRowArray);
        //console.log('Selected Tracks for Removal = ' + JSON.stringify(selectedTrackRowArray) );
        console.log('Track URI Array: ' + this.trackUriArg);
        console.log('accessToken = '+ this.accessToken);
        console.log('playlistId = ' + this.playlistId);
        // playlist, urilist, accessToken, delete
        addOrDeleteTracksFromPlaylist({playlstId: this.playlistId , uriList: this.trackUriArg , AccessToken: this.accessToken , add_or_delete: 'delete'})
        .then(result=>{

            this.trackListForDatatable = [];
            console.log('trackListForDatatable = ' + JSON.stringify(this.trackListForDatatable));
            // console.log('addOrDeleteTracksFromPlaylist = Success');
            // console.log('addOrDeleteTracksFromPlaylist result = ' +  JSON.stringify(result));

            // formats and sends a URL that will trigger an iFrame refresh via the CustomEvemt. This is sent to
            // the c-playlist-creator component via event bubbling (which is why bubbles and composed are set to True). 
            this.counterToSend ++;
            let urlToSend = String('https://open.spotify.com/embed/playlist/'+this.playlistId+'?n='+this.counterToSend)
            console.log('urlToSend = ' + urlToSend);
            this.dispatchEvent(new CustomEvent('urlupdate', {detail: urlToSend, bubbles: true, composed: true}));

            this.dispatchEvent(new CustomEvent('hideremovetrackdatatable',{detail:false}));
        })
        .catch(error=>{
            alert('Error: ' + error.message + ' error name: ' + error.name);
            console.log('handleRemoveTracks remove tracks to Spotify Error message: ' + error.message + ' error name: ' + error.name + ' error stack: ' + error.stack);

        })        
    }
    


    // column for datatable that appear when you want to remove tracks for playlist
    columns = [
        { label: 'Song Name', fieldName: 'name' },
        { label: 'Artist', fieldName: 'primaryArtist' },
        { label: 'Album', fieldName: 'albumName'}
    ]

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