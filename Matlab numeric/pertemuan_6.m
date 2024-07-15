%% bracketing methods :
    % Newton-Rhapson method
        % if f(x), f'(x) and f''(x) are continous near p then sequence
        % {p_k} can ben genereted
        
        % the sequence converge faster then bisection or regula falsi
        % method.
        
        % this methode is making use of a gradient near root p
        
        % Concept
            % assume inital approximation p_0 near p
            % consider the slope through p_0 and p_x
        
        % Cont
            % Consider point (p_0,f(p_0)) and (p_1, 0)
            % here, we consider that point p_0 near the root p
            % point p1 is an intersention of the slope line L and the x axis
        
        % the sequence from the slope
            % by definition, the tangent L is
              % m = 0 - f(p_0) / (p_1 - p_0)
            % it can also be found
                % m = f'(p_0)
            % from that two forms of slope, then we can get
                % p_1 = p_0 - f(p_0)/f'(p_0)
            
            % proof
                % taylor ponynomial
                
            % theorema 
                % assume that f E C^2[a,b] and exist p E [a,b] wehere f(p)
                % = 0. If f'(p) ~= 0 then 
                
            % Cont
                % the function 
                % g(x) = x - f(x)/f'(x) => is called newton-rhapson
                % iterative function
            
            % e.g square root findings
                % assume that function is in the form:
                % f(x) = x^2 - A
                % g(x) = x + f(x)/f'(x) = x - (x^2 - A) / 2x
                % g(x) = x + (A/x) / 2
                
            % f(x) = x^2 - 5, with p_0 = 2
                % p1 = 2 + (5/2) / 2
    
    % Secant Method
        % N-R requires evalution of the two function periteration :
        % f(p_k-1) and f'(p_k-1)
        % secant methode only evaluates f(x) that converge nearly as fast
        % as N-R method            