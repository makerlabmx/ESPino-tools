wifi.setmode(wifi.STATION)
wifi.sta.config("DasInternetss","XTPMHB1311")
wifi.sta.connect()

pin = {[0]=3,[1]=10,[2]=4,[3]=9,[4]=1,[5]=2,[10]=12,[12]=6,[14]=5,[15]=8,[16]=0}

gpio.mode(pin[4], gpio.OUTPUT)
gpio.mode(pin[0], gpio.INT)

ledState = gpio.HIGH

function toggleLed()
    if ledState == gpio.LOW then
        ledState = gpio.HIGH;
    else
        ledState = gpio.LOW;
    end
    gpio.write(pin[4], ledState);
    tmr.delay(300000);
end

gpio.trig(pin[0], "down", toggleLed)

srv=net.createServer(net.TCP) 
srv:listen(80,function(conn) 
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then 
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP"); 
        end
        local _GET = {}
        if (vars ~= nil)then 
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do 
                _GET[k] = v 
            end 
        end
        buf = buf.."<h1> Hello, NodeMcu.</h1><form src=\"/\">Turn GPIO2 <select name=\"pin\" onchange=\"form.submit()\">";
        local _on,_off = "",""
        if(_GET.pin == "ON")then
              _on = " selected=true";
              ledState = gpio.LOW;
              gpio.write(pin[4], ledState);
        elseif(_GET.pin == "OFF")then
              _off = " selected=\"true\"";
              ledState = gpio.HIGH;
              gpio.write(pin[4], ledState);
        end
        buf = buf.."<option".._on..">ON</opton><option".._off..">OFF</option></select></form>";
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)
