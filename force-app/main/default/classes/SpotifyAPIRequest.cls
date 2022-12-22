public class SpotifyAPIRequest {
    

    // This is a datetime var that is used to store a static datetime 
    static datetime lastTokenDT;
    static String staticAuthToken;


    // Returns Access Token from an http response from Spotify's API
    public static String getAccessTokenFromRequestJSON(HttpResponse response) {
        system.debug('MAde it to getAccessTokenFromRequestJSON');
		Map<String,Object> authResponseMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
		String token = string.valueOf(authResponseMap.get('access_token'));
        return token;
    }
    
    // Returns Refresh Token from an http response from Spotify's API
    public static String getRefreshTokenFromRequestJSON(HttpResponse response) {
		Map<String,Object> authResponseMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
		String token = string.valueOf(authResponseMap.get('refresh_token'));
        return token;
    }

    // Method is used to get a new Access Token from a Spotify account that has
    // already authorized their account. 
    // It returns a List so that it can work with @wires in LWC
    @AuraEnabled(cacheable=true)
    public static List<String> getRefreshedAccessToken(){

        String refreshToken = [SELECT id, value__c FROM refresh_token__c where id='a00Dn000003PPPAIA4'].value__c;

        String grantType = 'refresh_token';
        String encryptedAuthKey = 'Basic YTk2NDY3MDhhOGYwNGZlODhjZDBjNTBjMWUzYzRmODI6YzRlZTYwNzQ2MmQ2NGVhNTg3NTJiMzJkMzBmMWNjNzI=';
        String payload = 'grant_type='+ grantType+ '&refresh_token=' + refreshToken;

        //Contructs API request that's sent to Spotify to get temp auth token 
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        
        request.setEndpoint('https://accounts.spotify.com/api/token');

        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setHeader('Authorization', encryptedAuthKey);
        
        request.setBody(payload);
        
        //Sends the above info to Spotify and gets back an HTTP Response
        Http binding = new Http();
        HttpResponse tokenResponse = binding.send(request);

        if (tokenResponse.getStatusCode()==200) {

            String accessTokenToReturn = getAccessTokenFromRequestJSON(tokenResponse);

            List<String> returnList = new List<String>();
            returnList.add(accessTokenToReturn);
            return returnList;
            
        } else {
            String errorMessage = 'This did not work, returned other than 200';
            system.debug('Status Code: ' + tokenResponse.getStatusCode());
            system.debug('Status Message: ' + tokenResponse.getStatus());
            system.debug(errorMessage);
            List<String> returnList = new List<String>();
            returnList.add(errorMessage);
            return returnList;

        }

    }

    // Method that get makes a callout to Spotify's API and gets an Access Token and 
    // Refresh Token. These are stored in a wrapper class called SpotifyOAuthResponse
    // This returns a List so that it can be called via a @wire in an LWC
    @AuraEnabled(cacheable=true)
    public static List<SpotifyOAuthResponse> calloutForAccessAndRefreshToken(String methodInput, String returnedAPICode) {

        system.debug('methodInput-----  '+ methodInput);
        system.debug('returnedAPICode-----  '+ returnedAPICode);
        
        String method = methodInput.capitalize();
        system.debug('Cap method = '+ method);

        system.debug('MAde it to calloutForAccessToken_WithUserAuth');


        // Auth token var that will be used to return  
        String returnedTokenfromJSON;

        // this is a combo of teh secre and client keys converted using 
        // secretID:clientID in https://mixedanalytics.com/tools/basic-authentication-generator/
        String encryptedAuthKey = 'Basic YTk2NDY3MDhhOGYwNGZlODhjZDBjNTBjMWUzYzRmODI6YzRlZTYwNzQ2MmQ2NGVhNTg3NTJiMzJkMzBmMWNjNzI=';
        String redirectURI = 'https://agordoa-dev-ed.develop.my.site.com/portfolio1/SpotifyAuthCodeCatcher';
        String grantType = 'authorization_code';

        
        //Formats the payload that is sent in for the Access Token
        String payload = 'code='+ returnedAPICode +'&grant_type='+ grantType + '&redirect_uri='+redirectURI;
        system.debug('Payload-----'+ payload);
        
        //Contructs API request that's sent to Spotify to get temp auth token 
        HttpRequest request = new HttpRequest();
        request.setMethod(method);
        
        request.setEndpoint('https://accounts.spotify.com/api/token');

        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setHeader('Authorization', encryptedAuthKey);
        
        request.setBody(payload);

        system.debug('----- Request ---- ' + request);
        system.debug('----- getBodyDocument ---- ' + request.getBodyDocument());
        system.debug('----- Body ---- ' + request.getBody());
        system.debug('----- Authorization ---- ' + request.getHeader('Authorization'));
        system.debug('----- Content-Type ---- ' + request.getHeader('Content-Type'));

                    
        //Sends the above info to Spotify and gets back an HTTP Response
        Http binding = new Http();
        HttpResponse tokenResponse = binding.send(request);
        
        
        // Checks if tokenResponse worked properly
        if(tokenResponse.getStatusCode()==200) {
            
            SpotifyOAuthResponse o_auth_obj = new SpotifyOAuthResponse();
            
            // helper methods that parse the tokens from the http request response
            // and add them to a wrapper class
            o_auth_obj.access_token = getAccessTokenFromRequestJSON(tokenResponse); 
            o_auth_obj.refresh_token = getRefreshTokenFromRequestJSON(tokenResponse);

            system.debug('o_auth_obj.access_token = ' +o_auth_obj.access_token );
            system.debug('o_auth_obj.refresh_token = ' +o_auth_obj.refresh_token );


            // Returned in a list form so that it can be referenced by a @wire in LWC component
            List<SpotifyOAuthResponse> return_OAuth_Obj_List = new List<SpotifyOAuthResponse>();
            return_OAuth_Obj_List.add(o_auth_obj);

            system.debug('return_OAuth_Obj_List = ' +return_OAuth_Obj_List );
            return return_OAuth_Obj_List;
        } 
        // Returns string for debugging if http tokenResponse didn't work
        else {
            system.debug('This did not work, returned other than 200');
            system.debug('Status Code: ' + tokenResponse.getStatusCode());
            system.debug('Status Message: ' + tokenResponse.getStatus());
            
            List<SpotifyOAuthResponse> return_OAuth_Obj_List = new List<SpotifyOAuthResponse>();
            return return_OAuth_Obj_List;
        }
    }

    // this is the primary version of this method, which takes two args and is used to get 
    // the access token when another user auth isn't needed
    @AuraEnabled(cacheable=true)
    public static List<String> calloutForAccessToken_WithUserAuth(String methodInput, String returnedAPICode) {

        system.debug('methodInput-----  '+ methodInput);
        system.debug('returnedAPICode-----  '+ returnedAPICode);
        
        String method = methodInput.capitalize();
        system.debug('Cap method = '+ method);

        system.debug('MAde it to calloutForAccessToken_WithUserAuth');

        if (staticAuthToken == NULL || lastTokenDT > lastTokenDT.addMinutes(59) ) {
            system.debug('Made it past inital if');
            


        
            // This updates the static timestamp with the current time when the  
            // method is called. This is used elsewhere to determine if a new auth
            // token is neccesary, since they expire an hour after being generated
            lastTokenDT = datetime.now();

            // Auth token var that will be used to return  
            String returnedTokenfromJSON;
            
            //Perminent tokens for my account to be used to get a temp auth token
            String secretID = 'c4ee607462d64ea58752b32d30f1cc72';
            String clientID = 'a9646708a8f04fe88cd0c50c1e3c4f82';

            // this is a combo of teh secre and client keys converted using 
            // secretID:clientID in https://mixedanalytics.com/tools/basic-authentication-generator/
            String encryptedAuthKey = 'Basic YTk2NDY3MDhhOGYwNGZlODhjZDBjNTBjMWUzYzRmODI6YzRlZTYwNzQ2MmQ2NGVhNTg3NTJiMzJkMzBmMWNjNzI=';
            String redirectURI = 'https://agordoa-dev-ed.develop.my.site.com/portfolio1/SpotifyAuthCodeCatcher';
            String grantType = 'authorization_code';

            
            //Formats the payload that is sent in the temp auth token API request
            String payload;
            if (returnedAPICode == NULL) {
                payload = 'grant_type=client_credentials&client_id=' + clientID + '&client_secret=' + secretID;
                system.debug('WRONG Payload-----'+ payload);

            } else {
                payload = 'code='+ returnedAPICode +'&grant_type='+ grantType + '&redirect_uri='+redirectURI;
                system.debug('GOOD Payload-----'+ payload);
            }

            system.debug('USER --- ' + UserInfo.getUserId());
            system.debug('USER --- ' + UserInfo.getName());
            
            //Contructs API request that's sent to Spotify to get temp auth token 
            HttpRequest request = new HttpRequest();
            request.setMethod(method);
            request.setEndpoint('https://accounts.spotify.com/api/token');
            request.setHeader('Content-Type','application/x-www-form-urlencoded');
            //request.setHeader('Content-Length',String.valueOf(payload.length()));
            if (returnedAPICode != null) {
                // this is only requred if this is a request that reads/writes to the users spotify account
                request.setHeader('Authorization', encryptedAuthKey);
            }
            request.setBody(payload);

            system.debug('----- Request ---- ' + request);
            system.debug('----- getBodyDocument ---- ' + request.getBodyDocument());
            system.debug('----- Body ---- ' + request.getBody());
            system.debug('----- Authorization ---- ' + request.getHeader('Authorization'));
            system.debug('----- Content-Type ---- ' + request.getHeader('Content-Type'));

                        
            //Sends the above info to Spotify and gets back an HTTP Response
            Http binding = new Http();
            HttpResponse tokenResponse = binding.send(request);
            
            
            // Checks if tokenResponse worked properly
            if(tokenResponse.getStatusCode()==200) {

                system.debug('staticAuthToken: ' + staticAuthToken);

                // Parses returned HTTPrequest to an 
                // auth token using written class method and returns 
                // a single string 
                returnedTokenfromJSON = getAccessTokenFromRequestJSON(tokenResponse);
                List<String> returnTokenList = new List<String>();
                returnTokenList.add(returnedTokenfromJSON);
                return returnTokenList;
            } 
            // Returns string for debugging if http tokenResponse didn't work
            else {
                String r = 'This did not work, returned other than 200';
                system.debug('Status Code: ' + tokenResponse.getStatusCode());
                system.debug('Status Message: ' + tokenResponse.getStatus());
                system.debug(r);
                List<String> r2 = new List<String>();
                return r2;
            }
        } 
        // this is the else statement for the initial Static authtoken check
        else {
            system.debug('staticAuthToken: ' + staticAuthToken);
            List<String> staticAuthTokenList = new List<String>();
            staticAuthTokenList.add(staticAuthToken);
            return staticAuthTokenList;
        }
    }

  
    
    // this is a secondary version of this method that is created for generic requests to the API
    // that don't require user auth for user profile info. 
    @AuraEnabled(cacheable=true)
    public static String calloutForAccessToken_NoUserAuth(String methodInput) {
        system.debug('MAde it to returnAuthToken');

        if (staticAuthToken == NULL || lastTokenDT > lastTokenDT.addMinutes(59) ) {

        
            // This updates the static timestamp with the current time when the  
            // method is called. This is used elsewhere to determine if a new auth
            // token is neccesary, since they expire an hour after being generated
            lastTokenDT = datetime.now();

            // Auth token var that will be used to return  
            String returnedTokenfromJSON;
            
            //Perminent tokens for my account to be used to get a temp auth token
            String secretID = 'c4ee607462d64ea58752b32d30f1cc72';
            String clientID = 'a9646708a8f04fe88cd0c50c1e3c4f82';
            
            //Formats the payload that is sent in the temp auth token API request
            String payload = 'grant_type=client_credentials&client_id=' + clientID + '&client_secret=' + secretID;
            
            
            //Contructs API request that's sent to Spotify to get temp auth token 
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://accounts.spotify.com/api/token');
            request.setHeader('Content-Type','application/x-www-form-urlencoded');
            request.setHeader('Content-Length',String.valueOf(payload.length()));
            request.setBody(payload);
            
            //Sends the above info to Spotify and gets back an HTTP Response
            Http binding = new Http();
            HttpResponse tokenResponse = binding.send(request);



            // Checks if tokenResponse worked properly
            if(tokenResponse.getStatusCode()==200) {
                // Parses returned HTTPrequest to an 
                // auth token using written class method and returns 
                // a single string 
                returnedTokenfromJSON = getAccessTokenFromRequestJSON(tokenResponse);
                return returnedTokenfromJSON;
            } 
            // Returns string for debugging if http tokenResponse didn't work
            else {
                String r = 'This did not work, returned other than 200';
                system.debug(r);
                return r;
            }
            } else {
                return staticAuthToken;
            }

    }


    @AuraEnabled(cacheable=true)
    public static List<Track> performSpotifySearch(String userQuery, String accessToken) {

        // Formatting inputs for HTTP callout
        String numberOfReusltsToReturn = '10';
        String encodedQuery = EncodingUtil.urlEncode(userQuery,'UTF-8');     
        String authToken = 'Bearer ' + accessToken;
        string payload = 'q=' + encodedQuery + '&type=track&market=US&limit='+numberOfReusltsToReturn+'&offset=0';
		String endpoint = 'https://api.spotify.com/v1/search?' + payload;
        
        // callout
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpoint);
        request.setHeader('Accept','application/json');
        request.setHeader('Content-Type','application/json');
        request.setHeader('Authorization' , authToken);

        Http binding = new Http();
        HttpResponse response = binding.send(request);

        system.debug('Status Code = ' + response.getStatusCode());

        String jsonBody = response.getBody();
        

        // Parsing the returned JSON from the callout
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonBody);

        Map<String, Object> tracksMap = (Map<String, Object>)jsonMap.get('tracks');

        List<Object> itemList = (List<Object>)tracksMap.get('items');
        system.debug(itemList);

        List<Track> trackList = new List<Track>();

        for (Object iter : itemList){
            Track tmpTrack = new Track();
            
            Map<String, Object> itemMap = (Map<String, Object>) iter;
            tmpTrack.name = (String)itemMap.get('name');
            tmpTrack.id = (String)itemMap.get('id');
            tmpTrack.uri = (String)itemMap.get('uri');
            
            Map<String, Object> albumMap = (Map<String, Object>)itemMap.get('album');
                
            tmpTrack.albumName = String.valueOf(albumMap.get('name'));
            trackList.add(tmpTrack);
            
            List<Object> artistList = (List<Object>)itemMap.get('artists');
            Map<String,Object> primaryArtistMap = (Map<String,Object>)artistList.get(0);
            tmpTrack.primaryArtist = String.valueOf(primaryArtistMap.get('name'));
            }
            
            return trackList;
    }

    @AuraEnabled(cacheable=true) // rename this to reflect that it's an access token, not auth token
    public static String returnAuthToken() {

        system.debug('MAde it to returnAuthToken');

        if (staticAuthToken == NULL || lastTokenDT > lastTokenDT.addMinutes(59) ) {

        
            // This updates the static timestamp with the current time when the  
            // method is called. This is used elsewhere to determine if a new auth
            // token is neccesary, since they expire an hour after being generated
            lastTokenDT = datetime.now();

            // Auth token var that will be used to return  
            String returnedTokenfromJSON;
            
            //Perminent tokens for my account to be used to get a temp auth token
            String secretID = 'c4ee607462d64ea58752b32d30f1cc72';
            String clientID = 'a9646708a8f04fe88cd0c50c1e3c4f82';
            
            //Formats the payload that is sent in the temp auth token API request
            String payload = 'grant_type=client_credentials&client_id=' + clientID + '&client_secret=' + secretID;
            
            
            //Contructs API request that's sent to Spotify to get temp auth token 
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://accounts.spotify.com/api/token');
            request.setHeader('Content-Type','application/x-www-form-urlencoded');
            request.setHeader('Content-Length',String.valueOf(payload.length()));
            request.setBody(payload);
            
            //Sends the above info to Spotify and gets back an HTTP Response
            Http binding = new Http();
            HttpResponse tokenResponse = binding.send(request);



            // Checks if tokenResponse worked properly
            if(tokenResponse.getStatusCode()==200) {
                // Parses returned HTTPrequest to an 
                // auth token using written class method and returns 
                // a single string 
                returnedTokenfromJSON = getAccessTokenFromRequestJSON(tokenResponse);
                return returnedTokenfromJSON;
            } 
            // Returns string for debugging if http tokenResponse didn't work
            else {
                String r = 'This did not work, returned other than 200';
                system.debug(r);
                return r;
            }
            } else {
                return staticAuthToken;
            }

    }     
    
    @AuraEnabled
    public static string getPlaylistJSON(String token) {

        system.debug('Made it togetPlaylist');
        // Formats authToken to be sent in HttpRequest
        String authToken = 'Bearer'+' '+  returnAuthToken();
        system.debug('authToken = ' + authToken);
        
        // Formatted to get the following from Spotify
        // Name, External_URL (playlist url), Owners Name, Owners URL 
        // Owner Id, Follower Count, Playlist Description 
        // Query below is what was used in Spotify Dev Consol 
        // tracks,name,external_urls,owner(display_name,id),followers(total),description,images
        String fieldsToRetrieve = '?fields=tracks%2Cname%2Cexternal_urls%2Cowner(display_name%2Cid)%2Cfollowers(total)%2Cdescription%2Cimages';
                             
        // Binds required info for the call to the HttpRequest
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.spotify.com/v1/playlists/' + token + fieldsToRetrieve);
        system.debug('Endpoint ' + request.getEndpoint());
        request.setHeader('Authorization', authToken);
        request.setMethod('GET');
        
		// Sends HttpRequest to Spotify and gets back a JSON with playlist info 
		Http binding = new Http();
        HttpResponse playlistResponse = binding.send(request);

        

        //system.debug(playlistResponse.getBody());
        if (playlistResponse.getStatusCode() == 200) {
            
            string str = playlistResponse.getBody();
            return str;
            
        } else {

            CalloutException e = new CalloutException();
            e.setMessage('This is a constructed exception! Status Code: ' + playlistResponse.getStatusCode());
            throw e;
        }   
    }

    // Pass in a Spotify Playlist Token and get back a Playlist Class. 
    // The logic in this method handles the conversion from the JSON received
    // by Spotify's API to the custom Playlist Class
    // However the HTTP callout is done via the getPlaylistJSON() class
    // which is called in this method. 
    @AuraEnabled(cacheable=true)
    public static PlaylistClass getPlaylist(String playlistToken) {

        // Stores the original JSON that came back from Spotify
        String playlistJSON = getPlaylistJSON(playlistToken);

        // Uses JSON deserialze to put this into a PlaylisttClass
        // However more parsing needs to be done manually for the 
        // inner levels of the original JSON
        Playlistclass playlistObj = getPlaylistClass(playlistJSON);
    
    
        // This turns the whole JSON into an initial Map with the Key's being the top levels
        // of the JSON. This will be used to dig down into the lower levels of the JSON
        Map<String, Object> topLevelObj = (Map<String, Object>)JSON.deserializeUntyped(playlistJSON);
        System.debug('topLevelObj = '+ topLevelObj);
        System.debug('topLevelObj.get(\'tracks\')  = ' + topLevelObj.get('tracks'));
        Object tracksObjForJSON = topLevelObj.get('tracks');
        
        // This ("Track") is an intermdiate layer that we to turn into an object to get down to the "Item"
        // level, which is where the actual track data is
        String tracksStr = JSON.serialize(tracksObjForJSON);
        Map<String, Object> tracksObj = (Map<String, Object>)JSON.deserializeUntyped(tracksStr);
        System.debug('tracksObj = ' + tracksObj);
        
        // We get Item list from the Track object. The Item list is where the data for individual 
        // songs within the playlist are held.
        Object itemsObjForJSON = tracksObj.get('items');
        System.debug('itemsObjForJSON = ' + itemsObjForJSON);
        String itemsStr = JSON.serialize(itemsObjForJSON);
    
        // Assigns the Item list into a TrackItem class list, which can then be added back to the Playlist Class
        List<TrackItem> trackItemList = (List<TrackItem>)JSON.deserialize(itemsStr, List<TrackItem>.class);
            // assigns TrackItem list that was parsed to the main Playlist obj
            playlistObj.trackList = trackItemList;	
        
        //------------------------------------
    
        // to get artist name 
        List<object> listOfItems = (List<object>)JSON.deserializeUntyped(itemsStr);
        
        integer indexOfTrackItemArray = 0;
    
        for (object iter : listOfItems) {
            String iterItemString = JSON.serialize(iter);
            
            //system.debug(iterItemString);
            Map<String, Object> singleItemObj = (Map<String, Object>)JSON.deserializeUntyped(iterItemString);
        
            
            Object trackObj = singleItemObj.get('track');
            String trackObjString = JSON.serialize(trackObj);
            Map<String, Object> singleTrackObj = (Map<String, Object>)JSON.deserializeUntyped(trackObjString);
            
        
            
            Object artistListObj = singleTrackObj.get('artists');
            String artistListObjString = JSON.serialize(artistListObj);
            List<Object> artistObjList = (List<Object>)JSON.deserializeUntyped(artistListObjString);
            
        
            
            List<ArtistClass> artistList = new List<ArtistClass>();
            for (object iterArtist : artistObjList) {
                String artistObj = JSON.serialize(iterArtist);
                ArtistClass artist = (ArtistClass)JSON.deserialize(artistObj, ArtistClass.class);
                artistList.add(artist);

            }

            // adds the final list of artists after the artist iter
            TrackItem tmpTrackItem = playlistObj.trackList.get(indexOfTrackItemArray);

            tmpTrackItem.track.artistObjList = artistList;

            // increments the index used for the array, declared before the for loop
            indexOfTrackItemArray++;
            
        }
 
        return playlistObj;

    }
    
    // helper function within getPlaylist() that assigns the values from the top level of
    // the returned JSON from Spotify. Additional logic is done to get the inner JSON levels assigned
    // Top level values it assigns: name, description, id
    public static PlaylistClass getPlaylistClass(String jsonString) {
        return (PlaylistClass)JSON.deserialize(jsonString, PlaylistClass.class);
    }

    @AuraEnabled(cacheable=true)
    public static List<DataTableTrackClass> getTrackList(String token) {
        
        List<DataTableTrackClass> tracklistForDatatable = new List<DataTableTrackClass>();

        // The getPlaylist() method makes a callout to Spotify and returns a PlaylistClass
        PlaylistClass playlistObject =  SpotifyAPIRequest.getPlaylist(token);

        List<TrackItem> trackItemList = playlistObject.trackList;

        for (TrackItem iter : playlistObject.trackList) {

            DataTableTrackClass tmpDatabaleTrack = new DataTableTrackClass();

            tmpDatabaleTrack.trackName = iter.track.name;
            tmpDatabaleTrack.artistName = iter.track.artistObjList.get(0).name;
            tmpDatabaleTrack.trackId = iter.track.id;
            tmpDatabaleTrack.trackURL = 'https://open.spotify.com/track/'+tmpDatabaleTrack.trackId;

            tracklistForDatatable.add(tmpDatabaleTrack);
        }

        return tracklistForDatatable;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<DataTablePlaylistClass> getPlaylistInfo(String token) {

        List<DataTablePlaylistClass> playlistInfoForDatatable = new List<DataTablePlaylistClass>();
        DataTablePlaylistClass tmpPI4D = new DataTablePlaylistClass();
        PlaylistClass playlistObject =  SpotifyAPIRequest.getPlaylist(token);

        tmpPI4D.playlistName = playlistObject.name;
        tmpPI4D.playlistDescription = playlistObject.description;
        tmpPI4D.followerCount = playlistObject.followers.total;
        tmpPI4D.playlistCoverImageURL = playlistObject.images.get(0).url;
        tmpPI4D.playlistOwnerName = playlistObject.owner.display_name;
        tmpPI4D.playlistSpotifyURL = playlistObject.external_urls.spotify;

        playlistInfoForDatatable.add(tmpPI4D);

        return playlistInfoForDatatable;

    }

    @AuraEnabled(cacheable=true)
    public static List<PlaylistClass> createPlaylist(String name,String description , Boolean publicBool, String spotUserId, String token){
        
        String endpointURL = 'https://api.spotify.com/v1/users/'+ spotUserId + '/playlists';
        String payload = '{ "name":"'+name+'", "description": "'+ description +'", "public":'+ publicBool+' }';
        String OAuthToken = 'Bearer ' + token;

        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(endpointURL);
        request.setHeader('Content-Type','application/json');
        request.setHeader('Authorization', OAuthToken);
        request.setHeader('Accept', 'application/json');
        request.setBody(payload);

        Http binding = new Http();
        HttpResponse createPlaylistResponse = binding.send(request);

        if (createPlaylistResponse.getStatusCode() == 200 || createPlaylistResponse.getStatusCode() == 201) {
            
            // gets JSON returned from Spotify
            String playlistResponseBody = createPlaylistResponse.getBody();

            // Assigns the top level values (name, id, description) to the 
            // PlaylistClass obj
            PlaylistClass userCreatedPlayist = getPlaylistClass(playlistResponseBody);

            // Assigns to List to return to Wire
            List<PlaylistClass> returnPlaylistList = new List<PlaylistClass>();
            returnPlaylistList.add(userCreatedPlayist);
            system.debug('returnPlaylistList ' + returnPlaylistList);
            return returnPlaylistList;

        } else {
            CalloutException e = new CalloutException();
            e.setMessage('This is a constructed exception! Status Code: ' + createPlaylistResponse.getStatusCode() + ' - Status Body: ' + createPlaylistResponse.getStatus());
            throw e;
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<SpotifyUserClass> getSpotifyUserClassList(String AccessToken){

        // calls method with the URL code that was receved from the inital ouath user auth flow
        List<string> BearerTokenList =  calloutForAccessToken_WithUserAuth('POST', AccessToken);

        // since calloutForAccessToken_WithUserAuth() returns a list (to handle @wires), it has to be parsed
        String BearerToken = BearerTokenList.get(0);
        
        // formats bearer token
        String OAuthToken = 'Bearer ' + BearerToken;

        // Makes call to Spotify to get user info back as JSON
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.spotify.com/v1/me');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', OAuthToken);
        request.setMethod('GET');

        Http binding = new Http();
        HttpResponse userResponse = binding.send(request);

        if(userResponse.getStatusCode()==200) {

            system.debug('getSpotifyUserClassList got to 200');

            String userResponseBodyJSON = userResponse.getBody();

            // creates SpotifyUserClass instance and uses the JSON.deserialze() to convert the JSON into a useable class
            SpotifyUserClass userToReturn = new SpotifyUserClass();
            userToReturn = (SpotifyUserClass)JSON.deserialize(userResponseBodyJSON, SpotifyUserClass.class);

            // to make this comptable with @wire calls, the SpotifyUserClass is added to a List<SpotifyUserClass> to be returned
            List<SpotifyUserClass> userClassListToReturn = new List<SpotifyUserClass>();
            userClassListToReturn.add(userToReturn);

            return userClassListToReturn;


        } else {

            // If there is an exception it is thrown here for debugging
            CalloutException e = new CalloutException();
            e.setMessage('This is a constructed exception! Status Code: ' + userResponse.getStatusCode() + '  Message: '+ userResponse.getStatus());
            throw e;
        }
    }

}