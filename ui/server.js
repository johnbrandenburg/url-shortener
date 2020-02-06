const express = require('express');
const proxy = require('http-proxy-middleware');
const app = express();
 
const filter = (path, req) => {
    const noRedirect = String(path).match('\.json$') || 
                    String(path).match('\.js$') || 
                    String(path).match('\.css$') ||
                    String(path).match('\.html$') ||
                    String(path).match('\.map$') ||
                    String(path).match('\.ico$') ||
                    String(path).match('\.png$') ||
                    String(path).match('/$');
    const api = String(path).match('^/api');
    return api || !noRedirect ;
};

app.use(
    proxy(filter, { target: 'http://localhost:8080', 
        changeOrigin: true,
        pathRewrite: {
            '^/api': ''
        }
    })
);

app.use('/', express.static('build'));

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

app.listen(3000, function() {
    console.log('app listening on port: 3000');
})