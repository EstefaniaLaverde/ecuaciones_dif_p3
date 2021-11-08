function [Z] = f_runge_kuttad2(dx,dy,F0,I,h)
%F_RUNGE_KUTTAD2 Summary of this function goes here
%   Detailed explanation goes here

    %Condiciones iniciales
    Z = [F0];
    z1 = F0;

    xi = I(1);
    xf = I(2);

    x0 = F0(1);
    y0 = F0(2);
    %Calculo de iteraciones con el intervalo y h
    n = (xf-xi)/h;

        for k = 1:n
            %Valores de k1, k2, k3 y k4 para dx y dy
            k1x = dx(x0,y0);
            k1y = dy(x0,y0);

            k2x = dx(x0+h*0.5*k1x,y0+0.5*h*k1y);
            k2y = dy(x0+h*0.5*k1x,y0+0.5*h*k1y);

            k3x = dx(x0+h*0.5*k2x,y0+0.5*h*k2y);
            k3y = dy(x0+h*0.5*k2x,y0+0.5*h*k2y);

            k4x = dx(x0+h*k3x,y0+h*k3y);
            k4y = dy(x0+h*k3x,y0+h*k3y);

            kx = 1/6 * (k1x+2*k2x+2*k3x+k4x);
            ky = 1/6 * (k1y+2*k2y+2*k3y+k4y);

            x0 = x0 + h*kx;
            y0 = y0 + h*ky;

            z1 = [x0;y0];
            Z = horzcat(Z,z1);
        end

end

