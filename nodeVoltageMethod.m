function [x] = nodeVoltageMethod(omega)
    % load data from local file
    z = load("./database/z.db");
    vs = load("./database/vs.db");
    cs = load("./database/cs.db");
    num_node = load("./database/num_node.db");

    num_z = height(z);
    num_vs = height(vs);
    num_cs = height(cs);
    num = num_vs + num_node;


    % Ax = b
    A = zeros(num);
    b = zeros(num, 1);

    % Get A matrix
    for i = 1 : 1 : num_z
        r = z(i, 1);
        c = z(i, 2);
        l = z(i, 3);
        sp = z(i, 4);
        ep = z(i, 5);

        aij = r + 1i*omega*l;
        if c ~= 0
            aij = aij - 1i/omega/c;
        end
        aij = 1 / aij;

        A(sp, sp) = A(sp, sp) + aij;
        A(ep, ep) = A(ep, ep) + aij;
        A(sp, ep) = A(sp, ep) - aij;
        A(ep, sp) = A(ep, sp) - aij;
    end


    %  voltage source operation
    for i = 1 : 1 : num_vs
        u = vs(i, 1);
        hp = vs(i, 2);
        lp = vs(i, 3);
        phi = vs(i, 4);
        u = u*cos(phi) + 1i*u*sin(phi);

        m = num_node + i;
        % I_hl curcuit high -> low
        A(hp, m) = A(hp, m) + 1;
        A(lp, m) = A(lp, m) - 1;
        % U_hl = u_h - u_l
        A(m, hp) = A(m, hp) + 1;
        A(m, lp) = A(m, lp) - 1;
        b(m) = b(m) + u;
    end

    % get b vector
    for j = 1 : 1 : num_cs
        i = cs(j, 1);
        sp = cs(j, 2);
        ep = cs(j, 3);
        phi = cs(j, 4);

        i = i*cos(phi) + 1i*i*sin(phi);

        b(sp) = b(sp) - i;
        b(ep) = b(ep) + i;
    end

    x = linsolve(A(2:num, 2:num), b(2:num));
    x = [0;x(1 : num_node-1)];
    
    disp(x);
    
    file_x = fopen("./database/node_voltage.db", "wt");
    fprintf(file_x, "1: 0\n");
    
    for i = 2 : 1 : num_node
        fprintf(file_x, "%d: %f\n", [i, x(i-1)]);
    end
    
    fclose(file_x);
end