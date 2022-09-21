#import "TCButton.h"

@implementation TCButton

- (instancetype)init
{
	if (self = [super init]) {
        NSLog(@"class %@ in method %s", self.class, sel_getName(_cmd));
		NSRect frame1 = NSMakeRect(0, 0, 90, 40);
		[self setFrame: frame1];
		self.bezelStyle = NSBezelStyleRounded;
	}
	return self;
}

- (void)myMethodToCallOnClick:(NSButton *)nome {
	NSLog(@"Ok method! %@", nome.title);
}

- (instancetype)initWithRect:(NSRect)rect
{
	if (self = [super init]) {
        NSLog(@"class %@ in method %s", self.class, sel_getName(_cmd));
		NSRect frame1 = rect;
        [self setFrame: frame1];
		self.bezelStyle = NSBezelStyleRounded;
		
		[self setTarget:self];
        [self setAction:@selector(myMethodToCallOnClick:)];
	}
	return self;
}

@end
