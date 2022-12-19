import { LightningElement, wire } from 'lwc';
import getPlaylistInfo from '@salesforce/apex/SpotifyAPIRequest.getPlaylistInfo';
import getTrackList from '@salesforce/apex/SpotifyAPIRequest.getTrackList';
//import plName from '@salesforce/schema/PlaylistClass.name';

const columns = [
    { label: 'Song Name', fieldName: 'trackName' },
    { label: 'Artist', fieldName: 'artistName' },
    { label: 'Spotify Link', fieldName: 'trackURL', type: 'url'}
];

// const columns = [
//     { label: 'Artist', fieldName: 'track.name' },
//     { label: 'Song', fieldName: 'track.artistObjList.get(0).name'}
// ];

const testData = [ {
    id:'1234',
    trackName:'Condesa',
    artistName:'Anza',
    spLink:'https://open.spotify.com/artist/4MBMsq0Rj4A4ML79ceMYlu',
    name:'Anza2',
    description:'Tester',
    followers:'123'
    }
]


export default class SpotifyPlayground extends LightningElement {

    renderPlaylistInfo = false;
    renderInstructions = true;
    renderErrorMsg = false;
    showModal = false;

    tokenInput;
    

    columns = columns;

    playlistName;
    playlistDescription;
    followerCount;
    playlistCoverImageURL;
    playlistOwnerName;
    playlistSpotifyURL;
    loadingSpinner = false;

    @wire(getPlaylistInfo,{token: '$tokenInput'})
    playlistInfoOutput({data,error}) {
        if(data) {

            this.renderPlaylistInfo = true;
            this.renderInstructions = false;
            this.renderErrorMsg = false;
            this.loadingSpinner = false;

            this.playlistName = data[0].playlistName;
            this.playlistDescription = data[0].playlistDescription;
            this.followerCount = data[0].followerCount;
            this.playlistCoverImageURL = data[0].playlistCoverImageURL;
            this.playlistOwnerName = data[0].playlistOwnerName;
            this.playlistSpotifyURL = data[0].playlistSpotifyURL;
        } else if (error) {
            console.log('Manual Error Mesage : '+ error.message);

            this.renderPlaylistInfo = false;
            this.renderErrorMsg = true;
            this.renderInstructions = false;
            this.loadingSpinner = false;

        }
    }

    @wire(getTrackList,{token: '$tokenInput'})outputJSON;



    // handleInput(event) {
    //     window.clearTimeout(this.delayTimeout);
    //     const tokenInput = event.target.value;
    //     this.delayTimeout = setTimeout(() => {
    //         this.tokenInput = tokenInput;
    //     }, 300);

    // }

    showInsturctionToggle(event) {

        // return the opposite of the current renderInstructions using ternary operator
        return (this.renderInstructions ? this.renderInstructions = false : this.renderInstructions = true);

    }

    showModalHandler(event) {
        return (this.showModal ? this.showModal = false : this.showModal = true);
    }

    handleClick(event) {
        this.loadingSpinner = true;

        this.tokenInput = this.template.querySelector('.tokenInputField').value;
    }
}