wget_github = wget -O $(1) https://raw.githubusercontent.com/$(2) ; \
	chmod a+x $(1)

test:
	./test/bash_unit test/*.bash_unit

sync_dependencies:
	$(call wget_github,test/bash_unit,pgrange/bash_unit/master/bash_unit)

.PHONY: test sync_dependencies
