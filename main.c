#include <stdio.h>
#include <string.h>

extern int memcmp_(const void *block1, const void *block2, size_t size);
char src[]="Contrary to popular belief, Lorem Ipsum is not simply random text. \
            It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\
            Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more\
            obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in \
            classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.\
            33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This boo\
            k is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, , \
            comes from a line in section 1.10.32";
char dst[]="Contrary to popular belief, Lorem Ipsum is not simply random text. \
            It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\
            Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more\
            obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in \
            classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.\
            33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This boo\
            k is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, , \
            comes from a line in section 1.10.32";


int main() {

    int result = memcmp_(src, dst, sizeof(src));
    if (result == 0) {
        printf("Blocks are equal.\n");
    } else {
        printf("Blocks are different. Difference: %d\n", result);
    }

    return 0;
}
