//
//  LoginViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ChangePassViewController.h"
#import "ForgetPassViewController.h"
#import "Request.h"
#import "TouchXML.h"
#import "iMyTableAppDelegate.h"


@implementation LoginViewController


-(IBAction)checked:(id)sender
{
	tmp++;
	if(tmp%2==1)
	{
		imageView.hidden = NO;
		rememberMe = YES;
	}
	else 
	{
		imageView.hidden = YES;
		rememberMe = NO;
	}
	
	
}


-(IBAction)skipRegister:(id)sender
{
	iMyTableAppDelegate * delegate = [iMyTableAppDelegate sharedAppDelegate];
	[delegate showMainScreen:1];
}

-(void)pushViewMain
{
	iMyTableAppDelegate * delegate = [iMyTableAppDelegate sharedAppDelegate];
	[delegate showMainScreen:1];
}

-(void) xmlParseDone:(NSData*)data {
	
	CXMLDocument * rssParser = [[[CXMLDocument alloc] initWithData:data options:0 error:nil] autorelease];
	
	CXMLElement *resultElement  = [rssParser rootElement];
	NSLog(@"%@",[resultElement stringValue]);
	if([[resultElement stringValue] isEqualToString:@"0"])
	{
		ChangePassViewController * c = [[ChangePassViewController alloc]initWithNibName:@"ChangePassViewController" bundle:nil];
		c.email = email.text;
		c.personID = @"0";
		[self.navigationController pushViewController:c animated:YES];
		[c release];
	}
	else if([[resultElement stringValue] isEqualToString:@"-1"]) 
	{
		
	}
	else 
	{
		[self pushViewMain];
	}

}

-(IBAction)textFieldDoneEditing:(id)sender
{
	[email resignFirstResponder];
	[password resignFirstResponder];
}

- (void) contentLoaded:(NSNotification*) notification
{
	NSLog(@"content loaded");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
	[self xmlParseDone:[[Request sharedRequest]xmlData]];
}
- (void) contentFailed:(NSNotification*) notification
{
	NSLog(@"content failed");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
}


-(IBAction)forgetPassAction:(id)sender
{
	ForgetPassViewController * f = [[ForgetPassViewController alloc]initWithNibName:@"ForgetPassViewController" bundle:nil];
	[self.navigationController pushViewController:f animated:YES];
	[f release];
}

-(IBAction)loginAction:(id)sender
{
	[[Request sharedRequest] getLogin:email.text password:password.text];
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentLoaded:) name: @"ContentLoaded" object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentFailed:) name: @"ContentFailed" object: nil];
	//------remenber me---------------------
	if (rememberMe) {
        [[NSUserDefaults standardUserDefaults] setValue:email.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:password.text forKey:@"password"];
		[[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"remember"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
	else {
		[[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"password"];
		[[NSUserDefaults standardUserDefaults] setValue:@"false" forKey:@"remember"];
        [[NSUserDefaults standardUserDefaults] synchronize];
	}
}

-(IBAction)registerAction:(id)semder
{
	RegisterViewController * r = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
	[self.navigationController pushViewController:r animated:YES];
	[r release];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	imageView.hidden = YES;
	tmp = 0;
	
	if([ [[NSUserDefaults standardUserDefaults] objectForKey:@"remember"] isEqualToString:@"true"])
    {
		tmp = 1;
		rememberMe = YES;
		imageView.hidden = NO;
        email.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        password.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    }
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[imageView release];
	[email release];
	[password release];
    [super dealloc];
}


@end
