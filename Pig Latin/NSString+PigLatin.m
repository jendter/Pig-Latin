//
//  NSString+PigLatin.m
//  Pig Latin
//
//  Created by Josh Endter on 6/12/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    
    NSMutableArray *inputStringArray = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@" "]];
    
    // Make every word pig latin
    for ( int counter = 0; counter < inputStringArray.count; counter++) {
        
        NSString *currentString = inputStringArray[counter];
        
        NSRange rangeToSearch = NSMakeRange(0, currentString.length);
        NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
        NSRange range = [currentString rangeOfCharacterFromSet:vowels options:0 range:rangeToSearch];
        
        //NSLog(@"Current value: %@", currentString);
        //NSLog(@"Number of letters before vowel: %lu", range.location);
        
        
        NSString *newString = currentString;
        
        if (range.location == NSNotFound) {
            // There were no vowels
            newString = [newString stringByAppendingString:@"ay"];
        } else {
            if (range.location > 0) {
                // The first letter of the word is not a vowel
                NSRange rangeOfFirstWordSection = NSMakeRange(0, range.location);
                NSRange rangeOfSecondWordSection = NSMakeRange(range.location, currentString.length-range.location);
                
                NSString *firstWordPart = [currentString substringWithRange:rangeOfFirstWordSection];
                //NSLog(@"Current String to check: %@", currentString);
                NSString *secondWordPart = [currentString substringWithRange:rangeOfSecondWordSection];
                
                //NSLog(@"The first word part is: %@", firstWordPart);
                //NSLog(@"The second word part is: %@", secondWordPart);
                
                newString = [secondWordPart stringByAppendingString:firstWordPart];
                
                newString = [newString stringByAppendingString:@"ay"];
                
            } else if (range.location == 0) {
                // The first letter is a vowel
                newString = [newString stringByAppendingString:@"yay"];
            }
        }
        
        
        inputStringArray[counter] = newString;

    }
    
    
    NSString *finalString = [NSString new];
    
    for (NSString *currentString in inputStringArray) {
        
        finalString = [finalString stringByAppendingString:[NSString stringWithFormat:@"%@ ", currentString]];
    }
    
    
    return finalString;
}

@end
