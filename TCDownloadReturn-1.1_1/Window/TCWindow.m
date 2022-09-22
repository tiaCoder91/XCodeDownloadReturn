#import "TCWindow.h"

@interface TCWindow()
@property (nonatomic, readwrite) TCView *view;
@property (nonatomic, readwrite) TCButton *cancel, *ok;
@property (nonatomic, readwrite) TCTextField *textField;
@property (nonatomic, readwrite) TCText *label;
@property (nonatomic, readwrite) TCText *labelR;
@end

@implementation TCWindow {
    CGSize sizeText;
    CGPoint pointText;
    int add;
    float uno;
    float due;
}

- (instancetype)init
{
	
	if (self = [super init]) {

	}
	return self;
}


- (instancetype)mainWindow {
    
#pragma mark - Get screen size
        NSScreen *screen = [NSScreen mainScreen];
        NSDictionary *description = [screen deviceDescription];
        NSSize displayPixelSize = [[description objectForKey:NSDeviceSize] sizeValue];
        //CGSize displayPhysicalSize = CGDisplayScreenSize([[description objectForKey:@"NSScreenNumber"] unsignedIntValue]);
        
#pragma mark - Initialize NSWindow
        NSRect frame = NSMakeRect(displayPixelSize.width/2-500/2, displayPixelSize.height/2-300/2, 500, 300);
        NSWindow* window  = [[NSWindow alloc] initWithContentRect:frame
            styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
            backing:NSBackingStoreBuffered
            defer:NO];
        
        //[window setBackgroundColor:[NSColor blueColor]];
        [window setTitle:@"TCDownloadReturn"];
        [window setMinSize:NSMakeSize(500, 330)];
        [window setDelegate: self];

#pragma mark - Initialize and Set NSView
        _view = [[TCView alloc] init];
        [_view setFrameSize: NSMakeSize(window.frame.size.width, window.frame.size.height)];
        
        
#pragma mark - Initialize and Set NSTextField
        
        _textField = [[TCTextField alloc] init];
        [_textField setFrame:NSMakeRect(
            10,
            window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
            window.frame.size.width/100*40,
            window.frame.size.height/100*12 //40
        )];
    
#pragma mark - Initialize and Set NSTextView
        _label = [[TCText alloc] initWithFrame:NSMakeRect(
                 10,
                 window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
                 window.frame.size.width/100*45,
                 window.frame.size.height/100*12
        )];
        
        [_label setMaxSize:NSMakeSize(screen.frame.size.width, 200)];
        //[_label setBoundsSize:NSMakeSize(_label.frame.size.width, _label.frame.size.height)];
        
        _labelR = [[TCText alloc] initWithFrame:NSMakeRect(
                 window.frame.size.width-window.frame.size.width/100*45-10,
                 window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
                 window.frame.size.width/100*45,
                 window.frame.size.height/100*12
        )];
    
        [_labelR setMaxSize:NSMakeSize(screen.frame.size.width, 200)];
        
#pragma mark - Initialize and Set NSButton
        _cancel = [[TCButton alloc] initWithRect: NSMakeRect(10, 10, 90, 40)];
        _ok = [[TCButton alloc] initWithRect: NSMakeRect(window.frame.size.width-90-10, 10, 90, 40)];

        _cancel.title = @"Cancel";
        //_button.keyEquivalent = @"\r";
        
        _ok.title = @"Ok";
        [_ok setTarget:_label];
        [_ok setAction:@selector(getText)];
        //button1.keyEquivalent = @"\r";

#pragma mark - Add View to NSView and NSWindow
        
        [_view addSubview:_label];
        [_view addSubview:_labelR];
        //[_view addSubview: _textField];
        [_view addSubview: _ok];
        [_view addSubview:_cancel];
        
        [window.contentView addSubview: _view];
        [window makeKeyAndOrderFront:NSApp];
    
    return self;
}

- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Application closed!");
    exit(0);
}

// QUESTO È BUONO !!!!!!!!!!!!!!!
- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    NSLog(@" 1 - %f", sender.frame.size.width);
    uno = sender.frame.size.width;

    return frameSize;
}


- (void)windowDidResize:(NSNotification *)notification {

    NSWindow *window = notification.object;
    NSLog(@" 2 - %f", window.frame.size.width);
    due = window.frame.size.width;
    
    if (due > uno) {
        NSLog(@" %f > %f", due, uno);
    } else {
        NSLog(@" %f < %f", due, uno);
    }
    
    NSSize viewSize = NSMakeSize(window.frame.size.width+30, window.frame.size.height);
    [_view setFrameSize: viewSize];
    
    NSPoint buttonOrigin = NSMakePoint(window.frame.size.width-90-10, 10);
    [_ok setFrameOrigin: buttonOrigin];
    
    
    [_label setFrameSize:NSMakeSize(window.frame.size.width/100*45, _label.frame.size.height)];
    [_label setFrameOrigin: NSMakePoint(10, window.frame.size.height-30-10-_label.frame.size.height)];
    
    //[_label setConstrainedFrameSize:NSMakeSize(window.frame.size.width/100*45, _label.frame.size.height)];
    
    NSLog(@"label width : %f", _label.frame.size.width);
    
    [_labelR setFrameSize:NSMakeSize(window.frame.size.width/100*45, _labelR.frame.size.height)];
    [_labelR setFrameOrigin:NSMakePoint(window.frame.size.width-_labelR.frame.size.width-10, window.frame.size.height-30-10-_labelR.frame.size.height)];
    
    NSLog(@"labelR width : %f", _labelR.frame.size.width);

}

@end
