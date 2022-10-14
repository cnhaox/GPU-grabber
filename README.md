# GPU-grabber


> Author: cnhaox
>
> Email: chenjh328[at]mail2.sysu.edu.cn


## 1 Description

There is a Linux GPU-queuing tool that periodically queries the status of GPU(s) and submits tasks to GPU(s) that meet specific requirements.


## 2 How to use?

You can refer to [demo.sh](demo.sh). Here is an example: 

```shell
git clone https://github.com/cnhaox/GPU-grabber.git && cd GPU-grabber
chmod +x ./demo.sh
./demo.sh
```

If you want to adjust **the interval time**, please modify the variable `wait_seconds` in [demo.sh](demo.sh). If you want to set **specific GPU-related requirements**, please modify the command in `` res_ids=`python ./get_gpu_ids.py -N 1` `` of [demo.sh](demo.sh). Here are some examples: 

```shell
# get the id of one GPU
python ./get_gpu_ids.py -N 1
# get the ids of two GPUs that satisfy memory>=2048MiB
python ./get_gpu_ids.py -N 2 -M 2048
# get the ids of eight GPUs that satisfy utilization_rate<=90% and num_of_processes<=3
python ./get_gpu_ids.py -N 8 -U 90 -P 3
# get the ids of three GPUs in [1,4,5] that satisfy memory>=1024MiB 
python ./get_gpu_ids.py -N 3 -M 2048 -I 1 4 5
```

You can obtain more information by executing the following command:

```shell
python ./get_gpu_ids.py -h
```


## 3 What if I have more requirements for GPU(s)? 

In fact, I use a python program [get_gpu_ids.py](get_gpu_ids.py) to process the message from `nvidia-smi` and output id(s) of GPU(s) that meet the requirements. You can freely modify [get_gpu_ids.py](get_gpu_ids.py).