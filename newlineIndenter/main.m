//
//  main.m
//  newlineIndenter
//
//  Created by Matthew Ellis on 01/02/2016.
//  Copyright © 2016 matthew ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "newlineIndenter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        if (arguments.count == 2) {
            NSError *error = nil;
            NSString *fileText = [NSString stringWithContentsOfFile:arguments[1] encoding:NSUTF8StringEncoding error:&error];
            if (fileText.length && !error) {
                NSString *indentedFileText = [newlineIndenter indentFileText:fileText];
                printf("%s", [indentedFileText UTF8String]);
            } else {
                printf("Error: Cannot read file!\n");
            }
        } else {
            printf("Error: No file path. \nUsage: newlineIndenter your/file/path \n");
        }
    }
    return 0;
}
