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
#define OVERRIDE_BASE_CREATIONAL_BEHAVIOR 1

@implementation NSUserDefaults(CustomizeUserDefaults)

-(void)doExtendBusiness
{
    //Ability to extend base class's behavior
}

@end

@interface CustomizeUserDefaults : NSUserDefaults

//This is private class in order to reduce visible class if neccessary

@end

@implementation CustomizeUserDefaults

//load method is invoked automatically at first startup
+(void)load
{
#if OVERRIDE_BASE_CREATIONAL_BEHAVIOR
    
    [self overrideBaseCreationalBehavior];
    
#endif
}

+(void)overrideBaseCreationalBehavior
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        IMP overrideMethod = method_getImplementation(class_getClassMethod([CustomizeUserDefaults class], @selector(standardUserDefaults)));
        
        method_setImplementation(class_getClassMethod([NSUserDefaults class], @selector(standardUserDefaults)), overrideMethod);
    });
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

-(void)doExtendBusiness
{
    [super doExtendBusiness];
    //Child class inherits extend base class's behavior
}


@end
