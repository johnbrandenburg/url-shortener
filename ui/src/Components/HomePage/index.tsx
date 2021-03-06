import React, {useState} from 'react';


import './HomePage.scss';
import InitialForm from '../InitialForm';
import ShortUrlResult from '../ShortUrlResult';
import {useShrinkUrl} from '../../utils/shrinkUrl';

const HomePage = () => {
    const [longUrl, setLongUrl] = useState('');
    const {shortUrl, isLoading, error, setShortUrl, shrinkUrl} = useShrinkUrl();

    return (
        <div className='home-page'>
            {shortUrl.length > 0 ? <ShortUrlResult shortUrl={shortUrl} setShortUrl={setShortUrl}/> : 
            <InitialForm longUrl={longUrl} setLongUrl={setLongUrl} shrinkUrl={shrinkUrl}
                isLoading={isLoading} error={error} /> }
        </div>
    );
};

export default HomePage;