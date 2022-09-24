#import "TCButton.h"

@interface TCButton ()

@end

@implementation TCButton

- (instancetype)initWithRect:(NSRect)rect
{
    if (self = [super init]) {
        NSLog(@"class %@ in method %s", self.class, sel_getName(_cmd));
        [self setFrame: rect];
        self.bezelStyle = NSBezelStyleRounded;
    }
    return self;
}

- (void)setClickWithTarget:(id)target methodCall:(NSString *)sel {
    [self setTarget: target];
    [self setAction: NSSelectorFromString(sel)];
}

- (void)myMethodToCallOnClick:(NSButton *)button {
    NSLog(@"Ok method! %@", button.title);
}

@end
