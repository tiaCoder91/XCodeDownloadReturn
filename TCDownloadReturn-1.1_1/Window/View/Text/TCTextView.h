//
//  Text.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "../../../Library/Interprete-1.0/Interprete1.0.h"
#import "../../../Library/TCThread/TCThread.h"
#import "../../../Library/TCTask/TCTask.h"

@interface TCTextView : NSTextView <NSTextViewDelegate>
@property (nonatomic) Interprete *interprete;
- (void)getText;
@end
