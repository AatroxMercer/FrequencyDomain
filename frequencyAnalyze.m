function [] = frequencyAnalyze(p, omega)
    % u between start and end
    omega = omega(1) : 1 : omega(2);
    for i = 1:1:length(omega)
        node_voltage = nodeVoltageMethod(i);
        u_s2e(i) = node_voltage(p(1)) - node_voltage(p(2));
    end
    
    [omega0, omega0_index] = max(abs(u_s2e));
    omega0 = omega(omega0_index);
    msgbox("omega0=" + omega0);
    
    amplitude = abs(u_s2e);
    phi = angle(u_s2e) ./ pi * 180;
    
    grid on;
    subplot(1, 2, 1);
    plot(omega, amplitude);
    
    subplot(1, 2, 2);
    plot(omega, phi);
    
end