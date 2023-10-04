noinst_LIBRARIES = libutils.a libutils-host.a

EXTRA_DIST = CMakeLists.txt

utils_sources = getopt.c getopt1.c random.c gg_utils.c winsocket.c
libutils_a_SOURCES = $(utils_sources)

noinst_HEADERS = gg-getopt.h random.h gg_utils.h winsocket.h

# Remove these files here... they are created locally
DISTCLEANFILES = *~

LINK_FOR_BUILD.c = $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD)
COMPILE_FOR_BUILD = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

%-host.o : %.c	
	$(AM_V_CC)$(COMPILE_FOR_BUILD) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po

libutils_host_a_SOURCES = 
libutils_host_a_DEPENDENCIES = $(patsubst %.c,%-host.o,$(utils_sources))

libutils-host.a: $(libutils_host_a_OBJECTS) $(libutils_host_a_DEPENDENCIES)
	rm -f libutils-host.a
	$(AM_V_AR)$(libutils_host_a_AR) libutils-host.a $(libutils_host_a_OBJECTS) $(libutils_host_a_DEPENDENCIES)
	x86_64-linux-gnu-ranlib libutils-host.a
