[![Build Status](https://travis-ci.org/JosefFriedrich-shell/test-helper.sh.svg?branch=master)](https://travis-ci.org/JosefFriedrich-shell/test-helper.sh)

# test-helper.sh
A collection of helper functions for shell-script testing

## Testing frameworks

* [bash unit](https://github.com/pgrange/bash_unit)
* [bats](https://github.com/sstephenson/bats)
* [shunit2](https://github.com/kward/shunit2)

## Blog posts

* [Mocking Bash](https://pbrisbin.com/posts/mocking_bash/)

# Usage

```sh
. ./test-helper.sh
```

## `mock_path`

```sh
. ./test-helper.sh
mock_path /home/jf/shell/test/bin
echo $PATH
```

Result: `/home/jf/shell/test/bin:/bin:/sbin/...`

```sh
. ./test-helper.sh
PARENT_MOCK_PATH=/tests/bin
mock_path for-script1:for-script2:for-script3
echo $PATH
```

Result: `/tests/bin/for-script1:/tests/bin/for-script2:/tests/bin/for-script3:/bin:/sbin/.....`

## `source_exec` (source executable scripts)

The function `source_exec` includes a file until a separator string
appears. By default the separator is:

```
## This SEPARATOR is required for test purposes. Please don’t remove! ##
```

`cat executable_script.sh`:

```sh
#! /bin/sh

_echo_lol() {
	echo lol
}

## This SEPARATOR is required for test purposes. Please don’t remove! ##

echo "If you see this text, then the function didn’t work"
```

In your test environment:

```sh
. ./test-helper.sh
source_exec executable_script.sh

test_lol() {
  assert _echo_lol ....
}
```

Use the environment variable `SOURCE_EXEC_SEPARATOR` to set your own
separator string.

## `patch`

Useful to rename builtin command.


```
patch <file> <sed-statements>
```

```sh
patch test-helper.sh 's/local /superlocal /g'
```

or multiple `sed` statements

```sh
patch test-helper.sh -e 's/local /superlocal /g' -e 's/for /superfor /g'
```
