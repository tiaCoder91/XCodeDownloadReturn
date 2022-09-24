//
//  TCWindowController.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 23/09/22.
//

#import "View/TCView.h"
#import "View/Button/TCButton.h"
#import "View/Text/TCTextField.h"
#import "View/Text/TCTextView.h"
#import "TCWindow.h"

@interface TCWindowController : NSObject <NSWindowDelegate>
- (instancetype)mainWindow;
@end

