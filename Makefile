include ../Makefile.inc

CFLAGS  = $(PRJCFLAGS) -fPIC
INCS    = $(PRJINCS) -I..
LIBS    = $(PRJLIBS)
SRCS    = $(wildcard *.c)
OBJS    = $(SRCS:.c=.o)
DIR		= performance
OBJLIBS = lib$(DIR).so

all: $(OBJLIBS)

lib$(DIR).so : $(OBJS)
	$(ECHO) $(CC) $(CFLAGS) $(INCS) -shared -Wl,-soname,$@ -o ../$@ $(OBJS) $(LIBS)
	$(CC) $(CFLAGS) $(INCS) -shared -Wl,-soname,$@ -o ../$@ $(OBJS) $(LIBS)

.c.o:
	$(ECHO) $(CC) $(CFLAGS) $(INCS) -c $< -o $@
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

clean:
	$(ECHO) Cleaning up in $(DIR) ...
	$(ECHO) $(RM) -f $(OBJS) $(BIN)
	$(RM) -f $(OBJS) $(BIN)

