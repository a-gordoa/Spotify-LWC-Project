@istest
public class SpotifyAPIRequestTest {

    static string tokenForTestPL = '0U1GH9BTQ2w2EZreySwXfy';
    static string playlistJSONBody = '{ "description": "The description has email johngordoa@gmail.com in it", "external_urls": { "spotify": "https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy" }, "followers": { "total": 0 }, "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 } ], "name": "TEST_PL (2)", "owner": { "display_name": "Anthony Sanchez", "id": "12820729" }, "tracks": { "href": "https://api.spotify.com/v1/playlists/0U1GH9BTQ2w2EZreySwXfy/tracks?offset=0&limit=100&market=US&locale=en-US,en;q=0.9", "items": [ { "added_at": "2020-12-16T19:13:08Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "single", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "external_urls": { "spotify": "https://open.spotify.com/album/2f6ar8SF8t1EuihODpd47T" }, "href": "https://api.spotify.com/v1/albums/2f6ar8SF8t1EuihODpd47T", "id": "2f6ar8SF8t1EuihODpd47T", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e024228cdc3a24f054bde181261", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d000048514228cdc3a24f054bde181261", "width": 64 } ], "name": "Separated", "release_date": "2020-09-18", "release_date_precision": "day", "total_tracks": 1, "type": "album", "uri": "spotify:album:2f6ar8SF8t1EuihODpd47T" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "disc_number": 1, "duration_ms": 251040, "episode": false, "explicit": false, "external_ids": { "isrc": "ushm92060169" }, "external_urls": { "spotify": "https://open.spotify.com/track/1zhOfZcEEphaKqqBdAgV5M" }, "href": "https://api.spotify.com/v1/tracks/1zhOfZcEEphaKqqBdAgV5M", "id": "1zhOfZcEEphaKqqBdAgV5M", "is_local": false, "is_playable": true, "name": "Separated", "popularity": 1, "preview_url": "https://p.scdn.co/mp3-preview/25d2dcae7c153912d2bd897528ceca8e4a4afdf8?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 1, "type": "track", "uri": "spotify:track:1zhOfZcEEphaKqqBdAgV5M" }, "video_thumbnail": { "url": null } }, { "added_at": "2020-12-16T19:13:18Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "album", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "external_urls": { "spotify": "https://open.spotify.com/album/0gIAWTyvnOntQSd3yxyiW5" }, "href": "https://api.spotify.com/v1/albums/0gIAWTyvnOntQSd3yxyiW5", "id": "0gIAWTyvnOntQSd3yxyiW5", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b273d7d354b5ee37f62c88e392d9", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e02d7d354b5ee37f62c88e392d9", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d00004851d7d354b5ee37f62c88e392d9", "width": 64 } ], "name": "Bloom", "release_date": "2016-01-22", "release_date_precision": "day", "total_tracks": 11, "type": "album", "uri": "spotify:album:0gIAWTyvnOntQSd3yxyiW5" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "disc_number": 1, "duration_ms": 292044, "episode": false, "explicit": false, "external_ids": { "isrc": "AUDCB1500637" }, "external_urls": { "spotify": "https://open.spotify.com/track/31POmfMW3ebBiqriWIeNIc" }, "href": "https://api.spotify.com/v1/tracks/31POmfMW3ebBiqriWIeNIc", "id": "31POmfMW3ebBiqriWIeNIc", "is_local": false, "is_playable": true, "linked_from": { "external_urls": { "spotify": "https://open.spotify.com/track/062wtUiIbPTivGLQxrA8X9" }, "href": "https://api.spotify.com/v1/tracks/062wtUiIbPTivGLQxrA8X9", "id": "062wtUiIbPTivGLQxrA8X9", "type": "track", "uri": "spotify:track:062wtUiIbPTivGLQxrA8X9" }, "name": "Until the Sun Needs to Rise", "popularity": 57, "preview_url": "https://p.scdn.co/mp3-preview/3c2c33b5e90633159047c2fead20a218f75f5c4e?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 9, "type": "track", "uri": "spotify:track:31POmfMW3ebBiqriWIeNIc" }, "video_thumbnail": { "url": null } } ], "limit": 100, "next": null, "offset": 0, "previous": null, "total": 2 } }';



    public static HttpCalloutMock createMocksForTest(integer playlistJSONResponseCode, integer authtokenResponseCode) {

        // got this from here: https://developer.salesforce.com/blogs/developer-relations/2013/03/testing-apex-callouts-using-httpcalloutmock
        string fieldsToRetrieve = '?fields=tracks%2Cname%2Cexternal_urls%2Cowner(display_name%2Cid)%2Cfollowers(total)%2Cdescription%2Cimages';
        string token = 'token123';

        string playlistEndpoint = 'https://api.spotify.com/v1/playlists/'+tokenForTestPL+ fieldsToRetrieve;
        string authTokenEndpoint = 'https://accounts.spotify.com/api/token';
        
        string playlistJSONBody = '{ "description": "The description has email johngordoa@gmail.com in it", "external_urls": { "spotify": "https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy" }, "followers": { "total": 0 }, "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 } ], "name": "TEST_PL (2)", "owner": { "display_name": "Anthony Sanchez", "id": "12820729" }, "tracks": { "href": "https://api.spotify.com/v1/playlists/0U1GH9BTQ2w2EZreySwXfy/tracks?offset=0&limit=100&market=US&locale=en-US,en;q=0.9", "items": [ { "added_at": "2020-12-16T19:13:08Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "single", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "external_urls": { "spotify": "https://open.spotify.com/album/2f6ar8SF8t1EuihODpd47T" }, "href": "https://api.spotify.com/v1/albums/2f6ar8SF8t1EuihODpd47T", "id": "2f6ar8SF8t1EuihODpd47T", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e024228cdc3a24f054bde181261", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d000048514228cdc3a24f054bde181261", "width": 64 } ], "name": "Separated", "release_date": "2020-09-18", "release_date_precision": "day", "total_tracks": 1, "type": "album", "uri": "spotify:album:2f6ar8SF8t1EuihODpd47T" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "disc_number": 1, "duration_ms": 251040, "episode": false, "explicit": false, "external_ids": { "isrc": "ushm92060169" }, "external_urls": { "spotify": "https://open.spotify.com/track/1zhOfZcEEphaKqqBdAgV5M" }, "href": "https://api.spotify.com/v1/tracks/1zhOfZcEEphaKqqBdAgV5M", "id": "1zhOfZcEEphaKqqBdAgV5M", "is_local": false, "is_playable": true, "name": "Separated", "popularity": 1, "preview_url": "https://p.scdn.co/mp3-preview/25d2dcae7c153912d2bd897528ceca8e4a4afdf8?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 1, "type": "track", "uri": "spotify:track:1zhOfZcEEphaKqqBdAgV5M" }, "video_thumbnail": { "url": null } }, { "added_at": "2020-12-16T19:13:18Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "album", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "external_urls": { "spotify": "https://open.spotify.com/album/0gIAWTyvnOntQSd3yxyiW5" }, "href": "https://api.spotify.com/v1/albums/0gIAWTyvnOntQSd3yxyiW5", "id": "0gIAWTyvnOntQSd3yxyiW5", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b273d7d354b5ee37f62c88e392d9", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e02d7d354b5ee37f62c88e392d9", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d00004851d7d354b5ee37f62c88e392d9", "width": 64 } ], "name": "Bloom", "release_date": "2016-01-22", "release_date_precision": "day", "total_tracks": 11, "type": "album", "uri": "spotify:album:0gIAWTyvnOntQSd3yxyiW5" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "disc_number": 1, "duration_ms": 292044, "episode": false, "explicit": false, "external_ids": { "isrc": "AUDCB1500637" }, "external_urls": { "spotify": "https://open.spotify.com/track/31POmfMW3ebBiqriWIeNIc" }, "href": "https://api.spotify.com/v1/tracks/31POmfMW3ebBiqriWIeNIc", "id": "31POmfMW3ebBiqriWIeNIc", "is_local": false, "is_playable": true, "linked_from": { "external_urls": { "spotify": "https://open.spotify.com/track/062wtUiIbPTivGLQxrA8X9" }, "href": "https://api.spotify.com/v1/tracks/062wtUiIbPTivGLQxrA8X9", "id": "062wtUiIbPTivGLQxrA8X9", "type": "track", "uri": "spotify:track:062wtUiIbPTivGLQxrA8X9" }, "name": "Until the Sun Needs to Rise", "popularity": 57, "preview_url": "https://p.scdn.co/mp3-preview/3c2c33b5e90633159047c2fead20a218f75f5c4e?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 9, "type": "track", "uri": "spotify:track:31POmfMW3ebBiqriWIeNIc" }, "video_thumbnail": { "url": null } } ], "limit": 100, "next": null, "offset": 0, "previous": null, "total": 2 } }';
        
        
        SpotifySingleRequestMock playlistJsonResponse = new SpotifySingleRequestMock(playlistJSONResponseCode, 'OK', playlistJSONBody);
        SpotifySingleRequestMock authTokenResponse = new SpotifySingleRequestMock(authtokenResponseCode, 'OK', '{"access_token":"ABC1234","token_type":"Bearer","expires_in":3600}');

        Map<String, HttpCalloutMock> endpoint2TestResp = new Map<String,HttpCalloutMock>();

        endpoint2TestResp.put(playlistEndpoint,playlistJsonResponse);
        endpoint2TestResp.put(authTokenEndpoint, authTokenResponse);

        HttpCalloutMock multiCalloutMock =  new SpotifyMultiRequestMock(endpoint2TestResp);

        return multiCalloutMock;
    }


    @IsTest
    public static void returnPlaylistJSONTest_Code200() {

        HttpCalloutMock multiCalloutMock = createMocksForTest(200,200);
        
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);
        String returnedJSON = SpotifyAPIRequest.getPlaylistJSON(tokenForTestPL);

        System.assertEquals(true, returnedJSON == playlistJSONBody,'PlaylistJSON wasn\'t returned properly');
    }


    @IsTest
    public static void returnPlaylistJSONTest_returnAuthTokenCode400() {

        HttpCalloutMock multiCalloutMock = createMocksForTest(200,400);
        
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);
        String returnedJSON = SpotifyAPIRequest.getPlaylistJSON(tokenForTestPL);

        System.assertEquals(true, returnedJSON == playlistJSONBody,'PlaylistJSON wasn\'t returned properly');
    }


    @IsTest
    static void getTokenFromRequestJsonTest(){
        // getTokenFromRequestJSON testing variabes

        HttpResponse res = new HttpResponse();
        res.setBody('{"access_token":"BQBSJDS1AbKQnW2lszh9EJzEPd9-OSavGMtUkH37F2hBUuiQEqApFK9Ma_SkS0vXqe__pvh7EeU4Q6DRONS1tpW5hQVXZ1Gv2DvmOiV4EaCBkwvgDIY","token_type":"Bearer","expires_in":3600}');

        string accessTokenExpected = 'BQBSJDS1AbKQnW2lszh9EJzEPd9-OSavGMtUkH37F2hBUuiQEqApFK9Ma_SkS0vXqe__pvh7EeU4Q6DRONS1tpW5hQVXZ1Gv2DvmOiV4EaCBkwvgDIY';
        
        Test.startTest();
        String returnString = SpotifyAPIRequest.getTokenFromRequestJSON(res);
        Test.stopTest();

        system.assertequals(returnString,accessTokenExpected);
    }


    @IsTest
    static void testGetPlaylist() {
        //string playlistJSONBody = '{ "description": "The description has email johngordoa@gmail.com in it", "external_urls": { "spotify": "https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy" }, "followers": { "total": 0 }, "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 } ], "name": "TEST_PL (2)", "owner": { "display_name": "Anthony Sanchez", "id": "12820729" }, "tracks": { "href": "https://api.spotify.com/v1/playlists/0U1GH9BTQ2w2EZreySwXfy/tracks?offset=0&limit=100&market=US&locale=en-US,en;q=0.9", "items": [ { "added_at": "2020-12-16T19:13:08Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "single", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "external_urls": { "spotify": "https://open.spotify.com/album/2f6ar8SF8t1EuihODpd47T" }, "href": "https://api.spotify.com/v1/albums/2f6ar8SF8t1EuihODpd47T", "id": "2f6ar8SF8t1EuihODpd47T", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e024228cdc3a24f054bde181261", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d000048514228cdc3a24f054bde181261", "width": 64 } ], "name": "Separated", "release_date": "2020-09-18", "release_date_precision": "day", "total_tracks": 1, "type": "album", "uri": "spotify:album:2f6ar8SF8t1EuihODpd47T" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW" }, "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW", "id": "4CnFYjTgnR3U87krNzhLhW", "name": "Anemone", "type": "artist", "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW" } ], "disc_number": 1, "duration_ms": 251040, "episode": false, "explicit": false, "external_ids": { "isrc": "ushm92060169" }, "external_urls": { "spotify": "https://open.spotify.com/track/1zhOfZcEEphaKqqBdAgV5M" }, "href": "https://api.spotify.com/v1/tracks/1zhOfZcEEphaKqqBdAgV5M", "id": "1zhOfZcEEphaKqqBdAgV5M", "is_local": false, "is_playable": true, "name": "Separated", "popularity": 1, "preview_url": "https://p.scdn.co/mp3-preview/25d2dcae7c153912d2bd897528ceca8e4a4afdf8?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 1, "type": "track", "uri": "spotify:track:1zhOfZcEEphaKqqBdAgV5M" }, "video_thumbnail": { "url": null } }, { "added_at": "2020-12-16T19:13:18Z", "added_by": { "external_urls": { "spotify": "https://open.spotify.com/user/12820729" }, "href": "https://api.spotify.com/v1/users/12820729", "id": "12820729", "type": "user", "uri": "spotify:user:12820729" }, "is_local": false, "primary_color": null, "track": { "album": { "album_type": "album", "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "external_urls": { "spotify": "https://open.spotify.com/album/0gIAWTyvnOntQSd3yxyiW5" }, "href": "https://api.spotify.com/v1/albums/0gIAWTyvnOntQSd3yxyiW5", "id": "0gIAWTyvnOntQSd3yxyiW5", "images": [ { "height": 640, "url": "https://i.scdn.co/image/ab67616d0000b273d7d354b5ee37f62c88e392d9", "width": 640 }, { "height": 300, "url": "https://i.scdn.co/image/ab67616d00001e02d7d354b5ee37f62c88e392d9", "width": 300 }, { "height": 64, "url": "https://i.scdn.co/image/ab67616d00004851d7d354b5ee37f62c88e392d9", "width": 64 } ], "name": "Bloom", "release_date": "2016-01-22", "release_date_precision": "day", "total_tracks": 11, "type": "album", "uri": "spotify:album:0gIAWTyvnOntQSd3yxyiW5" }, "artists": [ { "external_urls": { "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj" }, "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj", "id": "5Pb27ujIyYb33zBqVysBkj", "name": "RÜFÜS DU SOL", "type": "artist", "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj" } ], "disc_number": 1, "duration_ms": 292044, "episode": false, "explicit": false, "external_ids": { "isrc": "AUDCB1500637" }, "external_urls": { "spotify": "https://open.spotify.com/track/31POmfMW3ebBiqriWIeNIc" }, "href": "https://api.spotify.com/v1/tracks/31POmfMW3ebBiqriWIeNIc", "id": "31POmfMW3ebBiqriWIeNIc", "is_local": false, "is_playable": true, "linked_from": { "external_urls": { "spotify": "https://open.spotify.com/track/062wtUiIbPTivGLQxrA8X9" }, "href": "https://api.spotify.com/v1/tracks/062wtUiIbPTivGLQxrA8X9", "id": "062wtUiIbPTivGLQxrA8X9", "type": "track", "uri": "spotify:track:062wtUiIbPTivGLQxrA8X9" }, "name": "Until the Sun Needs to Rise", "popularity": 57, "preview_url": "https://p.scdn.co/mp3-preview/3c2c33b5e90633159047c2fead20a218f75f5c4e?cid=774b29d4f13844c495f206cafdad9c86", "track": true, "track_number": 9, "type": "track", "uri": "spotify:track:31POmfMW3ebBiqriWIeNIc" }, "video_thumbnail": { "url": null } } ], "limit": 100, "next": null, "offset": 0, "previous": null, "total": 2 } }';
        //string token = '0U1GH9BTQ2w2EZreySwXfy';
        
        HttpCalloutMock multiCalloutMock = createMocksForTest(200,200);
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);        

        PlaylistClass playlistObj = SpotifyAPIRequest.getPlaylist(tokenForTestPL);

        system.assertEquals(true, playlistObj.name == 'TEST_PL (2)', 'Names didn\'t match in the test');
    }


    @IsTest
    static void getTrackListTest() {

        HttpCalloutMock multiCalloutMock = createMocksForTest(200,200);
        
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);
        List<DataTableTrackClass> trackList = new List<DataTableTrackClass>();
        DatatableTrackClass track = new DataTableTrackClass();

        trackList = SpotifyAPIRequest.getTrackList(tokenForTestPL);
        track = trackList.get(0);


        system.assertEquals(true, track.artistName == 'Anemone', 'Error retrieving artist name from DataTable');
    }


    @IsTest
    static void getPlaylistInfoTest() {
        HttpCalloutMock multiCalloutMock = createMocksForTest(200,200);
        Test.setMock(HttpCalloutMock.class, multiCalloutMock);

        List<DataTablePlaylistClass> playlistInfoList = new List<DataTablePlaylistClass>();
        DataTablePlaylistClass playlistInfo = new DataTablePlaylistClass();

        playlistInfoList = SpotifyAPIRequest.getPlaylistInfo(tokenForTestPL);
        playlistInfo = playlistInfoList.get(0);

        system.assertEquals(true, playlistInfo.playlistName == 'TEST_PL (2)', 'Playlist Datatable name value wasn\'t set properly');
    }

}





// HTTP Response to pass into getTokenFromREquestJOSN
// HttpRes = '{"access_token":"BQCRVukMK68Fm_iL5fMvM7GJJIvkAP4grUhJx7hmq4LrtJtTKtQt5XHTa1Ge1Igk-owOow04XkKc2G-_fHdH2-8f-kjlIoMKwLEz8werN1TWukg7jb0","token_type":"Bearer","expires_in":3600}'

//PaylistClass = '[description=The description has email johngordoa@gmail.com in it, external_urls=external_urls:[spotify=https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy], followers=followers:[total=0], images=(images:[height=640, url=https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261, width=640]), name=TEST_PL (2), owner=owner:[display_name=Anthony Sanchez], trackList=(TrackItem:[added_at=2020-12-16T19:13:08Z, primaryArtist=null, track=track:[artistObjList=(ArtistClass:[id=4CnFYjTgnR3U87krNzhLhW, name=Anemone, uri=spotify:artist:4CnFYjTgnR3U87krNzhLhW]), id=1zhOfZcEEphaKqqBdAgV5M, name=Separated]], TrackItem:[added_at=2020-12-16T19:13:18Z, primaryArtist=null, track=track:[artistObjList=(ArtistClass:[id=5Pb27ujIyYb33zBqVysBkj, name=RÜFÜS DU SOL, uri=spotify:artist:5Pb27ujIyYb33zBqVysBkj]), id=062wtUiIbPTivGLQxrA8X9, name=Until the Sun Needs to Rise]])]'
//PaylistClass = '[description=The description has email johngordoa@gmail.com in it, external_urls=external_urls:[spotify=https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy], followers=followers:[total=0], images=(images:[height=640, url=https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261, width=640]), name=TEST_PL (2), owner=owner:[display_name=Anthony Sanchez], trackList=(TrackItem:[added_at=2020-12-16T19:13:08Z, primaryArtist=null, track=track:[artistObjList=(ArtistClass:[id=4CnFYjTgnR3U87krNzhLhW, name=Anemone, uri=spotify:artist:4CnFYjTgnR3U87krNzhLhW]), id=1zhOfZcEEphaKqqBdAgV5M, name=Separated]], TrackItem:[added_at=2020-12-16T19:13:18Z, primaryArtist=null, track=track:[artistObjList=(ArtistClass:[id=5Pb27ujIyYb33zBqVysBkj, name=RÜFÜS DU SOL, uri=spotify:artist:5Pb27ujIyYb33zBqVysBkj]), id=062wtUiIbPTivGLQxrA8X9, name=Until the Sun Needs to Rise]])]'

/* JSON Playlist Output 
{
  "description": "The description has email johngordoa@gmail.com in it",
  "external_urls": {
    "spotify": "https://open.spotify.com/playlist/0U1GH9BTQ2w2EZreySwXfy"
  },
  "followers": {
    "total": 0
  },
  "images": [
    {
      "height": 640,
      "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261",
      "width": 640
    }
  ],
  "name": "TEST_PL (2)",
  "owner": {
    "display_name": "Anthony Sanchez",
    "id": "12820729"
  },
  "tracks": {
    "href": "https://api.spotify.com/v1/playlists/0U1GH9BTQ2w2EZreySwXfy/tracks?offset=0&limit=100&market=US&locale=en-US,en;q=0.9",
    "items": [
      {
        "added_at": "2020-12-16T19:13:08Z",
        "added_by": {
          "external_urls": {
            "spotify": "https://open.spotify.com/user/12820729"
          },
          "href": "https://api.spotify.com/v1/users/12820729",
          "id": "12820729",
          "type": "user",
          "uri": "spotify:user:12820729"
        },
        "is_local": false,
        "primary_color": null,
        "track": {
          "album": {
            "album_type": "single",
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW"
                },
                "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW",
                "id": "4CnFYjTgnR3U87krNzhLhW",
                "name": "Anemone",
                "type": "artist",
                "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW"
              }
            ],
            "external_urls": {
              "spotify": "https://open.spotify.com/album/2f6ar8SF8t1EuihODpd47T"
            },
            "href": "https://api.spotify.com/v1/albums/2f6ar8SF8t1EuihODpd47T",
            "id": "2f6ar8SF8t1EuihODpd47T",
            "images": [
              {
                "height": 640,
                "url": "https://i.scdn.co/image/ab67616d0000b2734228cdc3a24f054bde181261",
                "width": 640
              },
              {
                "height": 300,
                "url": "https://i.scdn.co/image/ab67616d00001e024228cdc3a24f054bde181261",
                "width": 300
              },
              {
                "height": 64,
                "url": "https://i.scdn.co/image/ab67616d000048514228cdc3a24f054bde181261",
                "width": 64
              }
            ],
            "name": "Separated",
            "release_date": "2020-09-18",
            "release_date_precision": "day",
            "total_tracks": 1,
            "type": "album",
            "uri": "spotify:album:2f6ar8SF8t1EuihODpd47T"
          },
          "artists": [
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/4CnFYjTgnR3U87krNzhLhW"
              },
              "href": "https://api.spotify.com/v1/artists/4CnFYjTgnR3U87krNzhLhW",
              "id": "4CnFYjTgnR3U87krNzhLhW",
              "name": "Anemone",
              "type": "artist",
              "uri": "spotify:artist:4CnFYjTgnR3U87krNzhLhW"
            }
          ],
          "disc_number": 1,
          "duration_ms": 251040,
          "episode": false,
          "explicit": false,
          "external_ids": {
            "isrc": "ushm92060169"
          },
          "external_urls": {
            "spotify": "https://open.spotify.com/track/1zhOfZcEEphaKqqBdAgV5M"
          },
          "href": "https://api.spotify.com/v1/tracks/1zhOfZcEEphaKqqBdAgV5M",
          "id": "1zhOfZcEEphaKqqBdAgV5M",
          "is_local": false,
          "is_playable": true,
          "name": "Separated",
          "popularity": 1,
          "preview_url": "https://p.scdn.co/mp3-preview/25d2dcae7c153912d2bd897528ceca8e4a4afdf8?cid=774b29d4f13844c495f206cafdad9c86",
          "track": true,
          "track_number": 1,
          "type": "track",
          "uri": "spotify:track:1zhOfZcEEphaKqqBdAgV5M"
        },
        "video_thumbnail": {
          "url": null
        }
      },
      {
        "added_at": "2020-12-16T19:13:18Z",
        "added_by": {
          "external_urls": {
            "spotify": "https://open.spotify.com/user/12820729"
          },
          "href": "https://api.spotify.com/v1/users/12820729",
          "id": "12820729",
          "type": "user",
          "uri": "spotify:user:12820729"
        },
        "is_local": false,
        "primary_color": null,
        "track": {
          "album": {
            "album_type": "album",
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj"
                },
                "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj",
                "id": "5Pb27ujIyYb33zBqVysBkj",
                "name": "RÜFÜS DU SOL",
                "type": "artist",
                "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj"
              }
            ],
            "external_urls": {
              "spotify": "https://open.spotify.com/album/0gIAWTyvnOntQSd3yxyiW5"
            },
            "href": "https://api.spotify.com/v1/albums/0gIAWTyvnOntQSd3yxyiW5",
            "id": "0gIAWTyvnOntQSd3yxyiW5",
            "images": [
              {
                "height": 640,
                "url": "https://i.scdn.co/image/ab67616d0000b273d7d354b5ee37f62c88e392d9",
                "width": 640
              },
              {
                "height": 300,
                "url": "https://i.scdn.co/image/ab67616d00001e02d7d354b5ee37f62c88e392d9",
                "width": 300
              },
              {
                "height": 64,
                "url": "https://i.scdn.co/image/ab67616d00004851d7d354b5ee37f62c88e392d9",
                "width": 64
              }
            ],
            "name": "Bloom",
            "release_date": "2016-01-22",
            "release_date_precision": "day",
            "total_tracks": 11,
            "type": "album",
            "uri": "spotify:album:0gIAWTyvnOntQSd3yxyiW5"
          },
          "artists": [
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/5Pb27ujIyYb33zBqVysBkj"
              },
              "href": "https://api.spotify.com/v1/artists/5Pb27ujIyYb33zBqVysBkj",
              "id": "5Pb27ujIyYb33zBqVysBkj",
              "name": "RÜFÜS DU SOL",
              "type": "artist",
              "uri": "spotify:artist:5Pb27ujIyYb33zBqVysBkj"
            }
          ],
          "disc_number": 1,
          "duration_ms": 292044,
          "episode": false,
          "explicit": false,
          "external_ids": {
            "isrc": "AUDCB1500637"
          },
          "external_urls": {
            "spotify": "https://open.spotify.com/track/31POmfMW3ebBiqriWIeNIc"
          },
          "href": "https://api.spotify.com/v1/tracks/31POmfMW3ebBiqriWIeNIc",
          "id": "31POmfMW3ebBiqriWIeNIc",
          "is_local": false,
          "is_playable": true,
          "linked_from": {
            "external_urls": {
              "spotify": "https://open.spotify.com/track/062wtUiIbPTivGLQxrA8X9"
            },
            "href": "https://api.spotify.com/v1/tracks/062wtUiIbPTivGLQxrA8X9",
            "id": "062wtUiIbPTivGLQxrA8X9",
            "type": "track",
            "uri": "spotify:track:062wtUiIbPTivGLQxrA8X9"
          },
          "name": "Until the Sun Needs to Rise",
          "popularity": 57,
          "preview_url": "https://p.scdn.co/mp3-preview/3c2c33b5e90633159047c2fead20a218f75f5c4e?cid=774b29d4f13844c495f206cafdad9c86",
          "track": true,"track_number": 9,"type": "track","uri": "spotify:track:31POmfMW3ebBiqriWIeNIc"},"video_thumbnail": {"url": null}}],"limit": 100,"next": null,"offset": 0,"previous": null,"total": 2}}
*/