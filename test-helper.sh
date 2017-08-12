#! /bin/sh

mock_path() {
	SAVEIFS=$IFS
	IFS=:
	local TMP_PATH
	TMP_PATH=
	if [ -n "$PARENT_MOCK_PATH" ]; then
		for P in $1 ; do
			TMP_PATH="${TMP_PATH}${PARENT_MOCK_PATH}/${P}:"
		done
		export PATH="${TMP_PATH}${PATH}"
	else
		export PATH="$1:${PATH}"
	fi
	IFS=$SAVEIFS
}

source_script() {
	local TMP_FILE=$(mktemp)
	local SEPARATOR='### This SEPARATOR is needed for the tests. Do not remove it! ##########'
	sed "/$SEPARATOR/Q" "$1" > "$TMP_FILE"
	. "$TMP_FILE"
}
