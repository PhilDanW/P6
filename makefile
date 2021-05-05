CC	= gcc
TARGETS	= oss user 
OBJS	= oss.o user.o
SRCDIR  = src
HEADER = shm_header.h
LDFLAGS = -pthread -lpthread

all: $(TARGETS)

$(TARGETS): % : %.o
		$(CC) -o $@ $< $(LDFLAGS)

$(OBJS) : %.o : $(SRCDIR)/%.c
		$(CC) -c $< $(LDFLAGS)

clean:
		/bin/rm -f *.o $(TARGETS) *.log *.out

cleanobj: 
		/bin/rm -f *.o
