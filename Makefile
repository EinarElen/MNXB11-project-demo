
CXX := g++
CXXWARNINGS := -Wall -Wextra -Werror
CXXOPT := -O3
CXXSTD := -std=c++17
INCLUDES := -I include -I `root-config --incdir` -I external/include
CXXFLAGS := $(CXXWARNINGS) $(CXXSTD) $(CXXOPT) $(INCLUDES)
LDFLAGS := `root-config --libs` -L external/lib -L external/lib64 -largumentum

.PHONY: all clean

all: main

# If you add new source files in the src/ directory, remember to add the
# corresponding object file as a dependency here so that Make knows that it
# should build it and link to it
main: main.cxx  src/Measurement.o src/Analysis.o src/DataExtraction.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)


src/%.o: src/%.cxx
	$(CXX) $(CXXFLAGS) $^ -c -o $@

clean:
	rm -v src/*.o main
