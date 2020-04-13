function [] = plot_recon_faces(x_recon,faces,idx,face_data)
%Plots 16 random original faces alongside their respective
%reconstructed faces (of k eigenfaces)
    
    figure
    
    for j=1:16
        i = idx(j);
        name = face_data(i).name;
        path = join([string(face_data(i).folder) string(name)],"/");
        img = imread(path);
        subplot(4,8,j);
        img = faces(:,:,i);
        img = img / max(max(img));
        imshow(img);
        title_name = split(string(name),"_");
        title(join(title_name(1:2)));
    end
    
    
    
    for j=1:16
        i = idx(j);
        name = face_data(i).name;
        path = join([string(face_data(i).folder) string(name)],"/");
        subplot(4,8,j+16);
        img = x_recon(:,:,j);
        img = img / max(max(img));
        imshow(img);
        title_name = split(string(name),"_");
        title(join(title_name(1:2)));
    end
end