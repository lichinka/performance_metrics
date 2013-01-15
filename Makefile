
CC	= gcc
CFLAGS  = -g -O0 -Wall -mtune=native -fno-strict-aliasing -pipe -fPIC -Wno-unused-function
INCS    = -I.
LIBS    = -lpapi
SRCS    = $(wildcard *.c)
OBJS    = $(SRCS:.c=.o)
DIR		= performance
OBJLIBS = lib$(DIR).so

all: $(OBJLIBS)

lib$(DIR).so : $(OBJS)
	$(CC) $(CFLAGS) $(INCS) -shared -Wl,-soname,$@ -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	rm -f $(OBJS) $(OBJLIBS)

