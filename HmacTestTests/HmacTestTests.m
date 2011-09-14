//
//  HmacTestTests.m
//  HmacTestTests
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HmacTestTests.h"
#import "MessageHasher.h"



@implementation HmacTestTests

- (void)setUp
{
    [super setUp];
    jsonParser = [[SBJsonParser alloc] init];    
    NSLog(@"starting tests ... ");
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBasicMessageHash
{
    // http://en.wikipedia.org/wiki/HMAC
    //HMAC_MD5("key", "The quick brown fox jumps over the lazy dog") = 0x 80070713463e7749b90c2dc24911e275
    //HMAC_SHA1("key", "The quick brown fox jumps over the lazy dog") = 0x de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9
    //HMAC_SHA256("key", "The quick brown fox jumps over the lazy dog") = 0x f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8
    //HMAC_SHA512("key", "The quick brown fox jumps over the lazy dog") = 0x b42af09057bac1e2d41708e48a902e09b5ff7f12ab428a4fe86653c73dd248fb82f948a549f7b791a5b41915ee4d1ec3935357e4e2317250d0372afa2ebeeb3a
    NSString *msg = @"The quick brown fox jumps over the lazy dog";
    NSString *key = @"key";
    NSString *hash = [MessageHasher hashMessage:msg withKey:key];
    NSLog(@"Hash is: %@", hash);
    STAssertEqualObjects(@"f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8" , hash, @"hashes do not match");
}

- (void)testHashedMessageWithWebService 
{
    NSString *msg = @"The quick brown fox jumps over the lazy dog";
    NSString *key = @"key";
    NSString *hash = [MessageHasher hashMessage:msg withKey:key];
    
    NSString *post = [NSString stringWithFormat:@"message=%@&hash=%@", msg, hash];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:[NSURL URLWithString:@"http://followrs:turtle@184.106.200.61/hash_test/message.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSError* error;
    NSURLResponse* response; 
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString * checkResponse = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"Got response from server: %@", checkResponse);
    NSLog(@"Json parser: %@", jsonParser);
    id object = [jsonParser objectWithString:checkResponse];
    if (! object) {
        NSLog(@"An error occured: %@", jsonParser.error);
    }
    NSLog(@"this is the object: %@", object);
    NSString* success = [object objectForKey:@"success"];
    NSLog(@"Success: %@", success); 
    
}

- (void)dealloc
{
    [jsonParser release];
    [super dealloc];
}

@end
