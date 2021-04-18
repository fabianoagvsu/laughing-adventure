#include "file_lib.h"
#include "sorter.h"
/************************************************************
 * main takes two files in through the command line.
 * main sorts the first file, without changing it,
 * then saves it to the location provided by the second file. 
 * Alex Fabiano 4/18/21
 ************************************************************/

int main(int argc, char** argv){

    // Read the original file.
    //src is a file that is opened so that we can get the size of it.	
    FILE* src;
    //sizeWords is the size of the file sent to src.
    int sizeWords;

    src = fopen(argv[1], "r");

    //implemented by file_lib.h, load_file(char* path, char** contents)
    //Takes character address and fills it with contents as a string.
    //load_file(argv[1], &argv[1]);

    sizeWords = fSize(src);
    char** wordsListIn = malloc(sizeWords * sizeof(char*));

    // Sort the file with the function you wrote.
	
    sort(&argv[1], sizeWords);

    // Write out the new file.

    //implented by file_lib.h, save_file(char* path, char* contents, size t size)
    //Writes a string to a file.
    save_file(argv[2], argv[2], sizeWords);
}

/*
 * Read the file from the command-line.
 * Usage:
 * ./a.out FILE_TO_READ FILE_TO_WRITE
 *
 * You can see if your file worked correctly by using the
 * command:
 *
 * diff ORIGINAL_FILE NEW_FILE
 *
 * If the command returns ANYTHING the files are different.
 */
