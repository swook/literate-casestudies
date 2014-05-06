import math
import re

def is_prime(n):
    if n is 2:
        return True

    if n < 2 or n % 2 is 0:
        return False

    start = 3
    end   = int(math.floor(math.sqrt(n)))

    for i in range(start, end, 2):
        if n % i is 0:
            return False
    return True

def next_prime(n):
    if n < 2:
        return 2

    if n % 2 is 0:
        n -= 1

    while True:
        n += 2
        if is_prime(n):
            return n

import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

class MyHTTPHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        n = re.findall(r"^\/prime\/(\d+)$", self.path)
        if len(n) > 0:
            n = int(n[0])
            new_prime = next_prime(n)
            self.wfile.write(bytes(new_prime))
        else:
            SimpleHTTPRequestHandler.do_GET(self)


def main():
    addr = ('127.0.0.1', 1234)
    httpd = BaseHTTPServer.HTTPServer(addr, MyHTTPHandler)
    while True:
        httpd.handle_request()

if __name__ == '__main__':
    main()
