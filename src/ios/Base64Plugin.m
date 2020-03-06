//
//  Base64Plugin.m
//  PhonegapLiferay
//
//  Created by Horelvis 15/04/2019.
//
#import "Base64Plugin.h"
#import "NSData+Base64.h"

@implementation Base64Plugin

- (void)encodeFile:(CDVInvokedUrlCommand*)command
{
   NSArray *params = command.arguments;

   NSString *path = params[0];

   CDVPluginResult* pluginResult = nil;

   NSData *fileData = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];

   NSString *encodeBase64 = [fileData base64EncodedStringWithSeparateLines:false];

   if (fileData != nil && encodeBase64) {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:encodeBase64];
   } else {
       pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"filePath was null"];
   }

   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}




@end
