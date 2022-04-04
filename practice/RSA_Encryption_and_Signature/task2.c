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

  // initialize n, e
  BIGNUM *n = BN_new();
  BN_hex2bn(&n, "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5"); // given 
  BIGNUM *e = BN_new();
  BN_hex2bn(&e, "010001"); // given

  // encrypting the given message
  BIGNUM *m = BN_new();
  BN_hex2bn(&m, "4120746f702073656372657421"); // hex representation of ASCII string
  BIGNUM *c = BN_new();
  BN_mod_exp(c, m, e, n, ctx);
  printBN("Encryption result:", c);
  
  // clear data from the memory
  BN_clear_free(n);
  BN_clear_free(e);
  BN_clear_free(m);
  BN_clear_free(c);
  return 0;
}
