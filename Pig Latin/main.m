//
//  main.m
//  Pig Latin
//
//  Created by Josh Endter on 6/12/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (1) {
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSString *pigLatinString = [inputString stringByPigLatinization];
            
            NSLog(@"%@", pigLatinString);
        }
        
    }
    return 0;
}
