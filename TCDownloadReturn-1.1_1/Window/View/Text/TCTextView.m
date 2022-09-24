//
//  Text.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "TCTextView.h"

@interface TCTextView()
@property (nonatomic) TCThread *thread;
@property (nonatomic) TCTextView *text;
@end

@implementation TCTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        NSLog(@"Initialize %@", self.class);
        //self.maxSize = NSMakeSize(200, 60);
        //self.drawsBackground = false;
        self.textColor = [NSColor blueColor];
        self.font = [NSFont systemFontOfSize:12.0];
        [self setDelegate:self];
        //[self setEditable:NO];
        //[self setSelectable:NO];
        [self setString:@"Hello world."];
        
        _interprete = [[Interprete alloc] init];
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
    _text = [notification object];
    NSLog(@"notification: %@", _text.string);
}

@end
