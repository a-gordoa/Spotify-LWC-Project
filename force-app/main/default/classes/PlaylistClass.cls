public with sharing class PlaylistClass {
    
    // simple 
    @AuraEnabled
    public string name;
    
    @AuraEnabled
    public String description;

    @AuraEnabled
    public String id;

    // getters for class data
	public external_urls external_urls;
    
    @AuraEnabled
	public followers followers;

    @AuraEnabled
	public List<images> images;

    @AuraEnabled
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

