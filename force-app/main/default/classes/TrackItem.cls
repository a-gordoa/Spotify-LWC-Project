public with sharing class TrackItem {
    
    public string added_at;

    @AuraEnabled
    public track track;

    @AuraEnabled
    public string primaryArtist;




    public class track {
        public List<ArtistClass> artistObjList;
        //public List<string> artists;
        public string id;
        public string name;
    }


    
    // public TrackItem() {

    //     TrackItem.Track trackItemObj = new TrackItem.Track();
    //     this.primaryArtist = this.artistListObj.get(0).name;
    // }





}   
