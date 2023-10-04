noinst_PROGRAMS = sgfgen

sgfgen_SOURCES = sgfgen.c

EXTRA_DIST = sgf_extras.def sgf_properties.def CMakeLists.txt

noinst_HEADERS = \
	sgftree.h\
	sgf_properties.h

# Remove these files here... they are created locally
DISTCLEANFILES = *~

AM_CPPFLAGS = $(GNU_GO_WARNINGS) -I$(top_srcdir)/utils

noinst_LIBRARIES = libsgf.a libsgf-host.a

libsgf_a_SOURCES = \
	sgf_utils.c \
	sgfnode.c \
	sgftree.c

# To rebuild sgf_properties.h in case sgf_properties.def or sgf_extras.def 
# is changed, 'make sgf_properties'. Normally this is not needed.
sgf_properties:
	cat $(srcdir)/sgf_properties.def $(srcdir)/sgf_extras.def |\
		./sgfgen > sgf_properties.h

LINK_FOR_BUILD.c = $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD)
COMPILE_FOR_BUILD = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

%-host.o : %.c	
	$(AM_V_CC)$(COMPILE_FOR_BUILD) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po

libsgf_host_a_SOURCES = 
libsgf_host_a_DEPENDENCIES = $(patsubst %.c,%-host.o,$(libsgf_a_SOURCES))

libsgf-host.a: $(libsgf_host_a_OBJECTS) $(libsgf_host_a_DEPENDENCIES)
	rm -f libsgf-host.a
	$(AM_V_AR)$(libsgf_host_a_AR) libsgf-host.a $(libsgf_host_a_OBJECTS) $(libsgf_host_a_DEPENDENCIES)
	x86_64-linux-gnu-ranlib libsgf-host.a
