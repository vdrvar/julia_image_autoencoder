# Julia Image Autoencoder

This project develops a simple autoencoder using Flux.jl in Julia to compress and decompress images, aiming to learn compact representations and reconstruct the original images with minimal loss.

## Features
- **Image Compression:** Compresses images into a lower-dimensional latent space.
- **Image Decompression:** Reconstructs images from their compressed form.
- **Batch Processing:** Processes all images in the specified folder and saves the results to an output folder.

## Prerequisites
- Julia 1.0 or higher
- Flux.jl
- Images.jl
- Plots.jl (optional for visualization)

## Setup Instructions

### Install Julia
Download and install Julia from the [official site](https://julialang.org/downloads/).

### Clone the Repository
```bash
git clone https://github.com/vdrvar/julia_image_autoencoder.git
cd julia_image_autoencoder
```

### Install Required Julia Packages
```bash
using Pkg
Pkg.add("Flux")
Pkg.add("Images")
Pkg.add("Plots") # Optional for visualization
```

## Usage

1. **Prepare Images:**
   - Place the images you want to process in the `images` folder. Supported formats are `.png` and `.jpg`.

2. **Run the Autoencoder Script:**
```bash
julia autoencoder_script.jl
```

The script will:

- Load images from the images folder.
- Train the autoencoder.
- Process each image and save the results in the outputs folder.
  
When the autoencoder is trained on multiple images, it learns to recognize and encode common features across these images. As a result, the reconstruction of any single image can be influenced by the learned features from other images in the training set, leading to a more generalized representation of image characteristics.

## Examples

Below are five examples of the original images and their reconstructions by the autoencoder.

### Example 1
**Original Image:**
![pic1](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/0b91b744-36c9-4cae-93d6-771bd205bb4a)
**Autoencoder Input & Reconstructed Image:**

![output_pic1 jpg](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/7ff37840-da84-4f7b-8500-6d5e4120c030)

### Example 2
**Original Image:**
![pic2](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/dd2809f1-536e-4300-9462-8c2740b4f2ac)
**Autoencoder Input & Reconstructed Image:**

![output_pic2 jpg](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/bdbc4525-e9f2-4cee-ac7a-56b9c9f43ffe)

### Example 3
**Original Image:**
![pic3](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/9aa71a0f-d9b8-41b3-a211-8a16a8078b28)
**Autoencoder Input & Reconstructed Image:**

![output_pic3 jpg](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/1cf61129-eda5-4915-bd9b-63bb95af5fbd)

### Example 4
**Original Image:**
![pic4](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/2861888d-4cb4-4e20-b073-15f520b10b11)
**Autoencoder Input & Reconstructed Image:**

![output_pic4 jpg](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/eb816a5d-6264-4bba-bf9e-f20a41ce723c)

### Example 5
**Original Image:**
![pic5](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/4d14bc55-62b2-4b0b-bf5f-945f72184346)
**Autoencoder Input & Reconstructed Image:**

![output_pic5 jpg](https://github.com/vdrvar/julia_image_autoencoder/assets/48907543/4b16210a-391a-494e-aad2-3c7030df47f6)

## License
This project is licensed under the MIT License - see the LICENSE file for details.
