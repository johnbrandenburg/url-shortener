import '@testing-library/jest-dom/extend-expect';
import React from 'react';
import {render, fireEvent, screen} from '@testing-library/react';
import HomePage from '..';

describe('Home Page', () => {
    beforeEach(async () => {
        jest.spyOn(window, 'fetch')
            .mockImplementationOnce(() => {
                return Promise.resolve({
                    ...new Response(),
                    json: () => Promise.resolve({shortUrl: 'AAAAAA'}),
                })
            });

            render(<HomePage />);

            fireEvent.change(screen.getByLabelText(/Long Url/i), {
                target: {value: 'http://www.google.com/'},
            });
    
            fireEvent.click(screen.getByText('Shrink URL').parentElement);
    
            await screen.findByText('Your shortened URL is below:');
    })
    test('Returns short url for long url', () => {
        expect(screen.getByText(/http/)).toHaveTextContent('http://localhost/AAAAAA');
    });

    test('Allows return to home page', () => {
        fireEvent.click(screen.getByText('Shrink Another URL').parentElement);
        expect(screen.getByText('Shrink URL')).toBeTruthy();

    });
});