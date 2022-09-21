#import "TCTextField.h"

@implementation TCTextField

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"Initialize %@", self.class);
    }
    return self;
}

- (BOOL)textShouldBeginEditing:(NSText *)textObject {
    return YES;
}

- (BOOL)textShouldEndEditing:(NSText *)textObject {
    return YES;
}

- (void)selectText:(id)sender {
    NSTextField *text = sender;
    NSLog(@"%@", text.stringValue);
}

@end
