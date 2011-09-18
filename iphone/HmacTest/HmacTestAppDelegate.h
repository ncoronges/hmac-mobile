//
//  HmacTestAppDelegate.h
//  HmacTest
//
//  Created by Nick Coronges on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HmacTestAppDelegate : NSObject <UIApplicationDelegate>
{
    IBOutlet UILabel *hashLabel;
    IBOutlet UITextField *hashMessage;
    IBOutlet UITextView *hashOutput;
    IBOutlet UIButton *hashButton;
    NSString *key;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
- (IBAction)hashMessage:(id)sender;

@end
