////////////////////////////////////////////////////////////////////////////
//
//  UIDevice+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
////////////////////////////////////////////////////////////////////////////
#import "UIDevice+PXQuisite.h"

@implementation UIDevice (PXQuisite)

- (NSDictionary *)dictionaryRepresentation {

    return @ {
      
        @"name" : self.name ?: [NSNull null],
        @"model" : self.model ?: [NSNull null],
        @"localizationModel" : self.localizedModel ?: [NSNull null],
        @"systemName" : self.systemName ?: [NSNull null],
        @"systemVersion" : self.systemVersion ?: [NSNull null],
        @"identifierForVendor" : self.identifierForVendor.UUIDString ?: [NSNull null],
        @"isMultitaskingSupported": @(self.isMultitaskingSupported),
        @"isProximityMonitoringEnabled": @(self.isProximityMonitoringEnabled),
        @"isGeneratingDeviceOrientationNotifications": @(self.isGeneratingDeviceOrientationNotifications),
        @"isBatteryMonitoringEnabled": @(self.isBatteryMonitoringEnabled),
        @"userInterfaceIdiom" : @(self.userInterfaceIdiom),
        @"proximityState" : @(self.proximityState),
        @"userInterfaceIdiom" : @(self.userInterfaceIdiom),
    };
}

@end
