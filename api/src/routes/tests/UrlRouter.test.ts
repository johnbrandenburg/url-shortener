import request from 'supertest';
import bodyParser from 'body-parser';
import UrlRouter from '../UrlRouter';

const app = require('express')();
app.use(bodyParser.json());
app.use(UrlRouter);

jest.mock('../../bl/url');

describe('Url Router Tests', () => {
    test('returns a short url for a long url', (next) => {
        request(app)
            .post('/shrink')
            .send({longUrl: 'http://www.google.com/'})
            .expect(200)
            .end((err, res) => {
                expect(res.body.shortUrl).toBe('AAAAAA');
                next();
            });
    })
})