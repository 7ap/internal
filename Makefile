TARGET      = target

CXX         = g++
CXXFLAGS    = -O2 -Wall -fPIC

LINKER      = $(CXX)
LFLAGS      = -shared

BIN         = bin
OBJ         = bin/obj
SRC         = src

SOURCES     := $(wildcard $(SRC)/*.cpp)
HEADERS     := $(wildcard $(SRC)/*.hpp)
OBJECTS     := $(SOURCES:$(SRC)/%.cpp=$(OBJ)/%.o)

all: clean build
build: $(BIN)/$(TARGET)

# ****************************************************************

$(BIN)/$(TARGET): $(OBJECTS)
	@$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
	@echo "[*] Compiled '$(BIN)/$(TARGET)'."

$(OBJECTS): $(OBJ)/%.o : $(SRC)/%.cpp
	@$(CXX) $(CXXFLAGS) -c $< -o $@
	@echo "[*] Compiled '$<'."

clean:
	@$(RM) $(OBJ)/**.o
	@echo "[*] Removed '$(OBJ)/**.o'."
	@$(RM) $(BIN)/$(TARGET)
	@echo "[*] Removed '$(BIN)/$(TARGET)'."

setup:
	@mkdir $(BIN) $(OBJ)
