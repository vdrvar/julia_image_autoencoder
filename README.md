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

  


## Examples

Below are five examples of the original images and their reconstructions by the autoencoder.

### Example 1
**Original Image:**
images/pic1.jpg
**Autoencoder Input & Reconstructed Image:**
outputs/output_pic1.jpg.png

### Example 2
**Original Image:**
images/pic2.jpg
**Autoencoder Input & Reconstructed Image:**
outputs/output_pic2.jpg.png

### Example 3
**Original Image:**
images/pic3.jpg
**Autoencoder Input & Reconstructed Image:**
outputs/output_pic3.jpg.png

### Example 4
**Original Image:**
images/pic4.jpg
**Autoencoder Input & Reconstructed Image:**
outputs/output_pic4.jpg.png

### Example 5
**Original Image:**
images/pic5.jpg
**Autoencoder Input & Reconstructed Image:**
outputs/output_pic5.jpg.png

## License
This project is licensed under the MIT License - see the LICENSE file for details.
