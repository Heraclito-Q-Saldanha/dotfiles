LOCAL_BIN=${HOME}/.local/bin

if [ -d "$LOCAL_BIN" ]; then
	PATH=${PATH}:${LOCAL_BIN}
fi