//
//  Text.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 17/09/22.
//

#import "../../../Interprete-1.0/Interprete1.0.h"
//#import <Cocoa/Cocoa.h>

@interface Text : NSTextView <NSTextViewDelegate>
@property (nonatomic) Interprete *interprete;
- (void)getText;
@end
