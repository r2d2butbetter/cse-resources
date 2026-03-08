Consider 2 layer CNN architecture with kernel size 3x3, stride=1, padding=0, ReLu activation and with no pooling. Assume learning rate as 0.01.
brief steps to implement back propagation in CNNs (define as functions)
1. calculate forward convolution
2. Loss gradient 
3. compute Local gradients
4. compute conv(i/p and loss gradient) and update filter weights
5. compute full conv(rotated filter and loss gradient) to get prvious layer loss gradient.

using this algorithm train the CNN on MNIST data for handwritten digit recognition.
Dataset source: https://www.kaggle.com/datasets/hojjatk/mnist-dataset?resource=download