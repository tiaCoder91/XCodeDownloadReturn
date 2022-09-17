//
//  TCDownloadReturn_1_1_1UITestsLaunchTests.m
//  TCDownloadReturn-1.1_1UITests
//
//  Created by Mattia Leggieri on 10/09/22.
//

#import <XCTest/XCTest.h>

@interface TCDownloadReturn_1_1_1UITestsLaunchTests : XCTestCase

@end

@implementation TCDownloadReturn_1_1_1UITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
