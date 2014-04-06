executables = \
	c/the-name-game \
	cpp/the-name-game

exec_drivers = \
	java/the-name-game-driver.sh

scripts = \
	emacs-lisp/the-name-game-driver.sh	\
	perl/the-name-game.pl \
	ruby/the-name-game.rb

all: build test

build: $(executables) $(exec_drivers)

test: $(executables) $(exec_drivers) $(scripts)
	@for IMPL in $^ ; do \
		export IMPL; \
		echo "\nTesting $$IMPL\n"; \
		prove; \
        if [ $$? -ne 0 ]; then exit 1; fi # bail out if one failed \
	done

clean:
	-rm $(executables) */*.o *~ */*~ java/*.class


##############################################################################

# C - tested with gcc 4.8.1
CFLAGS = -Wall -Werror -g -O2 --std=c99

# C++ - tested with gcc 4.8.1
CXXFLAGS = -Wall -Werror -g -O2 --std=c++11

# Emacs - requires any GNU emacs

# Java - tested with Java SE 1.6.0
.SUFFIXES: .java .class
.java.class:
	javac -cp java $*.java
JAVA_CLASSES = java/TheNameGame.java java/Name.java
java/the-name-game-driver.sh: $(JAVA_CLASSES:.java=.class)

# Perl - requires perl 5.10.1 or later

# Ruby - tested with ruby 1.9.3
