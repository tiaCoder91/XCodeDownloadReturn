#import "TCView.h"

@implementation TCView

- (instancetype)init
{
	if (self = [super init]) {
		self = [[TCView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
		[self setWantsLayer:YES];
		self.layer.backgroundColor = [[NSColor yellowColor] CGColor];
        [self setNeedsDisplay:YES];
	}
	return self;
}

- (void)mouseDown:(NSEvent *)event {
    NSPoint point = event.locationInWindow;
    NSLog(@"X: %f - Y: %f", point.x, point.y);
    NSLog(@"window: %@", event.window);
}

- (void)mouseDragged:(NSEvent *)event {
    //NSPoint point = event.locationInWindow;
    //NSLog(@"X: %f - Y: %f", point.x, point.y);
}

@end

/// ************************************************
/*{
    NSPoint points[4];
    NSUInteger pointCount;
}*/

/*
NSBezierPath *control1 = [NSBezierPath bezierPath];
[control1 moveToPoint: points[0]];
[control1 lineToPoint: points[1]];
[[NSColor redColor] setStroke];
[control1 setLineWidth: 2];
[control1 stroke];

NSBezierPath *control2 = [NSBezierPath bezierPath];
[control2 moveToPoint: points[2]];
[control2 lineToPoint: points[3]];
[[NSColor greenColor] setStroke];
[control2 setLineWidth: 2];
[control2 stroke];

NSBezierPath *curve = [NSBezierPath bezierPath];
[curve moveToPoint: points[0]];
[curve curveToPoint: points[3]
      controlPoint1: points[1]
      controlPoint2: points[2]];

[[NSColor blackColor] setStroke];
CGFloat pattern[] = {4, 2, 1, 2};
[curve setLineDash: pattern
             count: 4
             phase: 1];
[[NSColor grayColor] setFill];
[curve fill];
[curve stroke];

NSPoint click = [self convertPoint: [event locationInWindow] fromView: nil];
points[pointCount++ % 4] = click;
if (pointCount % 4 == 0)
{
    [self setNeedsDisplay: YES];
}
*/
