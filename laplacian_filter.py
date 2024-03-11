import torch
from torch import nn

def laplacian_sharpness(image):
    # Convert image to grayscale if it's not already
    if image.shape[1] > 1:
    image = image.mean(dim=1, keepdim=True)

    # Define Laplacian filter
    filter = torch.tensor([[0, 1, 0], [1, -4, 1], [0, 1, 0]], dtype=torch.float32).unsqueeze(0).unsqueeze(0)

    # Apply filter and calculate mean absolute value
    laplacian = nn.functional.conv2d(image, filter, bias=False)
    sharpness = torch.mean(torch.abs(laplacian))

    return sharpness
