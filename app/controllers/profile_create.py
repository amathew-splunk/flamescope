from app import config
from app.common.fileutil import get_profile_type

import random
import subprocess
import time

# get profile files
def create_new_profile(capture_duration):
    f = hex(random.getrandbits(64))[2:-1] + "_" + str(time.time())
    subprocess.call( config.BASE_DIR + "/controllers/get-stacks.sh " + config.PROFILE_DIR + " " + f + " &", shell=True)
    return f 
