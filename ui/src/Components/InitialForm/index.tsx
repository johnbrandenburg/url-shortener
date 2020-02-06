import React from 'react';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import validUrl from 'valid-url';

import './InitialForm.scss';

const InitialForm = ({longUrl, isLoading, error, setLongUrl, shrinkUrl}: 
    {longUrl: string, error: string, isLoading: boolean, 
    setLongUrl: Function, shrinkUrl: Function}) => {

    const formSubmit = (e: any) => {
        if (validUrl.isUri(longUrl)) {
            shrinkUrl(longUrl);
        }
        e.preventDefault();
    }

    return (
        <div className='initial-form'>
            {isLoading ? <h4 className='loading-text'>Loading...</h4> : <div>
                <h3 className='welcome-text'>Put any valid URL in the field below, and we will 
                generate a short version taking you to the same place!</h3>
                <form onSubmit={formSubmit} className='home-page__form'>
                    <TextField
                    id='long-url-entry'
                    label='Long URL'
                    value={longUrl}
                    onChange={e => setLongUrl(e.target.value)}
                    style={{ margin: 8 }}
                    placeholder="Enter the url to be shrunk here.."
                    fullWidth
                    margin="normal"
                    InputLabelProps={{
                        shrink: true,
                    }}
                    variant="outlined"
                    />
                    {error.length > 0 && <h4 className='error-mesg'>{error}</h4>}
                    <Button type='submit' disabled={!validUrl.isUri(longUrl)} variant="contained" color="primary">
                        Shrink URL
                    </Button>
                </form>
            </div>}
        </div>
    );
};

export default InitialForm;
        