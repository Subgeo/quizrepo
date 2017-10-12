CC=g++
CFLAGS=-g -c
#compile with warnings and debug

all: build doczip

build: college.o course.o collegemain.o doc
	$(CC) college.o course.o collegemain.o

myexe: college.o course.o collegemain.o doc
	$(CC) college.o course.o collegemain.o

college.o: college.h college.cc
	$(CC) $(CFLAGS) college.cc

collegemain.o: college.h course.h node.h collegemain.cc
	$(CC) $(CFLAGS) collegemain.cc

course.o: course.h course.cc
	$(CC) $(CFLAGS) course.cc

#archive the contents of the current directory
doczip:
	tar -cvzf college.tar.gz *

#remove .o files and executable
clean:
	-rm *.o
	-rm .class
	-rm -rf html
	-rm -rf latex
	-rm a.out

doc: 
	@doxygen Doxyfile
