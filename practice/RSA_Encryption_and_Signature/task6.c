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
  BN_hex2bn(&n, "A75AC9D50C18210023D5970FEBAEDD5C686B6B8F5060137A81CB97EE8E8A61944B2679F604A72AF"
  "BA4DA56BBEEA0A4F07B8A7F551F4793610D6E71513A2524082F8CE1F789D692CFAFB3A73F30EDB5D"
  "F21AEFEF54417FDD863D92FD3815A6B5FD347B0ACF2AB3B24794F1FC72EEAB9153A7C184C69B3B52059"
  "095E29C363E62E465BAA9490490EB9F0F54AA1092F7C344DD0BC00C506557906CEA2D010F14843E8B95AB"
  "59555BD31D21B3D86BEA1EC0D12DB2C9924AD47C26F03E67A70B570CCCD272CA58C8EC2183C92C92E736F06"
  "10569340AAA3C552FBE5C505D669685C06B9EE5189E18A0E414D9B92900A89E9166BEFEF75BE7A46B8"
  "E3478A1D1C2EA74F"); // from step 2 
  BIGNUM *e = BN_new();
  BN_hex2bn(&e, "10001"); // from step 2

  // verifying the message
  int length = 1+strlen("87493F2E254B33D6AC67D7AD72773E159A0C9EE0CF2FCF068D6B0D53E4985F9A"); // from step 4
  char *H = malloc(sizeof(char)*length);
  strncpy(H, "87493F2E254B33D6AC67D7AD72773E159A0C9EE0CF2FCF068D6B0D53E4985F9A", length);
  BIGNUM *S = BN_new();
  BN_hex2bn(&S, "8f81c8f264506a04c1db0b6a3251afcd146ea3fe63df1a86816e0b00d8a3520355d27a0c81dc00"
  "54f8c478716ae9cc31fdd11362da3131b50e5cf0bef8440af965ff2f3f11859ff82d41f1fcf9fb623dd57d"
  "7d33b1504bd91e98654600e619b49966763d718c34975e1949a99a916262fa0b2d73bc14960c9c2970bd"
  "dad2acb81ac5c841f3bf4c13c86049355e906ef08c0f26b46ffcdd588d8f2c1bccc41faeaf306b5209e6e"
  "7710c3f3dec7a4963cd584f7683e25250e954da7e9cbf39a7767e4b1e5234650a0547fc03078e8819079fc2"
  "060f7c1a62841b176fd3fea687747f7ae5f11bce4267f799f3b63a8c0a29bdc193697cb82571298"
  "1a3ed8bfddc85"); // from step 3 
  BIGNUM *h = BN_new();
  BN_mod_exp(h, S, e, n, ctx);
  if (strcmp(BN_bn2hex(h)+strlen(BN_bn2hex(h))-64, H) == 0) {
    printf("Signature verified\n"); // ignore padding and only compare the last 64 bytes
  } else { 
    printf("Signature verification failed\n");
  }
  
  // clear data from the memory
  BN_clear_free(n);
  BN_clear_free(e);
  free(H);
  BN_clear_free(S);
  BN_clear_free(h);
  
  return 0;
}
