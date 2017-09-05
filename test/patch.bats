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

@test "patch: replace" {
	patch test-helper.sh 's/local /superlocal /g'
	grep 'superlocal ' test-helper.sh_patched
}

@test "patch: replace multiple -e" {
	patch test-helper.sh -e 's/local /superlocal /g' -e 's/for /superfor /g'
	grep 'superlocal ' test-helper.sh_patched
	grep 'superfor ' test-helper.sh_patched

}
