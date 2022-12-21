import { LightningElement, api, track } from 'lwc';

export default class EmbededPlaylist extends LightningElement {

    @api
    playlistCreated = false;

    @api
    playlistIdFromInputComp = '';

    @api
    srcUrlFromInputComp = '';
}