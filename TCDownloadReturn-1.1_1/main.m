#import "Window/TCWindow.h"

int main(int argc, const char* argv[]) {
    
   NSApplication *app = [NSApplication sharedApplication];

   TCWindow *window;
   window = [[TCWindow alloc] init];
   
   [app run];
    
   return 0;
}
