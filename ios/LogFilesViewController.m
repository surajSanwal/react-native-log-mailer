//
//  LogFilesViewController.m
//  eLock
//
//  Created by Tarun on 29/04/20.
//  Copyright © 2020 smartData. All rights reserved.
//

#import "LogFilesViewController.h"

@interface LogFilesViewController ()

@end

@implementation LogFilesViewController

+ (id)sharedInstance {
    
    static LogFilesViewController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
        // Do stuff
        
    });
    return sharedInstance;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)sendEmailButtonTapped {
    NSFileManager* fileManager;
    BOOL isDir;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * fileUrl = [documentsDirectory stringByAppendingString:@"Logs.txt"];
    if ([fileManager fileExistsAtPath:fileUrl isDirectory:&isDir] && isDir) {
        if ([MFMailComposeViewController canSendMail]) {
            
            MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
            mailVC.mailComposeDelegate = self;
            NSArray *toRecipients = [NSArray arrayWithObject:@"tarunk@smartdatainc.net"];
            [mailVC setToRecipients:toRecipients];
            [mailVC setSubject:@"Log File"];
            [mailVC setMessageBody:@"Data from Health kit " isHTML:NO];
            
            NSData *fileData = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileUrl]];
            [mailVC addAttachmentData:fileData mimeType:@"text/txt" fileName:@"logFile"];
            [self presentViewController:mailVC animated:YES completion:NULL];
            
        } else {
            NSLog(@"Cannot send email");
        }
    } else {
        NSLog(@"Directory not found");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"Email sent");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Email saved");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"Email cancelled");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Email failed");
            break;
        default:
            NSLog(@"Error occured during email creation");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) writeToLogFile:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback{
    /*
     NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
     BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
     */
    NSFileHandle *file;
    NSString * printStr = [NSString stringWithFormat: @"Custom Line %@ In line Number %d second part", val, lineNumber];
   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * fileUrl = [documentsDirectory stringByAppendingString:@"Logs.txt"];
    NSData * data = [printStr dataUsingEncoding:NSUTF8StringEncoding];
    
    
    file = [NSFileHandle fileHandleForUpdatingAtPath: fileUrl];
    //set writing path to file
    if (file == nil){//check file present or not in file
        NSLog(@"Failed to open file");
        // Fallback on earlier versions
        callback(@[RCTMakeError(@"Failed to open file", nil, nil)]);
    }
    [file seekToEndOfFile];
    //object pointer initialy points the offset as 6 position in file
    [file writeData: data];
    //writing data to new file
    [file closeFile];
    
    
    
    
    
    
    /*
     let printStr = self + " in line: \(lineNo)  "
     guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
     return
     }
     //    let str = Helper.stringFromDate(Date(), formatter: "yyyy-MM-dd")
     let fileUrl = dir.appendingPathComponent("Logs.txt")
     guard let data = printStr.data(using: .utf8) else {
     return
     }
     guard FileManager.default.fileExists(atPath: fileUrl.path) else {
     try? data.write(to: fileUrl, options: .atomic)
     return
     }
     if let fileHandle = try? FileHandle(forUpdating: fileUrl) {
     fileHandle.seekToEndOfFile()
     fileHandle.write(data)
     fileHandle.closeFile()
     }
     */
    
    
    
    //    NSError *error;
    //    BOOL ok = [printStr writeToURL:[NSURL URLWithString:fileUrl] atomically:YES
    //                        encoding:NSUnicodeStringEncoding error:&error];
    //    BOOL DataOK = [data writeToURL:[NSURL URLWithString:fileUrl] atomically:YES];
    //    if (!ok) {
    //        NSLog(@"String not written on file");
    //    } else {
    //        NSLog(@"String written successfully");
    //    }
    //
    //    if (!DataOK) {
    //        NSLog(@"Data not written on file");
    //    } else {
    //        NSLog(@"Data written successfully");
    //    }
    
    
}


@end



