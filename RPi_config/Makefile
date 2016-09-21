CC				= g++
LIBS 			= -L/usr/lib/arm-linux-gnueabihf/libmysqlclient.a \
	   			-L/usr/lib/arm-linux-gnueabihf/libmysqlclient.so \
	   			-L/usr/lib/libmodbus.so
INC 			= -I/usr/include
FLAGS 			= -g -lpthread -lz -ldl -Wall -fexceptions -c
MASTER_FLAGS 	= -g -lpthread -lz -ldl
SRC_DIR_1		= /home/pi/Projects/rw_r01/
SRC_DIR			= /home/pi/Projects/rw_r01/Sources/
CPP_FILES 		= databaseClean.cpp dataStore.cpp iniProcessor.cpp mibContainer.cpp \
				oidLeafFunctions.cpp oidReader.cpp snmpReader.cpp SunSpecConnection.cpp \
				SunSpecDefinitions.cpp SunSpecEntries.cpp SunSpecEntry.cpp SunSpecMain.cpp \
				SunSpecMysql.cpp SunSpecStore.cpp terminalMessages.cpp
C_FILE = /home/pi/Projects/rw_r01/Sources/mibtree.c
SRCS = $(CPP_FILES) $(C_FILE)
OBJS = $(CPP_FILES:.cpp=.o) $(C_FILE:.c=.o) 
MAIN = bin/Debug/rw_r01


all:		$(MAIN)

$(MAIN): 	$(OBJS) obj/Debug/src/SunSpecWatchdog.o
			$(CC) $(MASTER_FLAGS) $(LIBS) -o $(MAIN)  $(OBJS) obj/Debug/src/SunSpecWatchdog.o

.c.o:
        $(CC) $(FLAGS) /home/pi/Projects/rw_01/Sources/$<  -o obj/Debug/Sources/$@

obj/Debug/Sources/main.o:
		$(CC) $(FLAGS) $(INC) /home/pi/Projects/rw_r01/main.cpp -o obj/Debug/src/main.o

obj/Debug/src/SunSpecWatchdog.o:
			$(CC) $(FLAGS) $(INC) /home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp -o obj/Debug/src/SunSpecWatchdog.o

clean:
        $(RM) *.o *~ $(MAIN)

#depend: $(SRCS)
#        makedepend $(INCLUDES) $^
#
# DO NOT DELETE THIS LINE -- make depend needs it





#####################################################
	#CODEBLOCKS OUTPUT
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/main.cpp -o obj/Debug/main.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/databaseClean.cpp -o obj/Debug/Sources/databaseClean.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/dataStore.cpp -o obj/Debug/Sources/dataStore.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/iniProcessor.cpp -o obj/Debug/Sources/iniProcessor.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/mibContainer.cpp -o obj/Debug/Sources/mibContainer.o
	gcc -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/mibtree.c -o obj/Debug/Sources/mibtree.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/oidLeafFunctions.cpp -o obj/Debug/Sources/oidLeafFunctions.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/oidReader.cpp -o obj/Debug/Sources/oidReader.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/snmpReader.cpp -o obj/Debug/Sources/snmpReader.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecConnection.cpp -o obj/Debug/Sources/SunSpecConnection.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecDefinitions.cpp -o obj/Debug/Sources/SunSpecDefinitions.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecEntries.cpp -o obj/Debug/Sources/SunSpecEntries.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecEntry.cpp -o obj/Debug/Sources/SunSpecEntry.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecMain.cpp -o obj/Debug/Sources/SunSpecMain.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecMysql.cpp -o obj/Debug/Sources/SunSpecMysql.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/SunSpecStore.cpp -o obj/Debug/Sources/SunSpecStore.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/Sources/terminalMessages.cpp -o obj/Debug/Sources/terminalMessages.o
	g++ -Wall -fexceptions -g -g -IIncludes -I/usr/include -Iinclude -c /home/pi/Projects/rw_r01/src/SunSpecWatchdog.cpp -o obj/Debug/src/SunSpecWatchdog.o

 Output file is bin/Debug/rw_r01 with size 3.69 MB
 Running project post-build steps
 mkdir -p Target
 cp bin/Debug/rw_r01 Target/
##################################################
