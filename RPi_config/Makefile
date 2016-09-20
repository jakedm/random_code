CC = gcc
FLAGS = -g -lpthread -lz -ldl
LIBS = -L/usr/lib/arm-linux-gnueabihf/libmysqlclient.a -L/usr/lib/arm-linux-gnueabihf/libmysqlclient.so -L/usr/lib/libmodbus.so
INC = -I/usr/include
default:  main

main:
	$(CC) $(FLAGS) $(LIBS) $(INC) -o main main.cpp
