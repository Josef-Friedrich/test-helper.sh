#!/usr/bin/env bats

setup() {
	. ./test-helper.sh
	mock_path test/bin/bin1
}

@test "mock_path" {
	run command1
	[ "$status" -eq 69 ]
	[ "${lines[0]}" = 'This is command1!' ]
}

@test "mock_path_nonexistent" {
	mock_path loool
	result=$(echo $PATH | grep loool || : )
	[ -z "$result" ]
}
