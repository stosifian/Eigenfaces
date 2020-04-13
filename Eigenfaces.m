%Go to directory with face images
cd lfwcrop_grey/faces

%get structure containing directory info on .pgm files
face_data = dir('**/*.pgm');

cd .. 
cd ..

%Plot 16 random face images
plot_faces(face_data);


%Get size of a face image and number of images
path = join([string(face_data(1).folder) string(face_data(1).name)],"/");
img = imread(path);
[x,y] = size(img);
[z,t] = size(face_data);

%Create faces tensor
faces = zeros(x,y,z);
for i=1:z
    path = join([string(face_data(i).folder) string(face_data(i).name)],"/");
    faces(:,:,i) = double(imread(path));
end

%% Generate Eigenfaces
%Do PCA (using SVD) on faces tensor
[U,S,V,x,centered_faces,mu] = PCA(faces);

%Reshape into image format
eigen_faces = reshape(U,[size(img),y*y]);

%Plot first 16 eigen_faces (vectors)
plot_eig_faces(eigen_faces);

%% Reconstruct
%Get weights by projecting on subspace of eigenfaces, by 
%picking the first k principle components and first M 
%sample images to find weights of to reconstruct
k = 50;
M = 16;                                                    %keep 16 for plotting purposes
idx = randsample(z,M);
x_recon = reconstruction(k,idx,mu,centered_faces,U,S,V);

x_recon = reshape(x_recon,[y,y,M]);
plot_recon_faces(x_recon,faces,idx,face_data);


%% Classify

%Grab random face and see if returned face matches using k-subspace
rand_idx = randsample(z,1);
input_face = faces(:,:,rand_idx);
[expected_face,idx] = classify_face(input_face,x,faces,mu,U,k);

if ~(idx-rand_idx)
    disp('Success!')
else
   disp('Fail!')
end

