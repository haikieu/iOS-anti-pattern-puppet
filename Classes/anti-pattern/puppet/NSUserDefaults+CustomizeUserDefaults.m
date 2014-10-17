//
//  NSUserDefaults+CustomizeUserDefaults.m
//  PuppetAntiPattern
//
//  Created by HK on 10/17/14.
//  Copyright (c) 2014 haikieu2907@gmail.com. All rights reserved.
//

#import "NSUserDefaults+CustomizeUserDefaults.h"
#import <objc/runtime.h>
#import <objc/message.h>

//A flag is required in load state
#define LOAD_CUSTOMIZE 1

@implementation NSUserDefaults(CustomizeUserDefaults)

@end

@interface CustomizeUserDefaults : NSUserDefaults

//This is private class in order to reduce visible class if neccessary

@end

@implementation CustomizeUserDefaults

//load method is invoked automatically at first startup
+(void)load
{
#if LOAD_CUSTOMIZE
    
    IMP method2 = method_getImplementation(class_getClassMethod([CustomizeUserDefaults class], @selector(standardUserDefaults)));
    
    method_setImplementation(class_getClassMethod([NSUserDefaults class], @selector(standardUserDefaults)), method2);
    
#endif
}

//the private child class's instance is return in real scenario
static id __obj;
+(NSUserDefaults *)standardUserDefaults
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __obj = [[CustomizeUserDefaults alloc] init];
    });
    return __obj;
}

//New business logic is upgrade here
-(void)setObject:(id)value forKey:(NSString *)defaultName
{
    //Ability to re-use the old implememtation if required.
    [super setObject:value forKey:defaultName];

}

-(id)objectForKey:(NSString *)defaultName
{
    id obj = [super objectForKey:defaultName];
    return obj;
}

@end
