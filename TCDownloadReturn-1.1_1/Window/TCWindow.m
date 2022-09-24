#import "TCWindow.h"

@interface TCWindow()

@end

@implementation TCWindow 

- (instancetype)initWithFrame:(NSRect)frame {
    if (self = [super init]) {
        self = [[TCWindow alloc]
                initWithContentRect:frame
                styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
                backing:NSBackingStoreBuffered
                defer:NO
        ];
    }
    return self;
}

@end
