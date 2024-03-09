import random
from PIL import Image

def encrypt_image(image_path, key):
    # Open the image
    image = Image.open(image_path)
    # Get the dimensions of the image
    width, height = image.size
    # Load the image into a pixel array
    pixels = image.load()

    # Encrypt the image by applying XOR operation with the key to selected pixels
    for y in range(height):
        for x in range(width):
            # Randomly disturb half of the pixels completely
            if random.random() < 0.5:  # 50% chance of disturbing the pixel
                r, g, b = random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)
            else:
                r, g, b = pixels[x, y]
                r ^= key
                g ^= key
                b ^= key
            pixels[x, y] = (r, g, b)

    # Save the encrypted image
    encrypted_image_path = "encrypted_" + image_path
    image.save(encrypted_image_path)
    print("Image encrypted successfully!")
    return encrypted_image_path

if __name__ == "__main__":
    # Example usage
    image_path = "example_image.jpg"  # Change this to the path of your image
    key = 123  # Key for encryption and decryption
    encrypted_image_path = encrypt_image(image_path, key)
