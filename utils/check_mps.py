import torch

def check_mps_availability():
    """Checks if MPS is available.

    Returns:
        bool: True if MPS is available, False otherwise.
    """

    try:
        # Check for MPS availability using the recommended method
        is_mps_available = torch.backends.mps.is_available()
        if is_mps_available:
            print("MPS is available!")
            # You can use MPS for computations (if applicable)
        else:
            print("MPS is not available.")

    except ModuleNotFoundError:
        # Handle the case where `torch.backends.mps` is not available (older PyTorch versions)
        print("MPS functionality is not found in your PyTorch installation.")

if __name__ == "__main__":
    check_mps_availability()
