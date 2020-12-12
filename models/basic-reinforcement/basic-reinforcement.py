# generate random integer values
import os
from random import seed
from random import randint

import time
from pettingzoo.mpe import simple_v2

env = simple_v2.env(max_cycles=100)
env.reset()
seed(1)

for agent in env.agent_iter():
    if (os.getenv('RENDER_ENV')):
        env.render()
        time.sleep(0.1)
    
    
    observation, reward, done, info = env.last()
    print(observation, reward, done, info)
    if (not done):
    	env.step(randint(0,4))
    else:
    	env.step(None)


if (os.getenv('RENDER_ENV')):
        env.close()