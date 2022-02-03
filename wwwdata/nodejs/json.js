const http = require("http");

const host = 'localhost';
const port = 8000;

const requestListener = function (req, res) {
    res.setHeader("Content-Type", "application/json");
    res.writeHead(200);
    console.log(new Date(Date.now()).toUTCString());
    res.end(`{"amount": {"value": 500, "type": "long"}, "item": {"value": "xyz"}}`);
};

const server = http.createServer(requestListener);

server.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});
