#import "Window/TCWindow.h"

int main(int argc, const char* argv[]) {
    
   NSApplication *app = [NSApplication sharedApplication];

   TCWindow *window = [[TCWindow alloc] init];
   [window mainWindow];
    
   [app run];
    
   return 0;
}
