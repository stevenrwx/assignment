#!/usr/bin/python3

import http.server # http server handler for http requests
import socketserver # Establish the TCP Socket connections
 
PORT = 8000
 
class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        html = "Hello World!"
        self.wfile.write(bytes(html, "utf8"))
        return

Handler = MyHttpRequestHandler
 
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("Http Server Serving at port", PORT)
    httpd.serve_forever()

