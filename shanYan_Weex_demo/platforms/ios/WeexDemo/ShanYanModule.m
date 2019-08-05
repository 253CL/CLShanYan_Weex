//
//  ShanYanModule.m
//  WeexDemo
//
//  Created by wanglijun on 2019/4/8.
//  Copyright © 2019 taobao. All rights reserved.
//

#import "ShanYanModule.h"

#import <CL_ShanYanSDK/CL_ShanYanSDK.h>

@implementation ShanYanModule

@synthesize weexInstance;

//WX_EXPORT_METHOD(@selector(initShanYanSDKComplete:))
WX_EXPORT_METHOD(@selector(preGetPhonenumber))
WX_EXPORT_METHOD(@selector(quickAuthLoginWithConfigureComplete:))

- (void)initShanYanSDKComplete:(WXModuleKeepAliveCallback)complete{
    //初始化可以直接在启动时调用（AppDelegaete）
    
//    [CLShanYanSDKManager initWithAppId:cl_SDK_APPID AppKey:cl_SDK_APPKEY timeOut:5 complete:^(CLCompleteResult * _Nonnull completeResult) {
//        if (complete) {
//            NSMutableDictionary * result = [NSMutableDictionary new];
//
//            result[@"code"] = @(completeResult.code);
//            result[@"message"] = completeResult.message;
//            result[@"data"] = completeResult.data;
//            result[@"userInfo"] = completeResult.error.userInfo;
//            complete(result,NO);
//        }
//    }];
}


- (void)preGetPhonenumber{
    [CLShanYanSDKManager preGetPhonenumber:nil];
}

- (void)quickAuthLoginWithConfigureComplete:(WXModuleKeepAliveCallback)complete{
    
    CLUIConfigure * baseUIConfigure = [CLUIConfigure new];
    baseUIConfigure.viewController = weexInstance.viewController;
    
    [CLShanYanSDKManager quickAuthLoginWithConfigureCTCC:(CLCTCCUIConfigure *)baseUIConfigure CMCC:(CLCMCCUIConfigure *)baseUIConfigure CUCC:(CLCUCCUIConfigure *)baseUIConfigure timeOut:5 complete:^(CLCompleteResult * _Nonnull completeResult) {
        if (complete) {

            NSMutableDictionary * result = [NSMutableDictionary new];

            result[@"code"] = @(completeResult.code);
            result[@"message"] = completeResult.message;
            result[@"data"] = completeResult.data;
            result[@"error"] = completeResult.error.userInfo;

            complete(result,NO);
        }
    }];
    
}
@end
