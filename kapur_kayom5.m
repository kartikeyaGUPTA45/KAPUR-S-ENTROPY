%%%%%%% Calculation of Kapur's Entropy for m=5%%%%%%%%%%%%

function [out]=kapur_kayom5(th,p,ch)

% where 't' is the array containing the optimal thresholds obtained
% 'p' is the normalized histogram
% 'ch' is cummulative normalized histogram


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t=sort(th);
    t1=round(t(1));
    t2=round(t(2));
    t3=round(t(3));
    t4=round(t(4));
    t5=round(t(5));
    
    w0=double(ch(t1));          % class probability, w0
    w1=double(ch(t2)-ch(t1));   % class probability, w1
    w2=double(ch(t3)-ch(t2));   % class probability, w2
    w3=double(ch(t4)-ch(t3));   % class probability, w3
    w4=double(ch(t5)-ch(t4));   % class probability, w3
    w5=1-(w0+w1+w2+w3+w4);      % class probability, w4
    
    % Entropy Calculation
    H0=0;
    if w0>0
        for i=1:t1
            if p(i)>0
                H0=H0-(p(i)/w0)*log(p(i)/w0);
            end
        end
    end
    
    H1=0;
    if w1>0
        for i=t1+1:t2
            if p(i)>0
                H1=H1-(p(i)/w1)*log(p(i)/w1);
            end
        end
    end
    
    H2=0;
    if w2>0
        for i=t2+1:t3
            if p(i)>0
                H2=H2-(p(i)/w2)*log(p(i)/w2);
            end
        end
    end
    
    H3=0;
    if w3>0
        for i=t3+1:t4
            if p(i)>0
                H3=H3-(p(i)/w3)*log(p(i)/w3);
            end
        end
    end
    
    H4=0;
    if w4>0
        for i=t4+1:t5
            if p(i)>0
                H4=H4-(p(i)/w4)*log(p(i)/w4);
            end
        end
    end
    
    H5=0;
    if w5>0
        for i=t5+1:256
            if p(i)>0
                H5=H5-(p(i)/w5)*log(p(i)/w5);
            end
        end
    end
    
    %%%% Objective function calculation %%%%
    
    out=H0+H1+H2+H3+H4+H5;
end