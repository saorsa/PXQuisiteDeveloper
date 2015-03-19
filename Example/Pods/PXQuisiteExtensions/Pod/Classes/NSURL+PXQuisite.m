////////////////////////////////////////////////////////////////////////////
//
//  NSURL+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
////////////////////////////////////////////////////////////////////////////
#import "NSURL+PXQuisite.h"

@implementation NSURL (PXQuisite)

- (NSDictionary *)dictionaryRepresentation {
   
    return @{
             
             @"absoluteString" : self.absoluteString ? [NSNull null],
             @"relativeString" : self.relativeString ? [NSNull null],
             @"scheme" : self.scheme ? [NSNull null],
             @"resourceSpecifier" : self.resourceSpecifier ? [NSNull null],
             @"host" : self.host ? [NSNull null],
             @"user" : self.user ?: [NSNull null],
             @"password" : self.password ?: [NSNull null],
             @"path" : self.path ?: [NSNull null],
             @"fragment" : self.fragment ?: [NSNull null],
             @"parameterString" : self.parameterString ?: [NSNull null],
             @"query" : self.query ?: [NSNull null],
             @"relativePath" : self.relativePath ?: [NSNull null],
             @"isFileURL": @(self.isFileURL)
     };
}

@end
