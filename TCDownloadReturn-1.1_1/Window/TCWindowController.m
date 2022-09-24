//
//  TCWindowController.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 23/09/22.
//

#import "TCWindowController.h"

@interface TCWindowController ()
@property (nonatomic, readwrite, strong) TCView *view;
@property (nonatomic, readwrite, strong) TCButton *cancel, *ok;
@property (nonatomic, readwrite, strong) TCTextField *textField;
@property (nonatomic, readwrite, strong) TCTextView *label, *labelR;
@end

@implementation TCWindowController {
    int add;
    float uno;
    float due;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)mainWindow {
// TODO: Get screen size
        NSScreen *screen = [NSScreen mainScreen];
        NSDictionary *description = [screen deviceDescription];
        NSSize displayPixelSize = [[description objectForKey:NSDeviceSize] sizeValue];
        //CGSize displayPhysicalSize = CGDisplayScreenSize([[description objectForKey:@"NSScreenNumber"] unsignedIntValue]);
        
// TODO: Initialize NSWindow
        NSRect frame = NSMakeRect(displayPixelSize.width/2-500/2, displayPixelSize.height/2-300/2, 500, 300);
        TCWindow *window  = [[TCWindow alloc] initWithFrame:frame];
        
        //[window setBackgroundColor:[NSColor blueColor]];
        [window setTitle:@"TCDownloadReturn"];
        [window setMinSize:NSMakeSize(500, 330)];
        [window setDelegate: self];

// TODO: Initialize and Set NSView
        _view = [[TCView alloc] init];
        [_view setFrameSize: NSMakeSize(window.frame.size.width, window.frame.size.height)];
    
// TODO: Initialize and Set NSTextView
        _label = [[TCTextView alloc] initWithFrame:NSMakeRect(
                 10,
                 window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
                 window.frame.size.width/100*45,
                 window.frame.size.height/100*12
        )];
        [_label setMaxSize:NSMakeSize(screen.frame.size.width, 200)];
        [_label setString:@"Hi Mattia!"];
    
        //[_label setBoundsSize:NSMakeSize(_label.frame.size.width, _label.frame.size.height)];
        
        _labelR = [[TCTextView alloc] initWithFrame:NSMakeRect(
                 window.frame.size.width-window.frame.size.width/100*45-10,
                 window.frame.size.height-30-10-40, //window.frame.size.height-window.frame.size.height/100*22,
                 window.frame.size.width/100*45,
                 window.frame.size.height/100*12
        )];
        [_labelR setMaxSize:NSMakeSize(screen.frame.size.width, 200)];
        [_labelR setString:@"Ciao Mattia!"];
    
        [_label setToLabel: _labelR];            // settaggio destinazione
        [_label setFromWindow: window];          // window per correggere il ridimensionamento degli oggetti
    
// TODO: Initialize and Set NSButton
        _cancel = [[TCButton alloc] initWithRect: NSMakeRect(10, 10, 90, 40)];
        _cancel.title = @"Cancel";
        [_cancel setClickWithTarget:_cancel methodCall:@"myMethodToCallOnClick:"];
        
        _ok = [[TCButton alloc] initWithRect: NSMakeRect(window.frame.size.width-90-10, 10, 90, 40)];
        _ok.title = @"Ok";
        //_button.keyEquivalent = @"\r";
    
        [_ok setTarget: _label];                 // settaggio oggetto da prelevare dati
        [_ok setAction:@selector(logInField)];   // metodo per la modifica di dati
    
     // QUESTO È IL THREAD CON LA SHELL *************************
        //[_ok setTarget:_label];
        //[_ok setAction:@selector(getText)];

// TODO: Add View to NSView and NSWindow
        
        [_view addSubview:_label];
        [_view addSubview:_labelR];
        //[_view addSubview: _textField];
        [_view addSubview: _ok];
        [_view addSubview:_cancel];
        
        [window.contentView addSubview: _view];
        [window makeKeyAndOrderFront:NSApp];
    return self;
}


# pragma mark - Questo entra prima di windowDidResize:

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    NSLog(@" 1 - %f", sender.frame.size.width);
    uno = sender.frame.size.width;
    return frameSize;
}


#pragma mark - Metodo dove ci sono le modifiche della vista

- (void)windowDidResize:(NSNotification *)notification {

    TCWindow *window = notification.object;
    NSLog(@" 2 - %f", window.frame.size.width);
    
// TODO: Questo serve ad aggiungereno sottrarre invece di usare le percentuali
    
    due = window.frame.size.width;
    if (due > uno) {
        NSLog(@" %f > %f", due, uno);
    } else {
        NSLog(@" %f < %f", due, uno);
    }
    
// TODO: Modifiche positione e taglia degli oggetti
    
    NSSize viewSize = NSMakeSize(window.frame.size.width+30, window.frame.size.height);
    [_view setFrameSize: viewSize];
    
    NSPoint buttonOrigin = NSMakePoint(window.frame.size.width-90-10, 10);
    [_ok setFrameOrigin: buttonOrigin];
    
    [_label setFrameSize: NSMakeSize(window.frame.size.width/100*45, _label.frame.size.height)];
    [_label setFrameOrigin: NSMakePoint(10, window.frame.size.height-30-10-_label.frame.size.height)];
    
    [_labelR setFrameSize: NSMakeSize(window.frame.size.width/100*45, _labelR.frame.size.height)];
    [_labelR setFrameOrigin: NSMakePoint(window.frame.size.width-_labelR.frame.size.width-10, window.frame.size.height-30-10-_labelR.frame.size.height)];
}


- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Application closed!");
    exit(0);
}

@end
