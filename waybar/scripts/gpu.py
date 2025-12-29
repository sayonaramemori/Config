import subprocess
import json

cmd = "nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,power.draw,memory.used,memory.total --format=csv,noheader,nounits"
out = subprocess.check_output(cmd.split()).decode().strip()

gpu, temp, power, mem_used, mem_total = out.split(',')
print(f'GPU:{gpu:3}%{temp:2}{power:3} {mem_used} {mem_total}')
