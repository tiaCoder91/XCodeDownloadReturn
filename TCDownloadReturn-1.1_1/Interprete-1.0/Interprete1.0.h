//
//  OrdineBar.h
//  OrdineBar
//
//  Created by Mattia Leggieri on 29/07/21.
//

#import <Cocoa/Cocoa.h>

@interface Interprete : NSObject
- (NSString *)scriviTesto;
- (NSString *)decode:(id)decode key:(NSString *)key;
- (void)callSelector:(NSString *)cs;
@end

