wget_github = wget -O $(1) https://raw.githubusercontent.com/$(2) ; \
	chmod a+x $(1)

test:
<<<<<<< HEAD
	./test/bash_unit test/*.bash_unit

sync_dependencies:
	$(call wget_github,test/bash_unit,pgrange/bash_unit/master/bash_unit)
=======
	@echo "PATH: $(PATH)"
	@echo
	@echo "PWD: $(shell pwd)"
	@echo

	./test.sh

sync_dependencies:
	$(call wget_github,test/lib/bash_unit,pgrange/bash_unit/master/bash_unit)
	rm -rf tmp_bats
	rm -rf test/lib/bats
	git clone https://github.com/sstephenson/bats.git tmp_bats
	mv tmp_bats/libexec test/lib/bats
	rm -rf tmp_bats
>>>>>>> b143ad48916396b8902c22402cc10c5b01ce1447

.PHONY: test sync_dependencies
