#!/usr/bin/env bats

setup() {
	. ./test-helper.sh
	mock_path test/bin/bin1
	patch test-helper.sh
}

@test "patch: file exists" {
	[ -f test-helper.sh_patched ]
}

@test "patch: .gitignore exists" {
	[ -f .gitignore ]
}

@test "patch: entry in .gitignore" {
	grep '*_patched' .gitignore
}
