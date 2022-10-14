import torch

print("The demo_torch.py is running. The number of available gpus: ", torch.cuda.device_count())
for i in range(torch.cuda.device_count()):
    print("ID %d: %s"%(i, torch.cuda.get_device_name(i)))
print("Done! ")