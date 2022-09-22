//
//  TCTask.m
//  TCDownloadReturn-1.1_1
//
//  Created by Mattia Leggieri on 21/09/22.
//

#import "TCTask.h"

@implementation TCTask

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}


- (void)saluto {
    
    //NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *path = @"/tmp/data_script.sh";//[mainBundle pathForResource:@"test" ofType:@"sh"];
    NSString *script = [NSString stringWithFormat:@"#!/bin/bash\necho \"ok script da objective-c data.\"\ncd tmp\n/usr/local/bin/yt-dlp -f m4a --add-metadata --embed-thumbnail --ffmpeg-location /usr/local/bin https://www.youtube.com/watch?v=fD2UExUhq-s\nmv *.m4a ~/Desktop\nopen -a Music ~/Desktop/*.m4a"];
    
    NSData *data_script = [script dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:@"/tmp/data_script.sh"]) {
        if ([manager removeItemAtPath:@"/tmp/data_script.sh" error:nil])
            NSLog(@"File rimosso!");
    }
    
    [manager createFileAtPath:[NSString stringWithFormat:@"/tmp/data_script.sh"] contents:data_script attributes:nil];
    
    NSTask *task = [[NSTask alloc] init];
    
    [task setLaunchPath: @"/bin/bash"];
    [task setArguments:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", path], nil]];

    NSLog(@"path: %@", path);

    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    [task setStandardError: pipe];

    NSFileHandle *file = [pipe fileHandleForReading];

    [task launch];
    //[task waitUntilExit];
    
    NSData *data = [file readDataToEndOfFile];
    
    NSString *output = [[NSString alloc]
              initWithData:data
              encoding:NSUTF8StringEncoding
    ];
    
    NSLog(@"output: %@", output);
}

@end
