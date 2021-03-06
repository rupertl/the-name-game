executables = \
	c/the-name-game \
	cpp/the-name-game \
	rust/the-name-game

exec_drivers = \
	java/the-name-game-driver.sh

scripts = \
	emacs-lisp/the-name-game-driver.sh	\
    js/the-name-game.js \
	perl/the-name-game.pl \
    ocaml/the-name-game.ml \
	ruby/the-name-game.rb \
    R/the-name-game.R \
	scala/the-name-game.scala

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
	-rm $(executables) */*.o *~ */*~ java/*.class scala/*.jar


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

# R - tested with R 3.0.3, no special packages

# Ruby - tested with ruby 1.9.3

# Scala - tested with scala 2.9.2

# Javascript - tested with node.js v0.10.15, not using any node
# specific features

# Ocaml - tested with ocaml 3.12.1

# Rust - tested with rustc 0.12.0-dev nightly
rust/the-name-game: rust/the-name-game.rs
	rustc -o rust/the-name-game rust/the-name-game.rs
