import UrlModel from './url.model';

export const getHighestUrl = async () => {
    const doc = await UrlModel.findOne({}).sort({shortUrl: 'descending'}).exec();
    return doc ? doc.shortUrl : -1;
};

export const createNewUrl = async ({
    shortUrl,
    longUrl
}: {shortUrl: number, longUrl: string}) => {
    const newUrl = new UrlModel({
        shortUrl,
        longUrl
    });
    const res = await newUrl.save(err => {
        if (err) {
            throw Error(err);
        }
    });
    return res;
};

export const getLongUrl = async (shortUrl: number) => {
    const doc = await UrlModel.findOne({shortUrl});
    return doc ? doc.longUrl : null;
}