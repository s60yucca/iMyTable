//
//  RegisterViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"
#import "Request.h"
#import "iMyTableAppDelegate.h"


@implementation RegisterViewController

-(IBAction)skipRegister:(id)sender
{
	iMyTableAppDelegate * delegate = [iMyTableAppDelegate sharedAppDelegate];
	[delegate showMainScreen:1];
}

-(IBAction)textFieldDoneEditing:(id)sender
{
	[email resignFirstResponder];
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

- (void) contentLoaded:(NSNotification*) notification
{
	NSLog(@"content loaded");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
}
- (void) contentFailed:(NSNotification*) notification
{
	NSLog(@"content failed");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
}

-(IBAction)registerAction:(id)sender
{
	//[self.navigationController popViewControllerAnimated:YES];
	[[Request sharedRequest] getRegister:email.text password:@"123456"];
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentLoaded:) name: @"ContentLoaded" object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentFailed:) name: @"ContentFailed" object: nil];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
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
	[email release];
    [super dealloc];
}


@end
