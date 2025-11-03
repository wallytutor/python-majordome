### A Pluto.jl notebook ###
# v0.19.36


# ╔═╡ ea8e414e-6a0e-4e8d-819a-aaf6ad5bb9ea
md"""
## Step-by-step
"""

# ╔═╡ df69ee1b-378e-4297-95a0-69a640ef21bd
md"""
### Loading the image
"""

# ╔═╡ 146e884a-371f-4fdb-b0be-a545c0e9662a
begin
	filepath = "samples/Ti_pure_1-50.1-50x.jpg"
	img0 = load(filepath)

	(h, w) = size(img0)
	@info "$(typeof(img0)) : size $(h)x$(w)"

	img0
end

# ╔═╡ 9bce7490-bd6b-41e4-825f-c72def5db6d0
md"""
### Gray-scale conversion
"""

# ╔═╡ ded15a7a-da30-48bb-ab86-b227d19b791f
begin
	imgg = Gray.(img0)
end

# ╔═╡ 2cd42f17-0bf5-4caa-8c11-d6a79356ab62
md"""
It is important to observe the data type of our new matrix:
"""

# ╔═╡ a34a00c4-bc30-46e8-ba7a-622922a1ef0c
md"""
### Cropping the bar

Next we need to crop the bottom of the image by $(@bind crop Scrubbable(5:5:200, default = 80)) pixels [^1].
"""

# ╔═╡ 380b4c31-465f-481d-b930-86f117cf6d44
begin
	imgc = imgg[1:end-crop, 1:end]
end

# ╔═╡ 28452c28-8def-4428-a2e5-c92b88925e82
typeof(imgc)

# ╔═╡ 8af43023-4fef-4ec5-a970-b63e855491b5
md"""
### Histogram correction (optional)

Check to apply histogram correction: $(@bind applyhc CheckBox(default=false))

You might want to edit the next cell for parametrizing the algorithm.
"""

# ╔═╡ cfaa1a77-1895-448e-a50f-65bf16b0df19
begin
	# alg = AdaptiveEqualization(nbins = 256, rblocks = 4, cblocks = 4,
	# 	                       clip = 0.6, minval = 0.0, maxval = 0.9)

	# alg = Equalization(nbins = 256, minval = 0.0, maxval = 0.7)

	# alg = LinearStretching(dst_minval = 0.1, dst_maxval = 0.9)

	alg = GammaCorrection(gamma = 2)

	imga = applyhc ? adjust_histogram(imgc, alg) : imgc
end

# ╔═╡ 469e690f-27b4-4fa4-970c-e4c99d5f8d85
md"""
### Gaussian filter (blur)

You can test the impact of blurring variance σ = $(@bind σ Scrubbable(0.5:0.1:10.0, default = 2.0)) [^1].
"""

# ╔═╡ 618c3f96-78aa-487b-a012-fd90bd29776c
begin
	imgf = imfilter(imga, Kernel.gaussian(σ))
end

# ╔═╡ ee8575a5-283c-4114-9ec9-48d900541072
md"""
### Image binarization

Now select the trial binarization algorithm: $(@bind binalg Select([
	    Balanced      => "Balanced",
	    Entropy       => "Entropy",
	    MinimumError  => "MinimumError",
	    Moments       => "Moments",
	    Otsu          => "Otsu",
	    UnimodalRosin => "UnimodalRosin",
	    Yen           => "Yen"
	]))
"""

# ╔═╡ 7ee0d8af-8559-4e06-8359-548873241ad3
begin
	imgb = binarize(imgf, binalg())
end

# ╔═╡ 75e002f6-68fb-40c2-8a5b-44c0894262dd
"Implements porosity quantification in binarized image."
porosity(im) = 100convert(Float64, 1 - sum(im) / length(im))

# ╔═╡ 5a30548c-137e-4635-8086-0be3d03b3444
md"""
### Quantify porosity

White pixes are one valued while black pixels worth zero. Thus adding up the values of all pixels in the image counts the number of white pixels. Thus, the fraction of black pixels, the *porosity* η is

```math
\eta = 1 - \frac{\sum p}{h\times{}w}
```

The function below implements this evaluation, with which we compute a porosity level of $(round(porosity(imgb), digits = 1))%.
"""

# ╔═╡ f375775b-1901-47f0-9315-981153e77dec
md"""
### Final check

As a final step it is interesting to add contours of pores over the original image.
"""

# ╔═╡ dbfe01dd-1c3d-4ba0-a51f-082fe6980fad
"Helper function to draw red edges over pore borders."
function add_red_edges(im0, imb)
	canny = Canny(spatial_scale=5, high=Percentile(50), low=Percentile(45))
	image = imfilter(imb, Kernel.gaussian(5))
	edges = detect_edges(image, canny)

	# Blur a bit to spread values around edges. Where
	# values are greated than zero are thicker edges.
	# Control thickness with gaussian variance.
	thicknen = imfilter(edges, Kernel.gaussian(1.0)) .> 0

	image = RGB.(im0)
	image[thicknen] .= RGB(1, 0, 0)

	# Replace imgc by imgb above and add this:
	# image[imgb .== 0] .= RGB(0.3, 0.4, 0.4)

	return image
end

# ╔═╡ 4bd0a84f-dca1-4493-9f98-3e32a2eee127
add_red_edges(imgc, imgb)

# ╔═╡ 7ab4aded-4e31-47fb-b817-7b0d415ac531
md"""
## Workflow automation

Example following [this tutorial](https://juliaimages.org/dev/examples/image_segmentation/watershed/#Watershed-Segmentation-Algorithm) on watershed segmentation.
"""

# ╔═╡ 0fe9ac65-4881-4849-8672-d073aa844992
begin
	bw = imgc .> 0.5
	bw_transform = feature_transform(bw)

	dist = 1 .- distance_transform(bw_transform)
	dist_trans = dist .< 1

	markers = label_components(dist_trans)
	segments = watershed(dist, markers)
	labels = labels_map(segments)

	# You may want to check this intermediate state.
	# Gray.(markers/32.0)

	thecolors = distinguishable_colors(maximum(labels))
	colored_labels = IndirectArray(labels, thecolors)

	masked_colored_labels = colored_labels .* (1 .- bw)

	gray_labels = Gray.(masked_colored_labels)
	gray_labels[gray_labels .> 0] .= 1
	gray_labels = 1 .- gray_labels

	@info "Porosity of $(round(porosity(gray_labels), digits = 1))%"
	# mosaic(imgg, gray_labels; nrow=1)
end

# ╔═╡ 5635c0bc-c89b-498d-9c6e-e7f96ef66c58
add_red_edges(imgc, gray_labels)

# ╔═╡ 106c2688-b4b2-4f5b-b665-58c9dd04185a
md"""
## Footnotes

[^1]: Click the number and slide the mouse to left/write to change its value.
"""


# ╔═╡ Cell order:
# ╟─0551a509-4c15-455f-a895-cab164cc8fdc
# ╟─5e9b805c-b94d-11ee-17ec-9bd74eb61045
# ╟─ea8e414e-6a0e-4e8d-819a-aaf6ad5bb9ea
# ╟─df69ee1b-378e-4297-95a0-69a640ef21bd
# ╟─146e884a-371f-4fdb-b0be-a545c0e9662a
# ╟─9bce7490-bd6b-41e4-825f-c72def5db6d0
# ╟─ded15a7a-da30-48bb-ab86-b227d19b791f
# ╟─2cd42f17-0bf5-4caa-8c11-d6a79356ab62
# ╟─28452c28-8def-4428-a2e5-c92b88925e82
# ╟─a34a00c4-bc30-46e8-ba7a-622922a1ef0c
# ╟─380b4c31-465f-481d-b930-86f117cf6d44
# ╟─8af43023-4fef-4ec5-a970-b63e855491b5
# ╟─cfaa1a77-1895-448e-a50f-65bf16b0df19
# ╟─469e690f-27b4-4fa4-970c-e4c99d5f8d85
# ╟─618c3f96-78aa-487b-a012-fd90bd29776c
# ╟─ee8575a5-283c-4114-9ec9-48d900541072
# ╟─7ee0d8af-8559-4e06-8359-548873241ad3
# ╟─5a30548c-137e-4635-8086-0be3d03b3444
# ╟─75e002f6-68fb-40c2-8a5b-44c0894262dd
# ╟─f375775b-1901-47f0-9315-981153e77dec
# ╟─4bd0a84f-dca1-4493-9f98-3e32a2eee127
# ╟─dbfe01dd-1c3d-4ba0-a51f-082fe6980fad
# ╟─7ab4aded-4e31-47fb-b817-7b0d415ac531
# ╟─0fe9ac65-4881-4849-8672-d073aa844992
# ╟─5635c0bc-c89b-498d-9c6e-e7f96ef66c58
# ╟─106c2688-b4b2-4f5b-b665-58c9dd04185a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
