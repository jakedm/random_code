LIBS 			= -L/usr/lib/arm-linux-gnueabihf/libmysqlclient.a \
	   			-L/usr/lib/arm-linux-gnueabihf/libmysqlclient.so \
	   			-L/usr/lib/libmodbus.so
#INC 			= -I/usr/include -I/home/pi/Projects/rw_r01/Includes -I/home/pi/Projects/rw_r01/include
INC_DIRS		= /usr/include /home/pi/Projects/rw_r01/Includes /home/pi/Projects/rw_r01/include
#DEPS			= $(wildcard /home/pi/Projects/rw_r01/Includes/*.h) $(wildcard /home/pi/Projects/rw_r01/include/*.h)
FLAGS 			= -g -lpthread -lz -ldl -fexceptions -c
MASTER_FLAGS 	= -g -lpthread -lz -ldl
CPP_SRC			= $(wildcard /home/pi/Projects/rw_r01/Sources/*.cpp)
C_SRC 			= /home/pi/Projects/rw_r01/Sources/mibtree.c
SRCS 			= $(CPP_FILES) $(C_FILE)
CPP_OBJS 		= $(CPP_SRC:.cpp=.o)
C_OBJS			= $(C_SRC:.c=.o)
OBJS			= $(C_OBJS) $(CPP_OBJS)
OBJ_DIR			= ./obj/Debug/Sources
ALT_DIR			= ./obj/Debug/src
MAIN 			= ./bin/Debug/rw_r01
SUBSYS			= $(shell mkdir -p ./obj) $(shell mkdir -p ./bin) $(shell mkdir -p ./obj/Debug) \
				$(shell mkdir -p ./obj/Debug/src) $(shell mkdir -p ./bin/Debug) $(shell mkdir -p ./obj/Debug/Sources)

FLAGS 				+= $(foreach i, $(INC_DIRS), -I$(i))
MASTER_FLAGS 		+= $(foreach i, $(INC_DIRS), -I$(i))

.PHONY:				clean

all:				$(SUBSYS) $(MAIN)
					mkdir -p Target
					cp $(MAIN) Target/


$(MAIN): 			./obj/Debug/main.o $(OBJS) $(ALT_DIR)/SunSpecWatchdog.o
					$(CC) $(MASTER_FLAGS) $(LIBS) -o $(MAIN) $(OBJS) $(ALT_DIR)/SunSpecWatchdog.o ./obj/Debug/main.o

obj/Debug/main.o:
					$(CC) $(FLAGS) /home/pi/Projects/rw_r01/main.cpp -o ./obj/Debug/main.o

%.o:
					$(CC) -o $(OBJ_DIR)/$@ $<  $(FLAGS)

$(ALT_DIR)/SunSpecWatchdog.o:	/home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp
					$(CC) $(FLAGS) -o $@ /home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp

clean:
					@- $(RM) $(MAIN) $(OBJ_DIR)/*.o $(ALT_DIR)/*.o *~ obj/Debug/main.o $(ALT_DIR)/SunSpecWatchdog.o
