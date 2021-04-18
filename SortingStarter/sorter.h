#ifndef			__H__SORTER__
#define			__H__SORTER__

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/*
 * sort takes a file, and the amount of lines in a file,
 * then goes over that file size times until it is sorted.
 * Uses selection sort method.
 */

void sort(char** contents, int size);

/*
 * fSize takes a pointer to a file and finds the size.
 * Used in main to find the size of the file sent to sort.
 */

int fSize(FILE *fp);

#endif
