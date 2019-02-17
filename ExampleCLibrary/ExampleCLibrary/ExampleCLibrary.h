//
//  ExampleCLibrary.h
//  ExampleCLibrary
//
//  Created by ceciliah on 2/5/31 H.
//  Copyright © 31 Heisei Humlan. All rights reserved.
//

#ifndef __ExampleCLibrary

#define __ExampleCLibrary


//return_type function_name( parameter list ) {
//    body of the function
//}

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

//Macro
#define max(x, y)  (x<y ? y:x)

#define _CAT(A,B) A ## B
#define MAXIMP(T) T _CAT(max_, T) (T x, T y) { return max(x, y); }

MAXIMP(char);
MAXIMP(int);
MAXIMP(long);
MAXIMP(float);
MAXIMP(double);

// C wrapper for macro, there is also no generics in C
int maxInt(int x, int y) {
    return max(x, y);
}

float maxFloat(float x, float y) {
    return max(x, y);
}

double maxDouble(double x, double y) {
    return max(x, y);
}

extern int globalNumber;

//Function
char * randomString(int size);

struct Nationality {
    int identifier;
    //char country[] and char* country is the same thing. But if I use char* country, it will suggest initializer with country in swift
    char* country; // char * country  char *country[] = char country[][] = char **country
};

// I am sending a pointer, so it can be const, because I promise not to change it
void print_nationlity_country(struct Nationality * const nationality) {
    printf("nationality country is %s \n", nationality->country);
}

extern const char *DayInWeek[7];



// unicode compiles on mac's compiler, but not be able to do it in linux
enum 曜日 {
    月曜日,
    火曜日,
    水曜日,
    木曜日,
    金曜日,
    土曜日,
    日曜日,
};

//Helper test function - for swift
enum 曜日 currentDayOfWeek();


//Function pointer
int functionPointer(int startValue, int (*getNextValue)(int val));

#endif


