//
//  Text.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "Text.h"

@implementation Text

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"Initialize %@", self.class);
        self = [[Text alloc] initWithFrame:NSMakeRect(10, 100, 200, 60)];
        self.maxSize = NSMakeSize(200, 60);
        [self setDelegate:self];
        //[self setEditable:NO];
        //[self setSelectable:NO];
        [self setString:@"Hello world."];
        
        _interprete = [[Interprete alloc] init];
    }
    return self;
}


- (void)getText {
    NSData *data = [[self string] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *hexString = [_interprete convertData:data];
    NSLog(@"hexString: %@", hexString);
    
    NSLog(@"bit converted: %@", [_interprete decode:[self string] key:@""]);
}

@end
