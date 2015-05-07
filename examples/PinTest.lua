pin = {[0]=3,[1]=10,[2]=4,[3]=9,[4]=1,[5]=2,[10]=12,[12]=6,[14]=5,[15]=8,[16]=0}

ledR = pin[2];
ledG = pin[4];
ledB = pin[5];

leds = {[0]=ledR, [1]=ledG, [2]=ledB};
other = {[0]=pin[15], [1]=pin[12], [2]=pin[14], [3]=pin[16]};

button = pin[0];

gpio.mode(ledR, gpio.OUTPUT)
gpio.mode(ledG, gpio.OUTPUT)
gpio.mode(ledB, gpio.OUTPUT)

for i=0,3 do
    gpio.mode(other[i], gpio.OUTPUT)
    gpio.write(other[i], gpio.LOW);
end

gpio.mode(button, gpio.INT)

function test()
    for i=0,2 do
        gpio.write(leds[i], gpio.LOW);
        tmr.delay(500000);
        tmr.wdclr()
        gpio.write(leds[i], gpio.HIGH);
    end

    for i=0,3 do
        gpio.write(other[i], gpio.HIGH);
        tmr.delay(500000);
        tmr.wdclr();
        gpio.write(other[i], gpio.LOW);
    end
    
end

gpio.trig(button, "down", test)