CC = gcc
CFLAGS = -std=c99 -pedantic -Werror -Wall -Wextra -Wvla

SRCS = // c files
OBJS = $(SRCS:.c=.o)
BIN = // binary name

all: $(BIN)
	$(CC) -o $(BIN) $(OBJS)

$(BIN): $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS)
	$(RM) $(BIN)
