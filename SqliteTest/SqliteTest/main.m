//
//  main.m
//  SqliteTest
//
//  Created by yibinpan on 8/6/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

//#import <Foundation/Foundation.h>
#include <stdio.h>
#include <sqlite3.h>

int callback(void *NotUsed, int argc, char **argv,
             char **azColName);
int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    
    printf("test\n");
    
    sqlite3 *db = NULL;
    //char *zErrMsg = 0;
    char *err_msg[100];
    
    int rc;
    
    rc = sqlite3_open("zieckey.db", &db);
    if (rc) {
        
        printf("can't open db:%s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        exit(0);
    }
    else
    {
        printf("You have opened a sqlite3 database named zieckey.db successfully!\nCongratulations! Have fun ! ^-^ \n");
    }
    
//    char *sql = "DROP TABLE IF EXISTS Cars;"
//    "CREATE TABLE Cars(Id INT, Name TEXT, Price INT);"
//    "INSERT INTO Cars VALUES(1, 'Audi', 52642);"
//    "INSERT INTO Cars VALUES(2, 'Mercedes', 57127);"
//    "INSERT INTO Cars VALUES(3, 'Skoda', 9000);"
//    "INSERT INTO Cars VALUES(4, 'Volvo', 29000);"
//    "INSERT INTO Cars VALUES(5, 'Bentley', 350000);"
//    "INSERT INTO Cars VALUES(6, 'Citroen', 21000);"
//    "INSERT INTO Cars VALUES(7, 'Hummer', 41400);"
//    "INSERT INTO Cars VALUES(8, 'Volkswagen', 21600);";
//    
//    rc = sqlite3_exec(db, sql, 0, 0, err_msg);
//    
//    sqlite3_close(db);
    
    //read data
    char *sql = "SELECT * FROM Cars";
    
    rc = sqlite3_exec(db, sql, callback, 0, err_msg);
    
    return 0;
}

int callback(void *NotUsed, int argc, char **argv,
             char **azColName) {
    
    NotUsed = 0;
    
    int i;
    for ( i = 0; i < argc; i++) {
        
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    
    printf("i:%d\n\n",i);
    
    return 0;
}
