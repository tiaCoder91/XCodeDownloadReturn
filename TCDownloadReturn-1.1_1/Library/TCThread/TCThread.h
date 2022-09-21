//
//  TCThread.h
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 21/09/22.
//

#import "TCTask.h"

@interface TCThread : NSThread
- (NSThread*)thread;
- (void)start;
- (void)stop;
@end

