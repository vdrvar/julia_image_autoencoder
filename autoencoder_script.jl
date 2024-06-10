# autoencoder_script.jl

using Flux
using Images
using Plots  # Optional for visualization

# Define the Autoencoder Model with fewer layers
encoder = Chain(
    Dense(128*128, 2048, relu),
    Dense(2048, 1024, relu),
    Dense(1024, 512, relu),
    Dense(512, 256, relu)
)

decoder = Chain(
    Dense(256, 512, relu),
    Dense(512, 1024, relu),
    Dense(1024, 2048, relu),
    Dense(2048, 128*128, σ)
)

autoencoder = Chain(encoder, decoder)

# Define the Loss Function and Optimizer
loss(x) = Flux.mse(autoencoder(x), x)
opt = ADAM()

# Function to load and preprocess images
function load_images(path::String)
    images = []
    filenames = []
    for file in readdir(path)
        if endswith(file, ".png") || endswith(file, ".jpg")
            img = load(joinpath(path, file))
            img = Gray.(img)  # Convert to grayscale
            img = imresize(img, (128, 128))  # Resize to 128x128
            img = Float32.(img)  # Convert to Float32
            push!(images, img)
            push!(filenames, file)
        end
    end
    return images, filenames
end

# Training the Autoencoder
function train_autoencoder(data, epochs=20)
    for epoch in 1:epochs
        for img in data
            img = vec(img)  # Flatten the image
            gs = gradient(() -> loss(img), Flux.params(autoencoder))
            Flux.Optimise.update!(opt, Flux.params(autoencoder), gs)
        end
        println("Epoch $epoch complete")
    end
end

# Function to process and save images
function process_and_save_images(data, filenames, output_path)
    for (img, filename) in zip(data, filenames)
        img_flat = vec(img)
        compressed = encoder(img_flat)
        decompressed = decoder(compressed)

        if decompressed !== nothing && length(decompressed) == 128*128
            decompressed_img = reshape(decompressed, (128, 128))

            # Flip the images vertically
            img_flipped = reverse(img, dims=1)
            decompressed_img_flipped = reverse(decompressed_img, dims=1)

            # Plot the original and reconstructed images with labels
            p = plot(
                heatmap(img_flipped, title="Original Image"),
                heatmap(decompressed_img_flipped, title="Reconstructed Image"),
                layout = (1, 2)
            )
            savefig(p, joinpath(output_path, "output_$filename.png"))
            println("Visualization saved to output_$filename.png")
        else
            println("Error: Decompressed image is not properly defined or sized for $filename.")
        end
    end
end

# Example Usage
function main()
    data_path = "images"
    output_path = "outputs"

    # Create output directory if it does not exist
    if !isdir(output_path)
        mkdir(output_path)
    end

    data, filenames = load_images(data_path)
    if isempty(data)
        println("No images found in the specified directory.")
        return
    end

    train_autoencoder(data)
    process_and_save_images(data, filenames, output_path)
end

main()
