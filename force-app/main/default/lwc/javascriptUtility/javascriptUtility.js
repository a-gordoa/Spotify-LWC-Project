    export function createJSONforUris(selectedTrackRowArray) {

        let selectedTrackUriObject = {uris:[]}; 
        console.log('in createJSONforUris, arg = ' + selectedTrackRowArray);

        // adds the selected URI's to an object that will be turned into a JSON string
        // to be used as an argument for Spotify's API
        for (const selectedTrackRowIter of selectedTrackRowArray) {

        // selectedTrackRowIter needs the paramter 'uri' (no s on the end)
        // selectedTrackUriObject needs the paramter 'uris' (with the s on the end)
        selectedTrackUriObject.uris.push(selectedTrackRowIter.uri);
        
        }

        let trackUriArg = JSON.stringify(selectedTrackUriObject);
        console.log('trackUriArg final string = ' + trackUriArg);

        return trackUriArg;
    }
