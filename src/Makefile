###############################################################################
##  Shared and static C/C++ libraries Makefile for Majordome
###############################################################################

CXX               := g++
AR                := ar
ARFLAGS           := rcs
RM                := rm -rf
MKDIR_P           := mkdir -p

OPTIONS           := -O3 -std=c++17 -Wall -Wextra

BUILD_DIR         := build
LIB_DIR           := lib

# =============================================================================
#  pluglib configuration
# =============================================================================

PLUGLIB_SRC_DIR   := pluglib
PLUGLIB_BUILD_DIR := $(BUILD_DIR)/pluglib

PLUGLIB_INCLUDES  := -I$(PLUGLIB_SRC_DIR) \
                     -I/usr/local/include \
                     -I/usr/include/eigen3 \
                     -I/usr/lib/x86_64-linux-gnu/openmpi/include

PLUGLIB_LIBS      := -L/usr/local/lib -Wl,-rpath,/usr/local/lib \
                     -L/usr/lib/x86_64-linux-gnu/openmpi/lib \
                     -lcantera_shared \
                     -lsundials_ida \
                     -lsundials_nvecserial \
                     -lopenblas \
                     -llapack \
                     -lpthread

PLUGLIB_CPPFLAGS  := $(OPTIONS) -fPIC $(PLUGLIB_INCLUDES)

PLUGLIB_CPP_SRCS  := $(wildcard $(PLUGLIB_SRC_DIR)/*.cpp)
PLUGLIB_CPP_OBJS  := $(patsubst $(PLUGLIB_SRC_DIR)/%.cpp,$(PLUGLIB_BUILD_DIR)/%.o,$(PLUGLIB_CPP_SRCS))

PLUGLIB_C_SRCS    := $(wildcard $(PLUGLIB_SRC_DIR)/*.c)
PLUGLIB_C_OBJS    := $(patsubst $(PLUGLIB_SRC_DIR)/%.c,$(PLUGLIB_BUILD_DIR)/%.o,$(PLUGLIB_C_SRCS))

PLUGLIB_ALL_OBJS  := $(PLUGLIB_CPP_OBJS) $(PLUGLIB_C_OBJS)

PLUGLIB_STATIC    := $(LIB_DIR)/libCanteraPFR.a
PLUGLIB_SHARED    := $(LIB_DIR)/libCanteraPFR_shared.so

###############################################################################
##  TARGETS
###############################################################################

.PHONY: all
all: pluglib

.PHONY: pluglib
pluglib: pluglib_shared pluglib_static

.PHONY: pluglib_shared
pluglib_shared: $(PLUGLIB_SHARED)

.PHONY: pluglib_static
pluglib_static: $(PLUGLIB_STATIC)

$(PLUGLIB_STATIC): $(PLUGLIB_ALL_OBJS) | $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^

$(PLUGLIB_SHARED): $(PLUGLIB_ALL_OBJS) | $(LIB_DIR)
	$(CXX) -shared -fPIC -o $@ $^ $(PLUGLIB_LIBS)

$(PLUGLIB_BUILD_DIR)/%.o: $(PLUGLIB_SRC_DIR)/%.cpp | $(PLUGLIB_BUILD_DIR)
	$(CXX) $(PLUGLIB_CPPFLAGS) -c $< -o $@

$(PLUGLIB_BUILD_DIR)/%.o: $(PLUGLIB_SRC_DIR)/%.c | $(PLUGLIB_BUILD_DIR)
	$(CXX) $(PLUGLIB_CPPFLAGS) -x c++ -c $< -o $@

$(PLUGLIB_BUILD_DIR) $(LIB_DIR):
	$(MKDIR_P) $@

.PHONY: clean
clean:
	$(RM) $(BUILD_DIR)

.PHONY: distclean
distclean: clean
	$(RM) $(LIB_DIR)

###############################################################################
##  EOF
###############################################################################
