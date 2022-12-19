public with sharing class PlaylistClass {
    
    // simple 
    @AuraEnabled
    public string name;
    
    @AuraEnabled
    public String description;

    // getters for class data
	public external_urls external_urls;
    
    @AuraEnabled
	public followers followers;
	public List<images> images;
	public Owner owner;

    public List<TrackItem> trackList;

    // I don't thinkg this is needed afterall cuz I'm just referecing the trackList above
    // directly
    public class tracks {
        public List<TrackItem> trackList;
    }
    
    
    public class external_urls {
        public string spotify;
    }
    public class followers {
        public integer total;
    }
    public class images {
        public integer height;
        public string url;
        public integer width;
    }

    public class owner {
        public string display_name;
    }
    

    // public static PlaylistClass parse(json) {
    //     return (PlaylistClass) System.JSON.deserialize(json, PlaylistClass.class);
    // }
}

// ------------ V3 (works) --------------
// String str = getPlaylist('0U1GH9BTQ2w2EZreySwXfy');
// //system.debug(str);


// 	// This will likely be an argument for the method
// 	Playlistclass playlistObj = SpotifyAPIRequest.getPlaylistClass(str);


// 	Map<String, Object> topLevelObj = (Map<String, Object>)JSON.deserializeUntyped(str);
//     //System.debug(topLevelStr.get('tracks'));
//     Object tracksObjForJSON = topLevelObj.get('tracks');
    
//     String tracksStr = JSON.serialize(tracksObjForJSON);
    
//     Map<String, Object> tracksObj = (Map<String, Object>)JSON.deserializeUntyped(tracksStr);
//     system.debug(tracksObj);
//     system.debug(tracksObj.get('items'));
    
    
//     Object itemsObjForJSON = tracksObj.get('items');
//     system.debug(itemsObjForJSON);
//     String itemsStr = JSON.serialize(itemsObjForJSON);
//     system.debug(itemsStr);

//     // to get everything else -----------
//     List<TrackItem> trackItemList = (List<TrackItem>)JSON.deserialize(itemsStr, List<TrackItem>.class);
// 		// assigns TrackItem list that was parsed to the main Playlist obj
// 		playlistObj.trackList = trackItemList;	
// 		system.debug('PL Obj Track List: ' + playlistObj.trackList.get(0).track.name);
	
//     for (TrackItem iter : trackItemList) {
//         system.debug(iter.track);    
//     }
// 	//------------------------------------

// 	// to get artist name ------------------
//     List<object> listOfItems = (List<object>)JSON.deserializeUntyped(itemsStr);
//     system.debug(listOfItems);

// 	integer indexOfTrackItemArray = 0;

//     for (object iter : listOfItems) {
//         String iterItemString = JSON.serialize(iter);
        
//         //system.debug(iterItemString);
//         Map<String, Object> singleItemObj = (Map<String, Object>)JSON.deserializeUntyped(iterItemString);
//         system.debug(singleItemObj.get('track'));    
        
//         Object trackObj = singleItemObj.get('track');
//         String trackObjString = JSON.serialize(trackObj);
//         Map<String, Object> singleTrackObj = (Map<String, Object>)JSON.deserializeUntyped(trackObjString);
        
//         system.debug(singleTrackObj.get('artists'));
        
//         Object artistListObj = singleTrackObj.get('artists');
//         String artistListObjString = JSON.serialize(artistListObj);
//         List<Object> artistObjList = (List<Object>)JSON.deserializeUntyped(artistListObjString);
        
//         system.debug(artistObjList);
        
//         List<ArtistClass> artistList = new List<ArtistClass>();
//         for (object iterArtist : artistObjList) {
//             String artistObj = JSON.serialize(iterArtist);
//             ArtistClass artist = (ArtistClass)JSON.deserialize(artistObj, ArtistClass.class);
//             artistList.add(artist);
//             system.debug(artist.name);
//         }
//         system.debug('ARTIST LIST: '+ artistList);
//         // adds the final list of artists after the artist iter
//         system.debug(playlistObj.trackList.get(indexOfTrackItemArray));
//         TrackItem tmpTrackItem = playlistObj.trackList.get(indexOfTrackItemArray);
//         //system.debug(tmpTrackItem.track.);
//         tmpTrackItem.track.artistObjList = artistList;
//         system.debug(tmpTrackItem.track.artistObjList);
//         // increments the index used for the array, declared before the for loop
//         indexOfTrackItemArray++;
        
//     }
// system.debug('moment of truth: '+playlistObj.trackList.get(0).track.artistObjList.get(0).name);

// ----- V2 ------------------------------------
// ---------------------------------------------
// ---------------------------------------------
// ---------------------------------------------
// String str = getPlaylist('0U1GH9BTQ2w2EZreySwXfy');
// //system.debug(str);


// 	// This will likely be an argument for the method
// 	Playlistclass playlistObj = getPlaylistClass(str);


// 	Map<String, Object> topLevelObj = (Map<String, Object>)JSON.deserializeUntyped(str);
//     //System.debug(topLevelStr.get('tracks'));
//     Object tracksObjForJSON = topLevelObj.get('tracks');
    
//     String tracksStr = JSON.serialize(tracksObjForJSON);
    
//     Map<String, Object> tracksObj = (Map<String, Object>)JSON.deserializeUntyped(tracksStr);
//     system.debug(tracksObj);
//     system.debug(tracksObj.get('items'));
    
    
//     Object itemsObjForJSON = tracksObj.get('items');
//     system.debug(itemsObjForJSON);
//     String itemsStr = JSON.serialize(itemsObjForJSON);
//     system.debug(itemsStr);

//     // to get everything else -----------
//     List<TrackItem> trackItemList = (List<TrackItem>)JSON.deserialize(itemsStr, List<TrackItem>.class);
// 		// assigns TrackItem list that was parsed to the main Playlist obj
// 		playlistObj.tracks = trackItemList;
//     for (TrackItem iter : trackItemList) {
//         system.debug(iter.track);    
//     }
// 	//------------------------------------

// 	// to get artist name ------------------
//     List<object> listOfItems = (List<object>)JSON.deserializeUntyped(itemsStr);
//     system.debug(listOfItems);

// 	integer indexOfTrackItemArray = 0;

//     for (object iter : listOfItems) {
//         String iterItemString = JSON.serialize(iter);
        
//         //system.debug(iterItemString);
//         Map<String, Object> singleItemObj = (Map<String, Object>)JSON.deserializeUntyped(iterItemString);
//         system.debug(singleItemObj.get('track'));    
        
//         Object trackObj = singleItemObj.get('track');
//         String trackObjString = JSON.serialize(trackObj);
//         Map<String, Object> singleTrackObj = (Map<String, Object>)JSON.deserializeUntyped(trackObjString);
        
//         system.debug(singleTrackObj.get('artists'));
        
//         Object artistListObj = singleTrackObj.get('artists');
//         String artistListObjString = JSON.serialize(artistListObj);
//         List<Object> artistObjList = (List<Object>)JSON.deserializeUntyped(artistListObjString);
        
//         system.debug(artistObjList);
        
//         List<ArtistClass> artistList = new List<ArtistClass>();
//         for (object iterArtist : artistObjList) {
//             String artistObj = JSON.serialize(iterArtist);
//             ArtistClass artist = (ArtistClass)JSON.deserialize(artistObj, ArtistClass.class);
//             artistList.add(artist);
//             system.debug(artist.name);
//             /*
//             Map<String, Object> artistObjMap = (Map<String, Object>)JSON.deserializeUntyped(artistObj);
//             system.debug(artistObjMap.get('name'));
// 			artistName = String.valueOf(artistObjMap.get('name'));
// 			*/
//         }
        
//     }

// ----- V1 ------------------------------------
// ---------------------------------------------
// ---------------------------------------------
// ---------------------------------------------
// String str = getPlaylist('0U1GH9BTQ2w2EZreySwXfy');
// //system.debug(str);


// public string getArtist(string playlistJSON_from_getPlaylist) {
//     string artistName = '';
    
//     Map<String, Object> topLevelObj = (Map<String, Object>)JSON.deserializeUntyped(playlistJSON_from_getPlaylist);
//     //System.debug(topLevelStr.get('tracks'));
//     Object tracksObjForJSON = topLevelObj.get('tracks');
    
//     String tracksStr = JSON.serialize(tracksObjForJSON);
    
//     Map<String, Object> tracksObj = (Map<String, Object>)JSON.deserializeUntyped(tracksStr);
//     system.debug(tracksObj);
//     system.debug(tracksObj.get('items'));
    
    
//     Object itemsObjForJSON = tracksObj.get('items');
//     system.debug(itemsObjForJSON);
//     String itemsStr = JSON.serialize(itemsObjForJSON);
//     system.debug(itemsStr);
    
//     // to get artists
//     List<object> listOfItems = (List<object>)JSON.deserializeUntyped(itemsStr);
//     system.debug(listOfItems);
//     for (object iter : listOfItems) {
//         String iterItemString = JSON.serialize(iter);
        
//         //system.debug(iterItemString);
//         Map<String, Object> singleItemObj = (Map<String, Object>)JSON.deserializeUntyped(iterItemString);
//         system.debug(singleItemObj.get('track'));    
        
//         Object trackObj = singleItemObj.get('track');
//         String trackObjString = JSON.serialize(trackObj);
//         Map<String, Object> singleTrackObj = (Map<String, Object>)JSON.deserializeUntyped(trackObjString);
        
//         system.debug(singleTrackObj.get('artists'));
        
//         Object artistListObj = singleTrackObj.get('artists');
//         String artistListObjString = JSON.serialize(artistListObj);
//         List<Object> artistObjList = (List<Object>)JSON.deserializeUntyped(artistListObjString);
        
//         system.debug(artistObjList);
        
            
//         for (object iterArtist : artistObjList) {
//             String artistObj = JSON.serialize(iterArtist);
//             Map<String, Object> artistObjMap = (Map<String, Object>)JSON.deserializeUntyped(artistObj);
//             system.debug(artistObjMap.get('name'));
// 			artistName = String.valueOf(artistObjMap.get('name'));
//         }
        
//     }
//     return artistName;
// }



//---------------- I think this is unrelated to the upper version
// Map<String, Object> topLevelObj = (Map<String, Object>)JSON.deserializeUntyped(str);
//     //System.debug(topLevelStr.get('tracks'));
//     Object tracksObjForJSON = topLevelObj.get('tracks');
    
//     String tracksStr = JSON.serialize(tracksObjForJSON);
    
//     Map<String, Object> tracksObj = (Map<String, Object>)JSON.deserializeUntyped(tracksStr);
//     system.debug(tracksObj);
//     system.debug(tracksObj.get('items'));
    
    
//     Object itemsObjForJSON = tracksObj.get('items');
//     system.debug(itemsObjForJSON);
//     String itemsStr = JSON.serialize(itemsObjForJSON);
//     system.debug(itemsStr);

//     // to get everything else
//     List<TrackItem> items = (List<TrackItem>)JSON.deserialize(itemsStr, List<TrackItem>.class);
//     for (TrackItem iter : items) {
//         system.debug(iter.track);    
//     }