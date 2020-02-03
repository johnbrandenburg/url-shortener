
export const shrinkUrl = async (longUrl: String) => {
    try {
        const res = await fetch('/api/shrinkUrl', {method: 'POST', body: JSON.stringify({longUrl})});
        if (res.status !== 200) {
            return {error: true, mesg: `Error: ${res.status} - ${res.statusText}`};
        }
        return await res.json();
    } catch (err) {
        return {error: true, mesg: err};
    }
}