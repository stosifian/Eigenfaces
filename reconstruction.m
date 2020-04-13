function [x_recon] = reconstruction(k,M,mu,centered_faces,U,S,V)

    %k : number of principal components to be grabbed (1:K)
    %M : indices of image samples to be used (random)
    %mu: average face tensor
     
    
    %Grab first k principal components so can reconstruct X using
    %k components i.e. X ~ Xk = Uk*Sk*Vk'
    Uk = U(:,1:k); 
    Sk = S(1:k,1:k);
    Vk = V(:,1:k);
    
    [x,y,z] = size(centered_faces);
    
    %Reshape in mu into vector and grab first M samples for mu and x
    mu = reshape(mu,[y*y,1]);
    %x_M = centered_faces(:,:,1:M);
    %x_M = reshape(x_M,[y*y,M]);

                     
    %Get weight matrix of k components for 
    %M samples (M x k)
    %w_M = Uk'*x_M;        % w_M == Sk*Vk;                      

    %Reconstruct using weighted principal components and average face
    %x_recon = mu + Uk*w_M;   % See if equal to mu_M + Uk*Sk*Vk (it is!)
    
    x_recon = mu + Uk*Sk*Vk'; % Yes it is! (need to grab Vk differently)
    
    %Grab M = [rand_idx1 rand_idx2 ... rand_idxM] samples
    x_recon = x_recon(:,M);
    
end
    