import {getHighestUrl, createNewUrl, getLongUrl} from '../db/url/dao';

export const shrinkUrl = async (longUrl: string) => {
    const shortUrl = Buffer.alloc(4);
    const highestUrl = await getHighestUrl()
    shortUrl.writeInt32LE(highestUrl + 1, 0);

    await createNewUrl({shortUrl: shortUrl.readInt32LE(0), longUrl});

    return shortUrl.toString('base64').substring(0, 6);
};

export const stretchUrl = async (shortUrl: string) => {
    const shortUrlNumber = Buffer.from(`${shortUrl}==`, 'base64').readInt32LE(0);
    const longUrl = await getLongUrl(shortUrlNumber);
    return longUrl;
}