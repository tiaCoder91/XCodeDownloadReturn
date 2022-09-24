//
//  Text.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "TCTextView.h"

@interface TCTextView()
@property (nonatomic, strong) TCThread *thread;
@property (nonatomic, strong) TCTextView *text;
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
        
        _interprete = [[Interprete alloc] init];
        _thread = [[TCThread alloc] init];
    }
    return self;
}

- (TCTextView *)toLabel {
    _toLabel = [[TCTextView alloc] init];
    return _toLabel;
}

/// Da finire ?????????????????
- (NSArray *)getText {
    NSArray *lineText = [_interprete decode:[self string]];
    /*
    [_thread start];
      //NSLog(@"thread execution!");
    [_thread stop];
    */
    return lineText;
}

/// Solo per il button _ok perchè ogni button fa riferimento a una procedura
- (void)logInField {
    NSArray *lineText = [self getText];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:[self string]];
    [_toLabel.textStorage setAttributedString: attrStr];
    [_toLabel setTextColor: [NSColor blackColor]];
    _toLabel.font = [NSFont systemFontOfSize:12.0];
    
    [_toLabel setFrameSize: NSMakeSize(_fromWindow.frame.size.width/100*45, _toLabel.frame.size.height)];
    [_toLabel setFrameOrigin: NSMakePoint(_fromWindow.frame.size.width-_toLabel.frame.size.width-10, _fromWindow.frame.size.height-30-10-_toLabel.frame.size.height)];
    
    NSLog(@"toLabel : %@ with : %@", _toLabel, self.string);
    
    int i = 0;
    for (NSString *l in lineText) {
        i++;
        NSLog(@"LINEA %i - %@", i, l);
    }
}


- (void)textDidChange:(NSNotification *)notification {
    _text = [notification object];
    NSLog(@"notification: %@", _text.string);
}

@end
