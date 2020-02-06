import {Router} from 'express';
import UrlRouter from './UrlRouter';
import { stretchUrl } from '../bl/url';

const BaseRouter = Router({mergeParams: true});

BaseRouter.use('/url', UrlRouter);

BaseRouter.route('/:shortUrl')
    .get(async (req, res) => {
        const longUrl = await stretchUrl(req.params.shortUrl);
        longUrl ? res.redirect(longUrl) : res.redirect('/');
    })

export default BaseRouter;