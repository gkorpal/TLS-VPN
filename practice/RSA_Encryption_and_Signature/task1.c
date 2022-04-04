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

  // initialize p, q, e
  BIGNUM *p = BN_new();
  BN_hex2bn(&p, "F7E75FDC469067FFDC4E847C51F452DF"); // given
  BIGNUM *q = BN_new();
  BN_hex2bn(&q, "E85CED54AF57E53E092113E62F436F4F"); // given 
  BIGNUM *e = BN_new();
  BN_hex2bn(&e, "0D88C3"); // given

  // compute phi(pq)
  BIGNUM *p_minus_one = BN_new();
  BN_sub(p_minus_one, p, BN_value_one()); // p-1
  BIGNUM *q_minus_one = BN_new();
  BN_sub(q_minus_one, q, BN_value_one()); // q-1
  BIGNUM  *phi = BN_new();
  BN_mul(phi, p_minus_one, q_minus_one, ctx); // phi(pq)

  // check whether e and phi(pq) are relatively prime
  BIGNUM *res = BN_new();
  BN_gcd(res, phi, e, ctx);
  if (!BN_is_one(res)) {
    printf("Can't generate private key. Try another prime number pair\n");
    exit(0);
  }
  
  // compute the private key
  BIGNUM *d = BN_new();
  BN_mod_inverse(d, e, phi, ctx);
  printBN("Private key:", d);
  
  // clear data from the memory
  BN_clear_free(p); BN_clear_free(q);
  BN_clear_free(e); BN_clear_free(d);
  BN_clear_free(p_minus_one); BN_clear_free(q_minus_one);
  BN_clear_free(phi); BN_clear_free(res);

  return 0;
}
