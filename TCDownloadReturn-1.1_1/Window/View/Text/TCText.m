//
//  Text.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "TCText.h"

@interface TCText()
@property (nonatomic) TCTask *task;
@property (nonatomic) TCThread *thread;
@end

@implementation TCText

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        NSLog(@"Initialize %@", self.class);
        //self.maxSize = NSMakeSize(200, 60);
        //self.drawsBackground = false;
        self.textColor = [NSColor blueColor];
        self.font = [NSFont systemFontOfSize:20.0];
        [self setDelegate:self];
        //[self setEditable:NO];
        //[self setSelectable:NO];
        [self setString:@"Hello world."];
        
        _interprete = [[Interprete alloc] init];
        _task = [[TCTask alloc] init];
        _thread = [[TCThread alloc] init];
    }
    return self;
}

- (void)getText {
    
    NSArray *lineText = [_interprete decode:[self string]];
    int i = 0;
    for (NSString *l in lineText) {
        i++;
        NSLog(@"LINEA %i - %@", i, l);
    }
    
    [_thread start];
      //NSLog(@"thread execution!");
    [_thread stop];
}

- (void)textDidChange:(NSNotification *)notification {
    TCText *text = [notification object];
    NSLog(@"notification: %@", text.string);
}

@end
