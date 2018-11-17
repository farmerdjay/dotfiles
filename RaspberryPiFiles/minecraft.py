from mcpi.minecraft import Minecraft
from mcpi import block
from time import sleep

mc = Minecraft.create()
mc.postToChat("yo")

#x,y,z= mc.player.getPos()
#mc.setBlocks(x+3,y+3,z+3, x+13, y+13, z+13, 35, 1)

flower = 38
tnt = 46
lava =10
water = 8
air = 0

while True:
    x,y,z=mc.player.getPos()
    mc.setBlock(x+3,y+3,z, lava)
    sleep(20)
    mc.setBlock(x+3,y+5,z, water)
    sleep(4)
    mc.setBlock(x+3,y+5,z,air)
    sleep(5)
    


#mc.setBlocks(x+1,y+1,z+1,x+11,y+11,z+11,tnt,1)

#while True:
#    a,b,c = mc.player.getPos()
#    mc.setBlock(a,b,c,flower)
#
#    block_benath = mc.getBlock(a,b-1,c)
#    print(block_benath)
#
#    sleep(0.1)
    
    
