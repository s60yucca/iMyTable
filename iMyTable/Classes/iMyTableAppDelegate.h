//
//  iMyTableAppDelegate.h
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Person;
@interface iMyTableAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UINavigationController * loginView;
	Person * _person;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController * loginView;
@property (nonatomic, retain) Person * _person;

- (void) showMainScreen:(NSInteger)index;
- (void) hideMainScreen:(id)sender;
+ (iMyTableAppDelegate *)sharedAppDelegate;
//- (void)loadPerson;
//- (void)sevePerson:(NSString*)personID;

@end
