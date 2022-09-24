#import <Cocoa/Cocoa.h>

@interface TCButton : NSButton
- (instancetype)initWithRect:(NSRect)rect;
- (void)setClickWithTarget:(id)target methodCall:(NSString *)sel;
@end
