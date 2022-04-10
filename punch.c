#define _GNU_SOURCE
#include<fcntl.h>
#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[]){
	long long x = 250966470656;
	int blocksize = 4096;
	if(argc < 2){ printf("i need file to work with\n"); exit(1);}
	int fd;
	printf("punching %s...\n", argv[1]);
	fd = open(argv[1], O_RDWR|O_LARGEFILE);
	if(fd == -1){ printf("file doesnt exist?\n"); exit(1);}
	x = lseek64(fd, 0, SEEK_END);
	close(fd);
	printf("filesize = %lld\n", x);
	if(argc == 3) blocksize = atoi(argv[2]);
	printf("blocksize = %d\n", blocksize);
	for(long long j = 3; j <= 10; j+=7){
		fd = open(argv[1], O_RDWR|O_LARGEFILE);
		if(fd == -1){ printf("file doesnt exist?\n"); exit(1);}
		for(long long i = 0; i < x; i += blocksize*j){
			printf("\r%lld percent...  %lld", 100/j, i);
			fallocate(fd, FALLOC_FL_PUNCH_HOLE|FALLOC_FL_KEEP_SIZE, i, blocksize);
		}
		printf("\n");
		close(fd);
	}
	printf("done\n");

	return 0;
}
