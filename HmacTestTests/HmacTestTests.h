//
//  HmacTestTests.h
//  HmacTestTests
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "SBJson.h"

@interface HmacTestTests : SenTestCase
{
    SBJsonParser *jsonParser; 
}
- (void)testBasicMessageHash;
- (void)testHashedMessageWithWebService;
@end
