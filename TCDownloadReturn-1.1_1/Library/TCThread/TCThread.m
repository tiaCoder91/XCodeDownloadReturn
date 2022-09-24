//
//  TCThread.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 21/09/22.
//

#import "TCThread.h"

@interface TCThread ()
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, strong) TCTask *task;
@end

@implementation TCThread

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - Public

- (void)start {
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(runloop) object:nil];
    if (![self.thread isExecuting]) {
        [self.thread start];
    }
}

- (void)runloop {
    _task = [[TCTask alloc] init];
    [_task saluto];
}

- (void)stop {
    NSLog(@"Thread name : %@", [self.thread name]);
    if ([self.thread isFinished]) {
        NSLog(@"Thread finished!");
        [self.thread cancel];
    } else if ([self.thread isCancelled]) {
        NSLog(@"Thread cancelled!");
    }
}

@end
