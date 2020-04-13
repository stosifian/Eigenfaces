function [U,S,V,x,centered_faces,mu] = PCA(faces)
%Computes PCA on 3D input of faces dataset (images(2x2) x number of images)
    
    %Find mu, average of all faces
    dims = size(faces);
    mu = zeros(dims(1),dims(2));
    for i=1:dims(3)
        mu = mu + faces(:,:,i);
    end
    mu = mu/dims(3);
    
    %Make faces zero-mean
    centered_faces = faces - mu;
    
    %Reshape images into 4096 (64^2) element feature vector
    x = reshape(centered_faces,[64*64,dims(3)]);
    
    
    %U is 4096 x 4096 matrix of eigenvectors representing 'face space'
    %(principal directions) where V is eigenvectors of feature vectors'
    % covariance,x'x .S is singular values, related to eigenvalues of covariance by
    % lam = s^2/(n-1), and U*S are the principal components (scores,
    % determining length of each axis of n-dim ellipsoid
    [U,S,V] = svd(x,0);
    
end
    
    
    
    
    
    
    