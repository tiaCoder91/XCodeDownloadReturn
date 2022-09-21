//
//  OrdineBar.h
//  OrdineBar
//
//  Created by Mattia Leggieri on 29/07/21.
//

#import <Cocoa/Cocoa.h>

@interface Interprete : NSObject
- (NSString *)scriviTesto;
- (NSArray *)decode:(id)decode;
- (NSString *)convertData:(id)sds;
- (NSString *)convertBit:(NSString *)cb;
@end

