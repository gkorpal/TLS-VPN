#include <stdio.h>
#include <openssl/bn.h>

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

  // initialize n, d
  BIGNUM *n = BN_new();
  BN_hex2bn(&n, "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5"); // given 
  BIGNUM *d = BN_new();
  BN_hex2bn(&d, "74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D"); // given

  // signing the message
  BIGNUM *M = BN_new();
  BN_hex2bn(&M, "49206f776520796f752024323030302e"); // given
  BIGNUM *s = BN_new();
  BN_mod_exp(s, M, d, n, ctx);
  printBN("Signature:", s);
  
  // clear data from the memory
  BN_clear_free(n);
  BN_clear_free(d);
  BN_clear_free(M);
  BN_clear_free(s);
  
  return 0;
}
