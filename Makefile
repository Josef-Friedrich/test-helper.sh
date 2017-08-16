test:
	./test/bash_unit test/*.bash_unit

sync_dependencies:
	wget -O test/bash_unit https://raw.githubusercontent.com/pgrange/bash_unit/master/bash_unit ; \
	chmod a+x test/bash_unit

.PHONY: test
