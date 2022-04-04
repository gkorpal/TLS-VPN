#include <stdio.h>
#include <openssl/bn.h>
#include <string.h>

void printBN(char *msg, BIGNUM * a)
{
  /* Use BN_bn2hex(a) for hex string
   * Use BN_bn2dec(a) for decimal string */
  char * number_str = BN_bn2hex(a); 
  printf("%s %s\n", msg, number_str);
  OPENSSL_free(number_str);
}

int main ()
{
  // BIGNUM API struct
  BN_CTX *ctx = BN_CTX_new();

  // initialize n, e
  BIGNUM *n = BN_new();
  BN_hex2bn(&n, "AE1CD4DC432798D933779FBD46C6E1247F0CF1233595113AA51B450F18116115"); // given 
  BIGNUM *e = BN_new();
  BN_hex2bn(&e, "010001"); // given

  // verifying the signature
  int length = 1+strlen("4C61756E63682061206D697373696C652E"); // given
  char *M = malloc(sizeof(char)*length);
  strncpy(M, "4C61756E63682061206D697373696C652E", length);
  BIGNUM *S = BN_new();
  BN_hex2bn(&S, "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F"); // given 
  BIGNUM *m = BN_new();
  BN_mod_exp(m, S, e, n, ctx);
  if (strcmp(BN_bn2hex(m), M) == 0) {
    printf("Signature verified\n");
  } else { 
    printf("Signature verification failed\n");
  }
  
  // clear data from the memory
  BN_clear_free(n);
  BN_clear_free(e);
  free(M);
  BN_clear_free(S);
  BN_clear_free(m);
  
  return 0;
}
