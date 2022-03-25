import http from "http";
import express from "express";

const app = express();
const server = http.createServer(app);

server.listen(() => {
  const {port} = server.address();
  console.info("listening on port", port);
});
