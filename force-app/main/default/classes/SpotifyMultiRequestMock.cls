@IsTest
public with sharing class SpotifyMultiRequestMock implements HttpCalloutMock {
    // got this from here: https://developer.salesforce.com/blogs/developer-relations/2013/03/testing-apex-callouts-using-httpcalloutmock
    
    Map<String, HttpCalloutMock> requests;

    public SpotifyMultiRequestMock(Map<String, HttpCalloutMock> requests) {
        this.requests = requests;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpCalloutMock mock = requests.get(req.getEndpoint());
            if (mock != null) {
                return mock.respond(req);
                } else {
                    // found here: https://salesforce.stackexchange.com/questions/111419/can-built-in-exceptions-be-thrown
                    CalloutException e = new CalloutException();
                    e.setMessage('This is a constructed exception!');
                    throw e;
                    // ---------
            }
        }

    public void addRequestMock(String url, HttpCalloutMock mock) {
        requests.put(url, mock);
    }

    

}