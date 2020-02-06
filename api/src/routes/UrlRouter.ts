import {Router} from 'express';
import {shrinkUrl} from '../bl/url';

const UrlRouter = Router({mergeParams: true});

UrlRouter.route('/shrink')
    .post(async (req, res) => {
        if (req.body.longUrl) {
            const shortUrl = await shrinkUrl(req.body.longUrl);
            res.send({shortUrl});
        } else {
            res.status(400);
        }
    });

export default UrlRouter;