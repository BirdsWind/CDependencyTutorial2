//
//  ExampleCLibrary.m
//  ExampleCLibrary
//
//  Created by ceciliah on 2/5/31 H.
//  Copyright © 31 Heisei Humlan. All rights reserved.
//

#include "ExampleCLibrary.h"
#include <time.h>
#include <stdio.h>

int globalNumber = 6;

const char *DayInWeek[7] = {"月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"};

char * randomString(int size) {
    static char const string[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    int count = strlen(string);
    char * generated;
    srand((unsigned int) time(0));
    generated = (char *)malloc(sizeof(char) * size + 1);
    for (int i = 0; i < size; i++) {
        int randomstd = rand()%count;
        char created = string[randomstd];
        generated[i] = created;
    }
    generated[size] = 0;
    return generated;
}

 enum 曜日 currentDayOfWeek() {
     time_t t = time(NULL);
     struct tm *tmp = localtime(&t);
     printf("tm %i \n", tmp->tm_wday);
    return tmp->tm_wday;
}

int functionPointer(int startValue, int (*getNextValue)(int)) {
    printf("next value is %d \n", getNextValue(startValue));
    return  getNextValue(startValue);

}
