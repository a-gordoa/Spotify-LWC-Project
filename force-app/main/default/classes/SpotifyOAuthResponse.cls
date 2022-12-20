public with sharing class SpotifyOAuthResponse {
    
    @AuraEnabled 
    public String refresh_token;
    
    @AuraEnabled
    public Integer expires_in;
    
    @AuraEnabled
    public String scope;
    
    @AuraEnabled
    public String token_type;
    
    @AuraEnabled
    public String access_token;
    
}
