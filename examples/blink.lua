pin = {[0]=3,[1]=10,[2]=4,[3]=9,[4]=1,[5]=2,[10]=12,[12]=6,[14]=5,[15]=8,[16]=0}

led = pin[4]

gpio.mode(led, gpio.OUTPUT)

while true do
    gpio.write(led, gpio.HIGH)
    tmr.delay(100000)
    gpio.write(led, gpio.LOW)
    tmr.delay(100000)
    tmr.wdclr()
end
