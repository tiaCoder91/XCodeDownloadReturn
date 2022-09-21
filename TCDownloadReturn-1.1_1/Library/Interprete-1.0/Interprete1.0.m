//
//  OrdineBar.m
//  OrdineBar
//
//  Created by Mattia Leggieri on 29/07/21.
//

#import "Interprete1.0.h"
#define MAX_NAME_SZ 500

@implementation Interprete
{
    NSData *dataBase;
    NSMutableArray *arrLine;
}

#pragma mark - Init
- (id)init
{
    if (self = [super init])
    {
        NSLog(@"Initializing class %@", self.class);
    }
    return self;
}

#pragma mark - Scrivi Testo  // METODO OK!!!
- (NSString *)scriviTesto
{
    NSString *text = @"";
    char *c_text = malloc(MAX_NAME_SZ);
    
    fgets(c_text, MAX_NAME_SZ, stdin);
    
    text = [NSString stringWithUTF8String:c_text];
    return text;
}

#pragma mark - Converte i dati in esadecimale   // METODO OK!!!
/// Converte i dati in esadecimale stringa e come input
- (NSString *)convertData:(id)sds
{
    if ([sds isKindOfClass:[NSString class]])
    {
       dataBase = [sds dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([sds isKindOfClass:[NSData class]])
    {
        dataBase = sds;
    }
    else
    {
        return @"no data o string";
    }
    
    const unsigned char *dataBuffer = (const unsigned char *)[dataBase bytes];

    NSUInteger dataLength = [dataBase length];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];

    for (int i = 0; i < dataLength; i++)
    {
        [hexString appendFormat:@"%02x", (unsigned int)dataBuffer[i]];
    }
    //NSLog(@"%@", hexString);
    return hexString;
}

#pragma mark - scomponiStringa:inizio:   // METODO OK!!!
/// Ritorna una lettera alla volta inserito in un ciclo while
- (NSString *)scomponiStringa:(NSString *)ss inizio:(int)i
{
    NSString *componi = [ss substringWithRange:NSMakeRange(i, 1)];
    return componi;
}

#pragma mark - ConvertBit      // METODO OK!!!
/// Converte il bit esadecimale in carattere
- (NSString *)convertBit:(NSString *)cb  // cb è già il carattere convertito in hex
{
    NSDictionary *bit = @{
        @"bit" : @[@" |!\"$%&/()=?^QWERTYUIOP*ASDFGHJKL<>ZXCVBNM';#:_\\1234567890+qwertyuiopasdfghjklzxcvbnm,.-{}@[]"],  // aggiungere caratteri solo prima dell'ultimo carattere
        @"bitSpecial" : @[@"Ç—„Ωæ¨°∫†∑˜ª∞∆£øåˆº•…‚ÀÈÌÒÆÙŒØ∏ˇ˛˝¸˚˙˘–«¬ƒß€`∂®¶πÅ‡µ©™√Áœèàòù"],  // aggiungere caratteri solo prima dell'ultimo carattere
    };
    
    NSArray *key = [bit allKeys];
    NSString *bitInChar = @"";

    
    for (int lKey = 0; lKey < key.count; lKey++)  // Conteggio chiavi del dizionario e passaggio delle stesse
    {
        if ([cb isEqualToString:@"0a"]) {
            //NSLog(@"Eccolo !!!!!!!");
            return @"0a";
        }
        
        for (NSString *sbit in [bit objectForKey:key[lKey]])  // prende le stringhe nelle rispettive chiavi
        {
            //NSLog(@"sbit %@", sbit);
            int c = 0;
            if ([key[lKey] isEqualToString:@"bit"])   // Se la chiave è uguale a "bit" passa nel metodo
            {
                NSString *cBit = @"";
                while ([cBit isNotEqualTo:@"]"])    // Finche cBit non è uguale a "]" andrà avanti un carattere alla volta
                {
                    cBit = [self scomponiStringa:sbit inizio:c];
                    NSString *hBit = [self convertData:cBit];
                    //NSLog(@"1.  cb = %@ hBit = %@ %@", cb, hBit, cBit);
                    if ([cb isEqualToString:hBit])
                    {
                        //NSLog(@"et voila!!!!!!");
                        bitInChar = [bitInChar stringByAppendingString:cBit];
                    }
                    c++;
                }
                c = 0;
            }
                
            if ([key[lKey] isEqualToString:@"bitSpecial"])
            {
                NSString *cBit = @"";                                    // valore in char del singolo bit
                while ([cBit isNotEqualTo:@"ù"])
                {
                    cBit = [self scomponiStringa:sbit inizio:c];         // sbit è la stringa della chiave
                    NSString *hBit = [self convertData:cBit];
                    //NSLog(@"2.  cb = %@ hBit %@ = %@", cb, hBit, cBit);
                    if ([cb isEqualToString:hBit])
                    {
                        //NSLog(@"et voila!!!!!!");
                        bitInChar = [bitInChar stringByAppendingString:cBit];
                    }
                    c++;
                }
                c = 0;
            }
        }
    }
    
    return bitInChar;
}

// Per ora il metodo è ok ma potrebbe esserci bisogno di una modifica
#pragma mark - Nuovo metodo decodifica
- (NSArray *)decode:(id)decode
{
    /// STRINGA DI DATI IN ESADECIMALE
    NSString *decode_hex = @"";
    decode_hex = [self convertData:decode];
    
    //NSLog(@"decode_hex %@", decode_hex);
    
    int start = 0;
    int ripartenza = 2;
    int lunghezza = 5;
    int set = 2;
    
    NSString *first_hex = @"";
    NSString *save_hex = @"";
    NSString *result = @"";
    
    /// SALVATAGGIO IN ARRAY CON LINEE FORMATTATE
    arrLine = [[NSMutableArray alloc] init];
    
    while (start < [decode_hex lengthOfBytesUsingEncoding:NSUTF8StringEncoding])
    {
        
        if (start <= lunghezza)
        {
            first_hex = [decode_hex substringWithRange:NSMakeRange(start, 1)];
            save_hex = [save_hex stringByAppendingString:first_hex];
        }
        
        NSLog(@"save %@ start %i", save_hex, start);
        
        if ([[self convertBit:save_hex] isEqualToString:@"0a"]) {
            NSLog(@"result = %@  ***************", result);
            [arrLine addObject:result];
            result = @"";
        } else {
            result = [result stringByAppendingString:[self convertBit:save_hex]];
        }
        
        
        if (start == lunghezza)
        {
            start = ripartenza;           // settaggio per la ripartenza
            lunghezza += set;             // reset lunghezza
            ripartenza += set;            // reset ripartenza
            save_hex = @"";
        }
        else
        {
            start++;            // avanzamento di uno
        }
        
    }
    
    // QUI FARGLI FARE L'ULTIMO CONTROLLO PER L'ULTIMO CARATTERE
    int i = 0;
    while (i < save_hex.length) {
        NSString *hexByte = [save_hex substringFromIndex:i];
        NSLog(@"%@", hexByte);
        if ([hexByte isNotEqualTo:@"0a"]) {
            result = [result stringByAppendingString:[self convertBit:hexByte]];
        }
        i++;
    }
    
    [arrLine addObject:result];
    
    NSLog(@"result : %@", result);
    NSLog(@"arrLine : %@", arrLine);
    
    return arrLine;
}


@end
