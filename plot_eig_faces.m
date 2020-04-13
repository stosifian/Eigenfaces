function [] = plot_eig_faces(eig_faces)

    figure
    
    for i=1:16
        subplot(4,4,i);
        img = eig_faces(:,:,i);
        img = img - min(img(:));
        img = img / max(max(img));
        imshow(img);
        title_name = ['Eigenface' string(i)];
        title(join(title_name));
    end
end
