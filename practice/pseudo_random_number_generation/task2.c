#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define KEYSIZE 16

void main()
{
  int i;
  
  for(long int t = 1524017329; t <= 1524024529; t++){
    char key[KEYSIZE];
    srand (t);
    
    for (i = 0; i< KEYSIZE; i++){
      key[i] = rand()%256;
      printf("%.2x", (unsigned char)key[i]);
    }
    printf("\n");
  }
}
