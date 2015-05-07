pin = {[0]=3,[1]=10,[2]=4,[3]=9,[4]=1,[5]=2,[10]=12,[12]=6,[14]=5,[15]=8,[16]=0}

led = pin[2]

pwm.setup(led, 100, 0)
pwm.start(led)

while true do
    val = adc.read(0)
    if val > 1023 then
        val = 1023
    end
    print(val)
    pwm.setduty(led, val)
    tmr.delay(50000)
    tmr.wdclr()
end