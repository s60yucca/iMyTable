//
//  ChangePassViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChangePassViewController.h"
#import "iMyTableAppDelegate.h"
#import "Request.h"
#import "TouchXML.h"
#import "Person.h"


@implementation ChangePassViewController
@synthesize email;
@synthesize personID;

-(IBAction)textFieldDoneEditing:(id)sender
{
	[oldPWD resignFirstResponder];
	[newPWD resignFirstResponder];
	[repaetPWD resignFirstResponder];
}

-(void) xmlParsePersonPWDChangeDone:(NSData*)data {
	
	CXMLDocument * rssParser = [[[CXMLDocument alloc] initWithData:data options:0 error:nil] autorelease];
	
	CXMLElement *resultElement  = [rssParser rootElement];
	NSString * result = [resultElement stringValue];
	NSLog(@"%@",result);
	NSLog(@"%d",[[result componentsSeparatedByString:@"#"]count]);
	if([[[result componentsSeparatedByString:@"#"]objectAtIndex:0] isEqualToString:@"-1"])
	{
		iMyTableAppDelegate * delegate = [iMyTableAppDelegate sharedAppDelegate];
		[delegate showMainScreen:3];
		
		Person * person = [iMyTableAppDelegate sharedAppDelegate]._person;
		person.personID = [[result componentsSeparatedByString:@"#"]objectAtIndex:1];
		person.email = email;
		
		//[[iMyTableAppDelegate sharedAppDelegate]sevePerson:person.personID];
	}
}


- (void) contentLoaded:(NSNotification*) notification
{
	NSLog(@"content loaded");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
	[self xmlParsePersonPWDChangeDone:[[Request sharedRequest]xmlData]];
}
- (void) contentFailed:(NSNotification*) notification
{
	NSLog(@"content failed");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
}


-(IBAction)personPWDChange:(id)senders
{
	[[Request sharedRequest] personPWDChange:personID email:email oldPWD:oldPWD.text newPWD:newPWD.text];
	[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentLoaded:) name: @"ContentLoaded" object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentFailed:) name: @"ContentFailed" object: nil];
	//iMyTableAppDelegate * delegate = [iMyTableAppDelegate sharedAppDelegate];
	//[delegate showMainScreen:1];
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
	[personID release];
	[oldPWD release];
	[newPWD release];
	[repaetPWD release];
    [super dealloc];
}


@end


