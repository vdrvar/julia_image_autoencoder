# test_autoencoder_model.jl

using Flux

# Define the Autoencoder Model
encoder = Chain(
    Dense(784, 128, relu),
    Dense(128, 64, relu),
    Dense(64, 32, relu)
)

decoder = Chain(
    Dense(32, 64, relu),
    Dense(64, 128, relu),
    Dense(128, 784, σ)
)

autoencoder = Chain(encoder, decoder)

# Test the model with random input data
function test_autoencoder()
    # Create random input data (e.g., a flattened 28x28 image)
    input_data = rand(Float32, 784)
    
    # Pass the input data through the autoencoder
    encoded_data = encoder(input_data)
    decoded_data = decoder(encoded_data)
    
    println("Input data: ", input_data)
    println("Encoded data: ", encoded_data)
    println("Decoded data: ", decoded_data)
end

test_autoencoder()
