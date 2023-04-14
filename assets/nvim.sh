#!/bin/sh

filename=${1}
line=${2}

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ] || [ -n "${NVIM+x}" ]; then
	nvr -O "${filename}" -c "${line}"
else
	nvim "${filename}" -c "${line}"
fi
