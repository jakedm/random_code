CC				= g++
LIBS 			= -L/usr/lib/arm-linux-gnueabihf/libmysqlclient.a \
	   			-L/usr/lib/arm-linux-gnueabihf/libmysqlclient.so \
	   			-L/usr/lib/libmodbus.so
INC 			= -I/usr/include -I/home/pi/Projects/rw_r01/Includes -I/home/pi/Projects/rw_r01/include
DEPS			= $(wildcard /home/pi/Projects/rw_r01/Includes/*.h) $(wildcard /home/pi/Projects/rw_r01/include/*.h)
FLAGS 			= -g -lpthread -lz -ldl -fexceptions $(INC) -c
MASTER_FLAGS 	= -g -lpthread -lz -ldl $(INC)
CPP_SRC			= $(wildcard /home/pi/Projects/rw_r01/Sources/*.cpp)
C_SRC 			= /home/pi/Projects/rw_r01/Sources/mibtree.c
SRCS 			= $(CPP_FILES) $(C_FILE)
OBJS 			= $(CPP_SRC:.cpp=.o) $(C_SRC:.c=.o)
OBJ_DIR			= ./obj/Debug/Sources
ALT_DIR			= ./obj/Debug/src
MAIN 			= ./bin/Debug/rw_r01
SUBSYS			= $(shell mkdir -p ./obj) $(shell mkdir -p ./bin) $(shell mkdir -p ./obj/Debug) \
				$(shell mkdir -p ./obj/Debug/src) $(shell mkdir -p ./bin/Debug) $(shell mkdir -p ./obj/Debug/Sources)

all:				$(SUBSYS) $(OBJS) $(MAIN)
					mkdir -p Target
					cp $(MAIN) Target/


$(MAIN): 			$(DEPS) ./obj/Debug/main.o $(OBJS) $(ALT_DIR)/SunSpecWatchdog.o
					$(CC) $(MASTER_FLAGS) $(LIBS) -o $(MAIN) $(OBJS) $(ALT_DIR)/SunSpecWatchdog.o ./obj/Debug/main.o

obj/Debug/main.o:	$(DEPS)
					$(CC) $(FLAGS) /home/pi/Projects/rw_r01/main.cpp -o ./obj/Debug/main.o

%.o:				$(DEPS)
					$(CC) -o $(OBJ_DIR)/$@ $<  $(FLAGS)

$(ALT_DIR)/SunSpecWatchdog.o: $(DEPS) /home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp
					$(CC) $(FLAGS) -o $@ /home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp

clean:
					rm $(MAIN) $(OBJ_DIR)/*.o $(ALT_DIR)/*.o *~ obj/Debug/main.o $(ALT_DIR)/SunSpecWatchdog.o

#depend: 			$(SRCS) $(DEPS) 
#        			makedepend $(INC) $^
#
# DO NOT DELETE THIS LINE -- make depend needs it





#####################################################
# Output file is bin/Debug/rw_r01 with size 3.69 MB
# Running project post-build steps
# mkdir -p Target
# cp bin/Debug/rw_r01 Target/
##################################################
