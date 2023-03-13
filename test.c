#include <stdio.h>

void main(void) {
    printf("RAWMOD=%d\n", getNumRawDataModules(23));
}
    
    
int getNumRawDataModules(int ver) {
	int result = (16 * ver + 128) * ver + 64;
	if (ver >= 2) {
		int numAlign = ver / 7 + 2;
		result -= (25 * numAlign - 10) * numAlign - 55;
		if (ver >= 7)
			result -= 36;
	}
	return result;
}