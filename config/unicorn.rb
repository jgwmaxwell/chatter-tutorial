worker_processes 1 # amount of unicorn workers to spin up
                   # increasing this, within reason, can improve performance
timeout 30         # restarts workers that hang for 30 seconds
