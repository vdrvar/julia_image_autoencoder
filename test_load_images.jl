# test_load_images.jl

using Images

# Function to load and preprocess images
function load_images(path::String)
    images = []
    for file in readdir(path)
        if endswith(file, ".png") || endswith(file, ".jpg")
            img = load(joinpath(path, file))
            push!(images, img)
        end
    end
    return images
end

# Test the load_images function
function test_load_images()
    # Specify the path to your image directory
    image_path = "images"
    
    # Load images from the specified path
    images = load_images(image_path)
    
    # println("Loaded images: ", images)
    println("Number of images: ", length(images))
end

test_load_images()
