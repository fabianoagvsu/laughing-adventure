#include "sorter.h"
#define MAX_LEN 1000 
//Max length of a string.

/********************************************************
 * sort takes a file, and the amount of lines in a file,
 * then goes over that file size times until it is sorted.
 * Uses a selection sort method.
 ********************************************************/

void sort(char** contents, int size) {
    //i keeps track of the first element
    int i;
    //j keeps track of the element i will be compared to.
    int j;
    //The "String", holds the array of chars at index i in the contents array.
    char minStr[MAX_LEN];
	
    for (i=0; i < size-1; ++i) {
        //set current element to minimum
	int min_idx = i;
	strcpy(minStr, contents[i]);
	for (j = i + 1; j < size; j++) {
	    //check if the element is actually min
	    if (strcmp(minStr, contents[j]) > 0) {
		strcpy(minStr, contents[j]);
		min_idx = j;
		}
	}
	//swap the smaller value's position and minimum.
	if (min_idx != i) {
	    char temp[MAX_LEN];
	    strcpy(temp, contents[i]);
	    strcpy(contents[i], contents[min_idx]);
	    strcpy(contents[min_idx], temp);
	}
    }
}

/*********************************************************
 * fSize takes a pointer to a file and finds the size.
 * Used in main to find the size of the file sent to sort.
 *********************************************************/

int fSize(FILE *fp) {
	int prev=ftell(fp);
	fseek(fp, 0L, SEEK_END);
	int sz=ftell(fp);
	fseek(fp,prev,SEEK_SET);
	return sz;
}
