import numpy as np

class NeuralNetwork:
    def __init__(self, layer_sizes):
        self.layer_sizes = layer_sizes
        self.num_layers = len(layer_sizes)
        self.parameters = {}
        self.initialize_parameters()
    
    def sigmoid(self, z):
        return 1 / (1 + np.exp(-z))
    
    def initialize_parameters(self):
        np.random.seed(42)
        for l in range(1, self.num_layers):
            self.parameters[f"W{l}"] = np.random.randn(
                self.layer_sizes[l],
                self.layer_sizes[l - 1] + 1
            )
    
    def forward_propagation(self, A):
        activations = {}
        A = A.reshape(-1, 1)
        A = np.vstack(([1], A))
        activations["A0"] = A

        for l in range(1, self.num_layers):
            W = self.parameters[f"W{l}"]
            Z = np.matmul(W, A)
            A = self.sigmoid(Z)
            if l != self.num_layers - 1:
                A = np.vstack(([1], A))
            activations[f"A{l}"] = A

        return A, activations


# Test function - DO NOT MODIFY*******************************************
def test_neural_network():
    n_list = []
    inp = input("Enter layer sizes: ")
    parts = inp.split()
    for p in parts:
        n_list.append(int(p))
        
    nn = NeuralNetwork(n_list)
    X = np.array([1.6, -0.1, 2.7, 3.5, -1.2]).T
    output, activations = nn.forward_propagation(X)

    for k, v in activations.items():
        print(k, ":\n", v)


if __name__ == "__main__":
    test_neural_network()
