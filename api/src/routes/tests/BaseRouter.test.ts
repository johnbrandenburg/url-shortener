import request from 'supertest';
import BaseRouter from '../BaseRouter';

const app = require('express')();
app.use(BaseRouter);

jest.mock('../../bl/url');

describe('Base Router Tests', () => {
    test('returns a long url for a short url', (next) => {
        request(app)
            .get('/AAAAAA')
            .expect(302)
            .end((err, res) => {
                expect(res.header.location).toBe('http://www.google.com/');
                next();
            });
    })
})