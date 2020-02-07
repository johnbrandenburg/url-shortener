import React from 'react';
import Button from '@material-ui/core/Button';

import './ShortUrlResult.scss';

const ShortUrlResult = ({shortUrl, setShortUrl}: {shortUrl: string, setShortUrl: Function}) => {
    return (
        <div>   
            <h3 className='success-text'>Your shortened URL is below:</h3>
            <br/>
            <a href={'/' + shortUrl}>{'http://' + window.location.host + '/' + shortUrl}</a>
            <br/>
            <Button className='reset-form-button' onClick={() => setShortUrl('')} variant="contained" color="primary">
                Shrink Another URL
            </Button>
        </div>
    );
};

export default ShortUrlResult;