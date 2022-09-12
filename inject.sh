#! /bin/bash

# Usage
# sudo ./inject.sh <PATH_TO_LIBRARY> <PID>
# sudo ./inject.sh <PATH_TO_LIBRARY> $(pgrep <PROCESS_NAME>)
# sudo ./inject.sh ${PWD}/bin/target $(pgrep linux_64_client)

lib=$1
pid=$2

gdb -n -q -batch-silent \
  -ex "attach $pid" \
  -ex "set \$dlopen = (void*(*)(char*, int)) dlopen" \
  -ex "call \$dlopen(\"$lib\", 1)" \
  -ex "detach" \
  -ex "quit"

echo "[*] Injected '$lib' into '$pid'."
