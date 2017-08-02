IDIR = files
SDIR = files
#CC = gcc
CFLAGS = -I$(IDIR)

ODIR = obj
LDIR = ../lib

LIBS = -lm

_DEPS = helloworld.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = helloworld.o hellofunc.o
OBJ = $(patsubst %,$(ODIR)/% ,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	mkdir -p $(ODIR)
	$(CC) -c -o $@ $< $(CFLAGS)

helloworld: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
