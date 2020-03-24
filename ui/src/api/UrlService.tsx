
export const shrinkUrl = async (longUrl: String) => {
    try {
        const res = await fetch('/api/url/shrink', {method: 'POST', headers: {
            'Content-Type': 'application/json'}, body: JSON.stringify({longUrl})});
        if (res.status !== 200 && res.status !== 201) {
            return {error: true, mesg: `Error: ${res.status} - ${res.statusText}`};
        }
        return await res.json();
    } catch (err) {
        return {error: true, mesg: err};
    }
}