% load data from local file
num_node = load("./database/node.db");
    % r c l start end
z = load("./database/z.db");
num_z = height(z);
    % u hiAh low phi
vs = load("./database/vs.db");
num_vs = height(vs);
    % i start end phi
cs = load("./database/cs.db");
num_cs = height(cs);

% input the omega of the whole curcuit
omega = readDialog("½ÇËÙ¶È(rad/s)");

% Ax = b
% Aet A matrix
A = zeros(num_node);
for i = 1 : 1 : num_z
    r = z(i, 1);
    c = z(i, 2);
    l = z(i, 3);
    sp = z(i, 4);
    ep = z(i, 5);
    
    value = r - 1i/omega/c + 1i*omega*l;
    value = 1 / value;
    
    A(sp, sp) = A(sp, sp) + value;
    A(ep, ep) = A(ep, ep) + value;
    A(sp, ep) = A(sp, ep) - value;
    A(ep, sp) = A(ep, sp) - value;
end

for i = 1 : 1 num_vs
    u = vs(i, 1);
    hp = vs(i, 2);
    lp = vs(i, 3);
    phi = vs(i, 4);
    u = u*cos(phi) + 1i*u*sin(phi);
    
    A(hp)
    
end


% get b vector
