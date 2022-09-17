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
        
        [self setDelegate:self];
        
        [self setFrame: NSMakeRect(10, 100, 200, 20)];
        [self setEditable:NO];
        [self setSelectable:NO];
        [self setBackgroundColor: [NSColor yellowColor]];
        
        [self setString:@"Hello world!"];
    }
    return self;
}

- (void)defaultSet {
    [self setFrame: NSMakeRect(10, 100, 200, 20)];
    
    [self setEditable:NO];
    [self setSelectable:NO];
    [self setBackgroundColor: [NSColor yellowColor]];
    
    [self setString:@"Hello world!"];
}

@end
