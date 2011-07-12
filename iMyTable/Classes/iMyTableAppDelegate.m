//
//  iMyTableAppDelegate.m
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iMyTableAppDelegate.h"
#import "Person.h"


@implementation iMyTableAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize loginView;
@synthesize _person;

/*
- (void) welcomePlayed:(NSNotification*)notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"Login" object:nil];
	//[[UIApplication sharedApplication] setStatusBarHidden:NO];
	[window addSubview:loginView.view];
	[tabBarController.view setHidden:YES];
}
 */

/*
- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	[window addSubview:loginView.view];
}
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	//[[UIApplication sharedApplication] setStatusBarHidden:YES];
	//[self loadPerson];
	_person = [Person new];
	
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(welcomePlayed:) name: @"Login" object: nil];
	
	[window addSubview:tabBarController.view];
	[window addSubview:loginView.view];
	[tabBarController.view setHidden:YES];
	
    [window makeKeyAndVisible];
	
	return YES;
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/

- (void) showMainScreen:(NSInteger)index
{
	//[self.tabBarController setActiveButton:index];
	[self.tabBarController setSelectedIndex:index];
	[self.tabBarController.view setHidden:NO];
	[self.loginView.view setHidden:YES];
}
- (void) hideMainScreen:(id)sender
{
	//[self.homeviewController.view setHidden:NO];
	[self.tabBarController.view setHidden:YES];
}

+ (iMyTableAppDelegate *)sharedAppDelegate
{
	return (iMyTableAppDelegate*)[[UIApplication sharedApplication]delegate];
}
/*
- (void)loadPerson
{
	NSString * personID = [[NSUserDefaults standardUserDefaults] objectForKey:@"personID"];
	if(personID != nil)
	{
		_person = [Person new];
		_person.personID = personID;
		_person.email = [[NSUserDefaults standardUserDefaults] objectForKey:@"email"];
		_person.password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
		_person.phoneNUmber = [[NSUserDefaults standardUserDefaults] objectForKey:@"phoneNumber"];
		_person.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"title"];
		_person.firstName = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"];
		_person.middleName = [[NSUserDefaults standardUserDefaults] objectForKey:@"middleName"];
		_person.lastName = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"];
		_person.isPrivate = [[NSUserDefaults standardUserDefaults] objectForKey:@"isPrivate"];
		_person.address1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"address1"];
		_person.address2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"address2"];
		_person.address3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"address3"];
		_person.address4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"address4"];
		_person._lat = [[NSUserDefaults standardUserDefaults] objectForKey:@"_lat"];
		_person._long = [[NSUserDefaults standardUserDefaults] objectForKey:@"_long"];
		_person.countryCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"countryCode"];
		_person.secretQuestion = [[NSUserDefaults standardUserDefaults] objectForKey:@"secretQuestion"];
		_person.secretAnswer = [[NSUserDefaults standardUserDefaults] objectForKey:@"secretAnswer"];
		_person.isActive = [[NSUserDefaults standardUserDefaults] objectForKey:@"isActive"];
		_person.cuisinePreference = [[NSUserDefaults standardUserDefaults] objectForKey:@"cuisinePreference"];

	}
}
- (void)sevePerson:(NSString*)personID
{
	_person.personID = personID;
	[[NSUserDefaults standardUserDefaults] setValue:_person.personID forKey:@"personID"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.email forKey:@"email"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.password forKey:@"password"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.phoneNUmber forKey:@"phoneNUmber"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.title forKey:@"title"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.firstName forKey:@"firstName"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.middleName forKey:@"middleName"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.lastName forKey:@"lastName"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.isPrivate forKey:@"isPrivate"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.address1 forKey:@"address1"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.address2 forKey:@"address2"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.address3 forKey:@"address3"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.address4 forKey:@"address4"];
	[[NSUserDefaults standardUserDefaults] setValue:_person._lat forKey:@"_lat"];
	[[NSUserDefaults standardUserDefaults] setValue:_person._long forKey:@"_long"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.countryCode forKey:@"countryCode"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.accountOpened forKey:@"accountOpened"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.secretQuestion forKey:@"secretQuestion"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.secretAnswer forKey:@"secretAnswer"];
	[[NSUserDefaults standardUserDefaults] setValue:_person.isActive forKey:@"isActive"];
    [[NSUserDefaults standardUserDefaults] setValue:_person.cuisinePreference forKey:@"cuisinePreference"];
}
*/
- (void)dealloc {
	[_person release];
	[loginView release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

