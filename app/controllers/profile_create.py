from app import config
from app.common.fileutil import get_profile_type

import random
import subprocess

# get profile files
def create_new_profile(capture_duration):
    f = str(random.getrandbits(128))
    subprocess.call("./get-stacks.sh " + f + " " + str(capture_duration))
    open( config.PROFILE_DIR + "/" + f, 'a').close()
    return f 
