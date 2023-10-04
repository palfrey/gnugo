EXTRA_DIST = CMakeLists.txt

# Remove these files here... they are created locally
DISTCLEANFILES = *~

AM_CPPFLAGS = \
	$(GNU_GO_WARNINGS) \
	-I../patterns \
	-I$(top_srcdir)/patterns \
	-I$(top_srcdir)/sgf \
	-I$(top_srcdir)/utils

noinst_HEADERS = cache.h gnugo.h hash.h clock.h readconnect.h \
                 influence.h liberty.h move_reasons.h board.h

# preconfigured settings for various configurations
noinst_LIBRARIES = libengine.a libengine-host.a libboard.a libboard-host.a

libengine_a_SOURCES = \
      aftermath.c \
      board.c \
      boardlib.c \
      breakin.c \
      cache.c \
      clock.c \
      combination.c \
      dragon.c \
      endgame.c \
      filllib.c \
      fuseki.c \
      genmove.c \
      globals.c \
      handicap.c \
      hash.c \
      influence.c \
      interface.c \
      matchpat.c \
      montecarlo.c \
      move_reasons.c \
      movelist.c \
      optics.c \
      oracle.c \
      owl.c \
      persistent.c \
      printutils.c \
      readconnect.c \
      reading.c \
      semeai.c \
      sgfdecide.c \
      sgffile.c \
      shapes.c \
      showbord.c \
      surround.c \
      unconditional.c \
      utils.c \
      value_moves.c \
      worm.c

libboard_a_SOURCES = \
      board.c \
      boardlib.c \
      hash.c \
      printutils.c

LINK_FOR_BUILD.c = $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD)
COMPILE_FOR_BUILD = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

%-host.o : %.c	
	$(AM_V_CC)$(COMPILE_FOR_BUILD) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po

libengine_host_a_SOURCES = 
libengine_host_a_DEPENDENCIES = $(patsubst %.c,%-host.o,$(libengine_a_SOURCES))

libengine-host.a: $(libengine_host_a_OBJECTS) $(libengine_host_a_DEPENDENCIES)
	rm -f libengine-host.a
	$(AM_V_AR)$(libengine_host_a_AR) libengine-host.a $(libengine_host_a_OBJECTS) $(libengine_host_a_DEPENDENCIES)
	x86_64-linux-gnu-ranlib libengine-host.a

libboard_host_a_SOURCES = 
libboard_host_a_DEPENDENCIES = $(patsubst %.c,%-host.o,$(libboard_a_SOURCES))

libboard-host.a: $(libboard_host_a_OBJECTS) $(libboard_host_a_DEPENDENCIES)
	rm -f libboard-host.a
	$(AM_V_AR)$(libboard_host_a_AR) libboard-host.a $(libboard_host_a_OBJECTS) $(libboard_host_a_DEPENDENCIES)
	x86_64-linux-gnu-ranlib libboard-host.a
