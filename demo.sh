#!/bin/bash

success_flag=0
wait_seconds=30 # seconds per checking GPU status
while [ $success_flag -eq 0 ]
do
    res_ids=`python ./get_gpu_ids.py -N 1`
    if [ ${#res_ids} -eq 0 ]; then
        printf "\r%s: There is no gpu available. The status of GPU(s) will be checked again after %d second(s). " "$(date)" $wait_seconds
        sleep $wait_seconds
    else
        success_flag=1
    fi
done

echo "The GPU(id=$res_ids) is available! "
CUDA_VISIBLE_DEVICES=$res_ids python demo_torch.py