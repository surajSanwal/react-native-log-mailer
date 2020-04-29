//
//  LogFilesViewController.h
//  eLock
//
//  Created by Tarun on 29/04/20.
//  Copyright © 2020 smartData. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface LogFilesViewController : UIViewController <MFMailComposeViewControllerDelegate>


-(void) writeToLogFile::(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)sendEmailButtonTapped;


@end
