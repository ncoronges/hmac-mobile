//
//  MessageHasher.h
//  HmacTest
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageHasher : NSObject
+ (NSString *)hashMessage:(NSString *)msg 
                  withKey:(NSString *)key;
@end
