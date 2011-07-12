//
//  ProfileViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"
#import "iMyTableAppDelegate.h"
#import "Person.h"


@implementation ProfileViewController

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
	[scrollView addSubview:introView];
	scrollView.scrollEnabled=YES;
	scrollView.contentSize = introView.bounds.size;
	
	
	person = [iMyTableAppDelegate sharedAppDelegate]._person;
	NSLog(person.email);
	email.text = person.email;
	
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
	[firstName release];
	[middleName release];
	[surName release];
	[title release];
	[email release];
	[phoneNumber release];
	[address1 release];
	[address2 release];
	[address3 release];
	[address4 release];
	[secretQuestion release];
	[secretAnswer release];

	[scrollView release];
	[introView release];
	[person release];
    [super dealloc];
}


@end
