#import "Window/TCWindowController.h"

int main(int argc, const char* argv[]) {
    
   NSApplication *app = [NSApplication sharedApplication];

   TCWindowController *window = [[TCWindowController alloc] init];
   [window mainWindow];
    
   [app run];
    
   return 0;
}
