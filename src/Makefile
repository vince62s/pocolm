
all:


TESTFILES = count-test

OBJFILES = count.o lm-state.o lm-state-derivs.o

BINFILES = get-text-counts get-int-counts print-int-counts \
	merge-counts print-counts discount-counts print-float-counts \
    discount-counts-1gram merge-float-counts compute-probs \
    print-float-derivs perturb-float-counts discount-counts-1gram-backward \
    print-derivs perturb-counts

$(BINFILES): $(OBJFILES)


all: $(TESTFILES) $(BINFILES)

clean:
	-rm *.o $(BINFILES) $(TESTFILES)

CXXFLAGS += -Wall -g -stdlib=libstdc++
LDFLAGS += -g -stdlib=libstdc++

LDLIBS =
CXX = g++
CC = $(CXX)
RANLIB = ranlib
AR = ar

depend:
	-$(CXX) -M $(CXXFLAGS) *.cc > .depend.mk

.depend.mk: depend
-include .depend.mk
