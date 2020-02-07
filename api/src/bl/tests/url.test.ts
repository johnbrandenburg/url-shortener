import {shrinkUrl, stretchUrl} from '../url';

jest.mock('../../db/url');

describe('Url conversion logic', () => {
    test('returns a short url given a long url', async (next) => {
        const shortUrl = await shrinkUrl('http://www.google.com/');
        expect(shortUrl).toBe('AAAAAA');
        next();
    })
    test('returns a long url given a short url', async (next) => {
        const longUrl = await stretchUrl('AAAAAA');
        expect(longUrl).toBe('http://www.google.com/');
        next();
    })
})