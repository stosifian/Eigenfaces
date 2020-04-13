function [] = plot_faces(face_data)
%Shows a random sample of 16 faces from the dataset represented by the
%face_data structure

    figure
    
    n = size(face_data);
    
    idx = randsample(n(1),16);
    
    
    for j=1:16
        i = idx(j);
        name = face_data(i).name;
        path = join([string(face_data(i).folder) string(name)],"/");
        img = imread(path);
        subplot(4,4,j);
        imshow(img);
        title_name = split(string(name),"_");
        title(join(title_name(1:2)));
    end
    
end