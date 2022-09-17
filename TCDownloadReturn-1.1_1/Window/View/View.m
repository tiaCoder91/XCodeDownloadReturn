#import "View.h"

@implementation View

- (instancetype)init
{
	if (self = [super init]) {
		self = [[View alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
		[self setWantsLayer:YES];
		self.layer.backgroundColor = [[NSColor yellowColor] CGColor];
	}
	return self;
}

- (void)mouseDown:(NSEvent *)event {
    NSPoint point = event.locationInWindow;
    NSLog(@"X: %f - Y: %f", point.x, point.y);
    NSLog(@"window: %@", event.window);
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)event {
    //NSPoint point = event.locationInWindow;
    //NSLog(@"X: %f - Y: %f", point.x, point.y);
}
@end
