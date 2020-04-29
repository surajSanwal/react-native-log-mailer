
#import "RNLogMailer.h"
#import <React/RCTLog.h>
#import "LogFilesViewController.h"
@implementation RNLogMailer

//- (dispatch_queue_t)methodQueue
//{
//    return dispatch_get_main_queue();
//}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(writeToLogFile:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self writeToLogFile:input callback:callback];
    
}

@end
  
