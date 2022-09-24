//
//  TCThread.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 21/09/22.
//

#import "../TCTask/TCTask.h"

@interface TCThread : NSThread
- (void)start;
- (void)stop;
@end

