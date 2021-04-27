#include "test.h"
#include "math.h"
#include "student.h"
#include <stdlib.h>

/**
 * Example for demonstration at start of test.
 */

int example(){
	return 42;
}

/**
 * Warmup (but counts for credit!)
 * Square the value x points to.
 */
void easyPeasy(int* x){
	int y = *x**x;
	*x = y;
}

/**
 * Set a's first name to "Jigglypuff".
 * Set the last name to "Ketchum".
 * Set the g number to 10, the gpa to 1.16.
 */
void one(Student* a){
	a->first_name = "Jigglypuff";
	a->last_name = "Ketchum";
	a->g_number = 10;
	a->gpa = 1.16;
}

/**
 * Copy the information from Student b to Student a.
 * (pointer parameters).
 */
void two(Student* a, Student* b){
	a->first_name=b->first_name;
	a->last_name=b->last_name;
	a->g_number=b->g_number;
	a->gpa=b->gpa;
	a->roommate=b->roommate;
}

/**
 * Copy the information from Student a to Student b.
 * (mixed variable type parameters).
 */

void three(Student a, Student* b){
	int* gn = &a.g_number;
	float* gpa = &a.gpa;
	b->first_name = &*a.first_name;
	b->last_name = &*a.last_name;
	b->g_number = *gn;
	b->gpa = *gpa;
	b->roommate = &*a.roommate;
}

/**
 * Create and return a Student.  Give it the values
 * "T. Yoshisaur" (first_name)
 * "Munchakoopas" (last_name)
 * 1990		  (g_number)
 * 3.1		  (gpa)
 * Mario	  (roommate [defined above])
 * Remember: C is pass by copy ONLY.
 */
Student four(){
	Student a;
	a.first_name = "T. Yoshisaur";
	a.last_name = "Munchakoopas";
	a.gpa = 3.1;
	a.g_number = 1990;
	a.roommate = &Mario;
	return a;
}

/**
 * Create and return a Student*.  Give it the value
 * "Luigi" (first_name)
 * "Mario" (last_name)
 * 2       ( :( )
 * 3.54    (gpa [we know he's the smart one])
 * Remember: C is pass by copy ONLY.
 */
Student* five(){
	Student* a = new Student;
	a->first_name = "Luigi";
	a->last_name = "Mario";
	a->gpa = 3.54;
	a->g_number = 2;
	return a;
}

/**
 * Create a hunk of memory we can use as an array of 10
 * Students.  Set the 4th element (meaning use array
 * index 3) to
 *
 * "Luigi" (first_name)
 * "Mario" (last_name)
 * 2       ( :( )
 * 3.54    (gpa [we know he's the smart one])
 */
Student* six(){
	//Student* studArr = malloc(9*sizeof*Student*);
	//Student* studArr = new Student[9];
	//Student* studArr[9];
	Student* studArr;
	studArr = (Student*)malloc(9*sizeof(Student));
	studArr[4].first_name = "Luigi";
	studArr[4].last_name = "Mario";
	studArr[4].gpa = 3.54;
	studArr[4].g_number = 2;
	return &studArr[4];
}

/**
 * Seven will take a pointer to a pointer.  It should
 * create a hunk of memory that can be used as an array
 * of size 10, and will set the pointer correctly so
 * that the "array" is usable in main.
 * Set the 10th (index 9) element equal to
 *
 * "Luigi" (first_name)
 * "Mario" (last_name)
 * 2       ( :( )
 * 3.54    (gpa [we know he's the smart one])
 */
void seven(Student** students){
	
}

/**
 * Given a, b, and c calculate the first solution for
 * the quadratic equation (given below).
 *
 * -b + sqrt(b^2 - 4ac) / (2a)
 */
double quadratic(double a, double b, double c){
	double d = (b*b) - 4*a*c;
	if (d>=0) {
		double root1 = (-b+sqrt(d))/2*a;
		//double root2 = (-b-sqrt(d))/2*a;
		return root1;
	}
	else {
		double root2 = -b/2*a;
		return root2;
	}
}

/**
 * Given a "string" (a character array) and a length,
 * replace each lower case character with its uppercase
 * equivalent.
 *
 * Do not use any string functions provided by the library.
 * Merely check to see if each character is between the
 * range of values for a lowercase letter.  If it is,
 * replace it with the uppercase value equivalent.
 *
 * If you are writing more than five lines you are doing it wrong.
 */
#include <stdio.h>
void capitalize(char* str, size_t len){
	for (int i = 0; str[i]!='\0'; i++){
		if(str[i] >= 'a' && str[i] <= 'z'){
			str[i] = str[i] - 32;
		}
	}
}
