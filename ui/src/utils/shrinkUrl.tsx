import {useState} from 'react';

import * as urlService from '../api/UrlService';

export const useShrinkUrl = () => {
    const [longUrl, setLongUrl] = useState('');
    const [shortUrl, setShortUrl] = useState('');
    const [error, setError] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    const shrinkUrl = async (input: string) => {
        setError('');
        setLongUrl(input)
        setIsLoading(true);
        const body = await urlService.shrinkUrl(longUrl)
        if (body.error) {
            setError(body.mesg);
        } else {
            setShortUrl(body.shortUrl);
        }
        setIsLoading(false);
    };
    return {shortUrl, isLoading, error, shrinkUrl};
};