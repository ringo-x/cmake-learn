/*-----created time: 2019-09-18 19:46:20-----*/
#include <stdio.h>
#include <curl/curl.h>
#include "print_hello.h"
#include "my_math.h"

int main(void) {
    print_hello();
    printf("curl version: %s\n", curl_version());
    printf("5 + 11 = %d\n", sum(5 , 11));

    return 0;
}
