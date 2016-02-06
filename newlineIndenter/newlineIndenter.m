//
//  newlineIndenter.m
//  newlineIndenter
//
//  Created by Matthew Ellis on 01/02/2016.
//  Copyright © 2016 matthew ellis. All rights reserved.
//

#import "newlineIndenter.h"

@implementation newlineIndenter

/**
 *  Indent empty newlines of
 *
 *  @param fileText string containing a file of code
 *
 *  @return indented vershion of fileText
 */
+ (NSString *)indentFileText:(NSString *)fileText
{
    NSArray <NSString *>*fileLines = [fileText componentsSeparatedByString:@"\n"];
    NSMutableArray <NSString *>*indentedFileLines = [[NSMutableArray alloc] init];
    int currentIndent = 0;
    
    for (NSString *line in [[fileLines reverseObjectEnumerator] allObjects]) {
        if (line.length == 0) { // Empty [newline
            [indentedFileLines addObject:[self indentForLength:currentIndent]];
        } else {
            [indentedFileLines addObject:line];
            currentIndent = [self indentLength:line];
        }
    }
    
    return [[[indentedFileLines reverseObjectEnumerator] allObjects] componentsJoinedByString:@"\n"];
}

#pragma mark - Private

/**
 *  Get the indent length for a line of code by counting
 *  the number of space charictors at the start of the line.
 *
 *  @param lineText One line of file text
 *
 *  @return A count of the indent length
 */
+ (int)indentLength:(NSString *)lineText
{
    int indentLength = 0;
    for (int i = 0; i < lineText.length; i++) {
        int unichar = [lineText characterAtIndex:i];
        
        if (unichar == 32) { // Space character
            indentLength++;
        } else {
            break;
        }
    }
    return indentLength;
}

/**
 *  Creates a string with a indent of a specified length
 *
 *  @param length Length of the indent to create
 *
 *  @return string containg spaces to represent the length of the indent
 */
+ (NSString *)indentForLength:(int)length
{
    NSMutableString *indentString = [[NSMutableString alloc] init];
    for (int i = 0; i < length; i++) {
        [indentString appendString:@" "];
    }
    
    return indentString;
}

@end

