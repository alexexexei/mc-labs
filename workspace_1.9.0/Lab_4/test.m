serialPort = serialport("COM10", 1000000);
configureTerminator(serialPort, "CR/LF");

numDataPoints = 1000;

data = zeros(1, numDataPoints);

for i = 1:numDataPoints
    line = readline(serialPort); 
    
    if startsWith(line, 'v:')
        voltage = sscanf(line, 'v:%f'); 
        
        data(i) = voltage;
    end
end

time = (0:numDataPoints-1) / 1000;
plot(time, data);
xlabel('time, sec');
ylabel('Voltage, V');
title('Voltage from ADC');
grid on;

clear serialPort;

