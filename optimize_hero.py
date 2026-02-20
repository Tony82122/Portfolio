from PIL import Image
import os

img_path = 'static/img/Anthony_outside.png'
img = Image.open(img_path)
original_size = os.path.getsize(img_path)

print(f"Original image dimensions: {img.size[0]}x{img.size[1]} pixels")
print(f"Original file size: {original_size / 1024 / 1024:.2f} MB")
print(f"Image aspect ratio: {img.size[0] / img.size[1]:.2f}")

# Optimize the image: resize to max 1920px width while maintaining aspect ratio
max_width = 1920
if img.size[0] > max_width:
    ratio = max_width / img.size[0]
    new_height = int(img.size[1] * ratio)
    img_optimized = img.resize((max_width, new_height), Image.Resampling.LANCZOS)
    img_optimized.save(img_path, 'PNG', optimize=True)
    new_size = os.path.getsize(img_path)
    print(f"\nOptimized image to {max_width}x{new_height} pixels")
    print(f"New file size: {new_size / 1024 / 1024:.2f} MB")
    print(f"Reduction: {(1 - new_size / original_size) * 100:.1f}%")
else:
    print("\nImage is already optimized (width < 1920px)")
    # Still try to compress it
    img.save(img_path, 'PNG', optimize=True)
    new_size = os.path.getsize(img_path)
    print(f"Compressed file size: {new_size / 1024 / 1024:.2f} MB")
    print(f"Reduction: {(1 - new_size / original_size) * 100:.1f}%")

