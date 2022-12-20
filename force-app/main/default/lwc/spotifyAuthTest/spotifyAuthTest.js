import { LightningElement, wire } from 'lwc';
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';
import calloutForAccessAndRefreshToken from '@salesforce/apex/SpotifyAPIRequest.calloutForAccessAndRefreshToken';
import createPlaylist from '@salesforce/apex/SpotifyAPIRequest.createPlaylist';
import getRefreshedAccessToken from '@salesforce/apex/SpotifyAPIRequest.getRefreshedAccessToken';

export default class SpotifyAuthTest extends NavigationMixin(LightningElement) {
    



    /* --------------------------------------------------------------------  */
                // New Refresh Token Component
    /* --------------------------------------------------------------------  */

    client_id = 'a9646708a8f04fe88cd0c50c1e3c4f82';
    response_type = 'code';
    secretId = 'c4ee607462d64ea58752b32d30f1cc72';
    scope = 'user-read-private user-read-email playlist-modify-private playlist-modify-public';
    redirect_uri = 'https://agordoa-dev-ed.develop.my.site.com/portfolio1/SpotifyAuthCodeCatcher';
    state = '';

    authURL = String('https://accounts.spotify.com/en/authorize?'+'&client_id='+ this.client_id+'&response_type='+ this.response_type+'&redirect_uri='+ this.redirect_uri+'&scope='+ this.scope);
   
    // this is used to store the c__code that spotify returns after teh inital Ouath flow
    urlCode;

    // Access token that you receive after the initial URL token. This allows you to makes calls to the Spotify API
    // when you are requesting personal info from users. 
    accessToken;
    refreshToken;

   @wire(calloutForAccessAndRefreshToken,{methodInput: 'POST',returnedAPICode: '$urlCode'})
   OAuthTokenListOutput ({data,error}) {
        console.log('UR code pre IF statement: '+ this.urlCode)
        if(data) {
            this.accessToken = data[0].access_token;
            this.refreshToken = data[0].refresh_token;
        }
        else if (error){
            console.log('URL CODE: '+ this.urlCode)
            console.log('Manual Error Mesage : '+ error.statusText);
            console.log('Manual Error Code : '+ error.status);
        }
    
   }


    handleAuthPress(){
        console.log('HELLO 1');
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: this.authURL
            }
        },
            true // maybe keep as false? I think this solved it making the current page go backwards?
        );

        console.log('HELLO 2');
   
    }

    
    currentPageReference;
    // Injects the page reference that describes the current page
    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {

        if(currentPageReference) {
            this.urlCode = currentPageReference.state?.c__code;
        }

    }

    /* --------------------------------------------------------------------  */
                // Playlist creator component
    /* --------------------------------------------------------------------  */

    access_token;
    error;
    connectedCallback() {
        console.log('CAllback worked');
        getRefreshedAccessToken()
        .then(result =>{
            this.access_token = result[0];
            console.log('result = ' + result);
            console.log('this.access_token = ' + this.access_token);
        })
        .catch(error=>{
            this.error = error;
        })
    }

    playlistName;
    playlistDescription;

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

    handlePlaylistName(event){
        this.playlistName = event.target.value;
    }

    handlePlaylistDescription(event){
        this.playlistDescription = event.target.value;
    }

    handlePlaylistPublicCheckbox(event) {
        this.playlistPublicCheckbox = event.target.checked;
        console.log(this.playlistPublicCheckbox);
    }

    /* --------------------------------------------------------------------  */
    /* --------------------------------------------------------------------  */


    


}