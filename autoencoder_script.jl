# autoencoder_script.jl

using Flux
using Images
using Plots  # Optional for visualization

# Define the Autoencoder Model
encoder = Chain(
    Dense(128*128, 1024, relu),
    Dense(1024, 512, relu),
    Dense(512, 256, relu),
    Dense(256, 128, relu)
)

decoder = Chain(
    Dense(128, 256, relu),
    Dense(256, 512, relu),
    Dense(512, 1024, relu),
    Dense(1024, 128*128, σ)
)

autoencoder = Chain(encoder, decoder)

# Define the Loss Function and Optimizer
loss(x) = Flux.mse(autoencoder(x), x)
opt = ADAM()

# Function to load and preprocess images
function load_images(path::String)
    images = []
    for file in readdir(path)
        if endswith(file, ".png") || endswith(file, ".jpg")
            img = load(joinpath(path, file))
            img = Gray.(img)  # Convert to grayscale
            img = imresize(img, (128, 128))  # Resize to 128x128
            img = Float32.(img)  # Convert to Float32
            push!(images, img)
        end
    end
    return images
end

# Training the Autoencoder
function train_autoencoder(data, epochs=10)
    for epoch in 1:epochs
        for img in data
            img = vec(img)  # Flatten the image
            gs = gradient(() -> loss(img), Flux.params(autoencoder))
            Flux.Optimise.update!(opt, Flux.params(autoencoder), gs)
        end
        println("Epoch $epoch complete")
    end
end

# Example Usage
function main()
    data = load_images("images")
    if isempty(data)
        println("No images found in the specified directory.")
        return
    end
    
    train_autoencoder(data)

    # Compress and Decompress an Image
    img = data[1]
    img_flat = vec(img)
    println("Original Image Flattened Size: ", size(img_flat))
    compressed = encoder(img_flat)
    println("Compressed Size: ", size(compressed))
    decompressed = decoder(compressed)
    println("Decompressed Size: ", size(decompressed))

    # Check if decompressed is defined and has correct size
    if decompressed !== nothing && length(decompressed) == 128*128
        decompressed_img = reshape(decompressed, (128, 128))
        println("Decompressed Image Reshape Successful.")
        p = plot(heatmap(img), heatmap(decompressed_img), layout = (1, 2))
        savefig(p, "output.png")  # Save the plot to a file
        println("Visualization saved to output.png")
    else
        println("Error: Decompressed image is not properly defined or sized.")
    end
end

main()
