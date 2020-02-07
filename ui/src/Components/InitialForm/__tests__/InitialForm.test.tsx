import '@testing-library/jest-dom/extend-expect';
import React from 'react';
import {render, screen} from '@testing-library/react';
import InitialForm from '..';

describe('Initial Form', () => {
    test('Displays Loading', async () => {
        render(<InitialForm longUrl='' isLoading={true} 
            error='' setLongUrl={() => {}} shrinkUrl={()=>{}} />);
        expect(screen.getByText('Loading...')).toBeTruthy();
    });

    test('Displays Error', async () => {
        render(<InitialForm longUrl='' isLoading={false} 
            error='Bad Error' setLongUrl={() => {}} shrinkUrl={()=>{}} />);
        expect(screen.getByText('Bad Error')).toBeTruthy();
    });
});