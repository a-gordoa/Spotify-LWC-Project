@IsTest
public class SpotifySingleRequestMock implements HttpCalloutMock {
    // got this from here; https://developer.salesforce.com/blogs/developer-relations/2013/03/testing-apex-callouts-using-httpcalloutmock

    protected Integer code;
    protected String status;
    protected String bodyString;
    //protected String shorthandEndpoint;


    public SpotifySingleRequestMock(Integer code, String status, String bodyString) {
        this.code = code;
        this.status = status;
        this.bodyString = bodyString;
        //this.shorthandEndpoint = shorthandEndpoint;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse resp = new HttpResponse();
        resp.setStatusCode(code);
        resp.setStatus(status);
        resp.setBody(bodyString);

        return resp;
    }
}




/*
--------- returnAuthToken ------------
System.HttpResponse[Status=OK, StatusCode=200]
Body = {"access_token":"BQDxIJYRGIdGzKFe2ylSSu_TUf2ZP1LNJ2o9bN4vxb47Tc-aLoTZZMks6AhltCXzD6-ev4qTCFEh75XfZ6xL6WfKFNM1KSvdpOHtRb8HBKB_AD0BLkQ","token_type":"Bearer","expires_in":3600}
access_token: BQBrk7ZYggro9a4v1jRFH5RXb9pSojdDln7JhHpAPu6fhtVcF3etWHQlaxRSBMdb4aFeImd7jQkLzKhpcfYIKuP-vn05I7i8Nq6FYZk-AZC31qB6Cus
expires_in: 3600
token_type: Bearer


--------- getPlaylist ------------
System.HttpResponse[Status=OK, StatusCode=200]
Body = '{"access_token":"BQCRVukMK68Fm_iL5fMvM7GJJIvkAP4grUhJx7hmq4LrtJtTKtQt5XHTa1Ge1Igk-owOow04XkKc2G-_fHdH2-8f-kjlIoMKwLEz8werN1TWukg7jb0","token_type":"Bearer","expires_in":3600}'




--------- returnAuthToken ------------
 HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://accounts.spotify.com/api/token');
            request.setHeader('Content-Type','application/x-www-form-urlencoded');
            request.setHeader('Content-Length',String.valueOf(payload.length()));
            request.setBody(payload);
            
            //Sends the above info to Spotify and gets back an HTTP Response
            Http binding = new Http();
            HttpResponse tokenResponse = binding.send(request);

            if(tokenResponse.getStatusCode()==200) {
                // Parses returned HTTPrequest to an 
                // auth token using written class method and returns 
                // a single string 
                returnedTokenfromJSON = getTokenFromRequestJSON(tokenResponse);
                return returnedTokenfromJSON;
            } 
*/


/*
--------- getPlaylist ------------
System.HttpResponse[Status=OK, StatusCode=200]
Body = '{"access_token":"BQCRVukMK68Fm_iL5fMvM7GJJIvkAP4grUhJx7hmq4LrtJtTKtQt5XHTa1Ge1Igk-owOow04XkKc2G-_fHdH2-8f-kjlIoMKwLEz8werN1TWukg7jb0","token_type":"Bearer","expires_in":3600}'


 system.debug('Made it togetPlaylist');
        // Formats authToken to be sent in HttpRequest
        String authToken = 'Bearer'+' '+  returnAuthToken();
        
        // Formatted to get the following from Spotify
        // Name, External_URL (playlist url), Owners Name, Owners URL 
        // Owner Id, Follower Count, Playlist Description 
        // Query below is what was used in Spotify Dev Consol 
        // tracks,name,external_urls,owner(display_name,id),followers(total),description,images
        String fieldsToRetrieve = '?fields=tracks%2Cname%2Cexternal_urls%2Cowner(display_name%2Cid)%2Cfollowers(total)%2Cdescription%2Cimages';
                             
        // Binds required info for the call to the HttpRequest
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.spotify.com/v1/playlists/' + token + fieldsToRetrieve);
        request.setHeader('Authorization', authToken);
        request.setMethod('GET');
        
		// Sends HttpRequest to Spotify and gets back a JSON with playlist info 
		Http binding = new Http();
        HttpResponse playlistResponse = binding.send(request);
        

        //system.debug(playlistResponse.getBody());
        if (playlistResponse.getStatusCode() == 200) {
           
			// Takes the HTTPRequest response and turns it into a Map whos values are going to be called by other methods
            //Map<String,Object> playlistResponseMap = (Map<String,Object>)JSON.deserializeUntyped(playlistResponse.getBody());
            
            string str = playlistResponse.getBody();
            return str;

 
*/