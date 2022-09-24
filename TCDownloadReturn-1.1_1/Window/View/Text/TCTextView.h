//
//  Text.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "../../TCWindow.h"
#import "../../../Library/Interprete-1.0/Interprete1.0.h"
#import "../../../Library/TCThread/TCThread.h"
#import "../../../Library/TCTask/TCTask.h"

@interface TCTextView : NSTextView <NSTextViewDelegate>
@property (nonatomic, strong) Interprete *interprete;
@property (nonatomic, strong) TCTextView *toLabel;
@property (nonatomic, strong) TCWindow *fromWindow;
- (NSArray *)getText;
- (void)logInField;
@end
