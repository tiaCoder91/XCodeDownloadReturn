#import "Window.h"
#import "View/View.h"
#import "View/Button/Button.h"
#import "View/Text/TextField.h"
#import "View/Text/Text.h"

@interface Window()
@property (nonatomic, readwrite) View *view;
@property (nonatomic, readwrite) Button *cancel, *ok;
@property (nonatomic, readwrite) TextField *textField;
@end

@implementation Window {
    CGSize sizeText;
    CGPoint pointText;
    NSPoint textFieldPoint;
    NSSize textFieldSize;
    int add;
    float uno;
    float due;
}

- (instancetype)init
{
	//[NSBundle loadNibNamed:@"myMain" owner:app];
	
	if (self = [super init]) {
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
		[window setMinSize:NSMakeSize(500, 330)];
		[window setDelegate: self];

#pragma mark - Initialize and Set NSView
		_view = [[View alloc] init];
		[_view setFrameSize: NSMakeSize(window.frame.size.width, window.frame.size.height)];
        
#pragma mark - Initialize and Set NSText
        
        Text *label = [[Text alloc] init];
        
#pragma mark - Initialize and Set NSTextField
        
        _textField = [[TextField alloc] init];
        [_textField setFrame:NSMakeRect(
            10,
            window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
            window.frame.size.width/100*40,
            window.frame.size.height/100*12 //40
        )];
        
#pragma mark - Initialize and Set NSButton
		_cancel = [[Button alloc] initWithRect: NSMakeRect(10, 10, 90, 40)];
        _ok = [[Button alloc] initWithRect: NSMakeRect(window.frame.size.width-90-10, 10, 90, 40)];

        _cancel.title = @"Cancel";
        //_button.keyEquivalent = @"\r";
		
		_ok.title = @"Ok";
        [_ok setTarget:label];
        [_ok setAction:@selector(getText)];
		//button1.keyEquivalent = @"\r";

#pragma mark - Add View to NSView and NSWindow
        
        [_view addSubview: label];
        [_view addSubview: _textField];
        [_view addSubview: _ok];
        [_view addSubview:_cancel];
		
		[window.contentView addSubview: _view];
		[window makeKeyAndOrderFront:NSApp];
	}
	return self;
}


- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Application closed!");
    exit(0);
}

- (NSSize)windowWillResize:(NSWindow *)sender
                    toSize:(NSSize)frameSize {
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
    
    NSPoint buttonOrigin = NSMakePoint(window.frame.size.width-90-10, 0+10);
    [_ok setFrameOrigin: buttonOrigin];

    
    [self object: _textField          // da non - iniziale
          transform: textFieldSize    // da aggiornare - seguito
          window: window              // per le misure
    ];
}

// ==============================================================================
/// Trasforma la TextField
- (void)object:(TextField *)iniziale transform:(NSSize)seguito window:(NSWindow *)win {
    
    //add+=1;
    
    textFieldSize = NSMakeSize(win.frame.size.width/100*40, win.frame.size.height/100*12);
    textFieldPoint = NSMakePoint(win.frame.size.width/100*2, win.frame.size.height-30-10-textFieldSize.height);
    
    NSLog(@"%f", win.frame.size.width/100);
    
    [_textField setFrameSize: textFieldSize];
    [_textField setFrameOrigin: textFieldPoint];
    
    
}

@end
