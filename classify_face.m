function [expected_face,idx] = classify_face(input_face,x,faces,mu,U,k)

% Find closest w vector to given face's weight vector 
% and get index of corresponding face in faces data

    Uk = U(:,1:k);
    
    input_face = input_face - mu;
    input_face = reshape(input_face,[64*64,1]);
    
    w_input = Uk'*input_face;
    w_faces = Uk'*x;
    
    %Find closest w_m in w_faces to w_input
    %i.e. find closest training face in k-dimensional subspace (face space)
    idx = knnsearch(w_faces',w_input');
    
    expected_face = faces(:,:,idx);
    