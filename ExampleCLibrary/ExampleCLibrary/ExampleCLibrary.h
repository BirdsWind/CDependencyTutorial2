//
//  ExampleCLibrary.h
//  ExampleCLibrary
//
//  Created by ceciliah on 2/5/31 H.
//  Copyright © 31 Heisei Humlan. All rights reserved.
//

#ifndef __ExampleCLibrary

#define __ExampleCLibrary

#include <string.h>
#include <stdlib.h>

#pragma mark - Macro

#define getMax(x, y) (x>y ? x:y)

/**
 One way to expose macro to swift since there is no support for macros. Use method overload.
 */
int maxInt(int x, int y) {
    return getMax(x, y);
}

float maxFloat(float x, float y) {
    return getMax(x, y);
}

double maxDouble(double x, double y) {
    return getMax(x, y);
}

#pragma mark - Global variable

extern const int versionNumber;

#pragma mark - Global function

char * randomString(int size);

#pragma mark - Global struct

struct Nationality {
    int identifier;
    char * country;
};

void print_nationlity_country(struct Nationality * const nationality);

#pragma mark - Global enum

enum 曜日 {
    月曜日, 火曜日, 水曜日, 木曜日, 金曜日, 土曜日, 日曜日,
};

extern const char * DayInWeek[7];

enum 曜日 currentDayOfWeek();

#pragma mark - Functional pointer

int functionPointer(int startValue, int (*getNextValue)(int val));

#endif
