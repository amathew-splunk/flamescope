"""
Start development web server.
"""

import os
import sys
from app import APP

def main(argv):
    os.chdir('/opt/splunk/flamescope')
    """Start development web server."""
    APP.run(host=APP.config['HOST'], port=APP.config['PORT'], threaded=True)


if __name__ == "__main__":
    main(sys.argv)
