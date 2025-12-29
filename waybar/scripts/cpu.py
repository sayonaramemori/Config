#!/usr/bin/env python3
import psutil
import json
import time
def get_cpu_temp_from_sensors():
    temps = psutil.sensors_temperatures()
    
    # AMD systems often use 'k10temp' or 'coretemp'
    cpu_data = temps.get('k10temp') or temps.get('coretemp')
    if cpu_data:
        # Tctl is usually present as the first reading in k10temp
        # We can look for the reading with the highest current temperature if Tctl label is not explicit
        # A simple approach is to find the maximum temperature in the k10temp group:
        max_temp = max(t.current for t in cpu_data)
        # Alternatively, we can specifically look for the 'Tctl' label if it was present in psutil's parsing:
        tctl_temp = next((t.current for t in cpu_data if t.label == 'Tctl'), None)
        if tctl_temp is not None:
            return f"{int(tctl_temp)}°C"
        else:
            return f"{int(max_temp)}°C"
    return ""

# Get CPU usage system-wide, averaged over a 1-second interval
# The function will block for 1 second.

# pacman -S python-psutil && yes | sensors
if __name__ == "__main__":
    tcpu = get_cpu_temp_from_sensors() 
    cpu_percent = psutil.cpu_percent(interval=0.3) # usage
    pcpu = f"{int(cpu_percent):-2}%"
# 
    res_full = f"\n {pcpu} {tcpu}"
    res = f" {tcpu}"
    # print(res)
    print(json.dumps({
        "text": res,
        "tooltip": res_full,
        "class": "cpu-history"
    }))
