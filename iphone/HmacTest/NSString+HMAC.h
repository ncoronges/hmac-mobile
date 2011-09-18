//
//  NSString+HMAC.h
//  HmacTest
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Hexit)

- (NSString *)hexString;

@end

@interface NSString (HMAC)

- (NSString *)hexString;
- (NSString *)hmacWithKey:(NSString *)key;

@end