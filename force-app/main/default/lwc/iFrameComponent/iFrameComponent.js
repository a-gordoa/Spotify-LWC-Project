import { LightningElement, api } from 'lwc';

export default class IFrameComponent extends LightningElement {


    @api height = '500px';
    @api referrerPolicy = 'no-referrer';
    @api sandbox = '';
    // @api url = 'https://open.spotify.com/user/31xsewkexphjzpb4zw2kk3yitrcq';
    //@api url = 'https://google.com';
    @api width = '100%';
}