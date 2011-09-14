//
//  MessageHasher.m
//  HmacTest
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageHasher.h"
#import "NSString+HMAC.h"

@implementation MessageHasher

+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}
+ (NSString *)hashMessage:(NSString *)msg 
                  withKey:(NSString *)key
{
    // This is where your private key goes.  Don't just copy this one!!  That would not be secure.
    NSString *hmac = [msg hmacWithKey:key];
    return hmac;
}


@end
