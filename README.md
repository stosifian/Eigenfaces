# Eigenfaces

This script uses principal component analysis on the cropped version of the Labeled Faces in the Wild dataset (LFWcrop) to generate the 'eigenfaces' of the dataset and use them to reconstruct and classify faces in the dataset. This is accomplished by running the singular value decomposition algorithm in Matlab (svd) to generate the principal components (i.e. 'eigenfaces')

Here is a sample of 16 faces from the dataset:
![sample_faces](https://user-images.githubusercontent.com/47396320/79159036-35d0ef00-7d8c-11ea-866b-17f8a28c29b3.png)

The 'average face' of the dataset (shown below) was then found and subtracted from every face in the dataset before running the SVD.
![average_face](https://user-images.githubusercontent.com/47396320/79160652-fe177680-7d8e-11ea-9314-457591a81949.png)

After running SVD, the first 16 principal components were selected and reshaped back into 64x64 images to demonstrate the 'eigenfaces':

![First_16_Eigenfaces](https://user-images.githubusercontent.com/47396320/79159062-42554780-7d8c-11ea-9b95-47c43a2c6bae.png)


Using these 'eigenfaces', the original images can be reconstructed k-eigenfaces. Using 220 components (out of 4096), we get reasonably well results:
![Original_vs_Reconstructed](https://user-images.githubusercontent.com/47396320/79159331-b859ae80-7d8c-11ea-85f0-fad6057dc166.png)

