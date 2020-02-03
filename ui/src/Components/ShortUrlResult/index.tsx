import React from 'react';
import Button from '@material-ui/core/Button';

const ShortUrlResult = ({shortUrl, setLongUrl}: {shortUrl: string, setLongUrl: Function}) => {
    return (
        <div>   
            <h3>Your shortened URL is below:</h3>
            <br/>
            <a href={shortUrl}>{shortUrl}</a>
            <Button onClick={() => setLongUrl('')} variant="contained" color="primary">
                Shrink Another URL
            </Button>
        </div>
    );
};

export default ShortUrlResult;