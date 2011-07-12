//
//  FindaRestaurentViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FindaRestaurentViewController.h"
#import "FindMeATableViewController.h"
#import "Request.h"
#import "TouchXML.h"


@implementation FindaRestaurentViewController

@synthesize tableView;

-(void) xmlParseGetAllTypeDone:(NSData*)data {
	
	CXMLDocument * rssParser = [[[CXMLDocument alloc] initWithData:data options:0 error:nil] autorelease];
	
    NSMutableArray * arrayAllType = [[NSMutableArray alloc]init];
	
	CXMLElement * rootElement  = [rssParser rootElement];
	
	for(int i = 0; i < [[rootElement elementsForName:@"string"] count];i++)
		[arrayAllType addObject:[[[rootElement elementsForName:@"string"]objectAtIndex:i]stringValue]];
	
	array = [[NSArray alloc]initWithArray:arrayAllType];
	
	if([array count] > 0)
		[self newActionsheet];
	
	/*
	for (CXMLElement * resultElement in resultNodes) {
	 
	NSMutableDictionary * blogItem = [[NSMutableDictionary alloc] init];
	 
	int counter;
	 
	for(counter = 0; counter < [resultElement childCount]; counter++) 
	{
		[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
	}
	 
	[blogEntries addObject:[blogItem copy]];
	}
	 */
}

- (void) contentLoaded:(NSNotification*) notification
{
	NSLog(@"content loaded");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
	[self xmlParseGetAllTypeDone:[[Request sharedRequest]xmlData]];
}
- (void) contentFailed:(NSNotification*) notification
{
	NSLog(@"content failed");
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentFailed" object:nil];	
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"ContentLoaded" object:nil];
}


-(IBAction)dropdownAction:(id)sender
{

		actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
		[actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
		CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
		pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
		pickerView.showsSelectionIndicator = YES;
		pickerView.dataSource = self;
		pickerView.delegate = self;
		[actionSheet addSubview:pickerView];
		//---
		UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
		closeButton.momentary = YES; 
		closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
		closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
		closeButton.tintColor = [UIColor blackColor];
		[closeButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
		[actionSheet addSubview:closeButton];
		[closeButton release];
		
		[actionSheet showInView:self.view];
		
		[actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
		[actionSheet release];

}

-(void)newActionsheet
{
	actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	[actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
	CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
	pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
	pickerView.showsSelectionIndicator = YES;
	pickerView.dataSource = self;
	pickerView.delegate = self;
	[actionSheet addSubview:pickerView];
	//---
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
	closeButton.momentary = YES; 
	closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor blackColor];
	[closeButton addTarget:self action:@selector(dismissActionSheet1:) forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:closeButton];
	[closeButton release];
	
	[actionSheet showInView:self.view];
	
	[actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
	[actionSheet release];
}


-(void)dismissActionSheet:(id)sender
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];
	filter.text = [array objectAtIndex:[pickerView selectedRowInComponent:0]];
	check2 = [pickerView selectedRowInComponent:0];
	[pickerView release];
	
	switch (check2) {
		case 0:
			nameLabel.hidden = YES;
			nameTextField.hidden = NO;
			break;
		case 1:
			//[array release];
			[[Request sharedRequest] restaurantGetAllType];
			[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentLoaded:) name: @"ContentLoaded" object: nil];
			[[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(contentFailed:) name: @"ContentFailed" object: nil];
			
			break;
		case 2:
			break;
		case 3:
			nameTextField.hidden = YES;
			[array release];
			array = [[NSMutableArray alloc]initWithObjects:@"0 stars",@"1 stars",@"2 stars",@"3 stars",@"4 stars",@"5 stars",nil];
			[self newActionsheet];
			break;
		case 4:
			nameTextField.hidden = YES;
			[array release];
			array = [[NSMutableArray alloc]initWithObjects:@"0 -> 200",@"200 -> 500",@"> 500",nil];
			[self newActionsheet];
			break;
	}
	
	
}

-(void)dismissActionSheet1:(id)sender
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];
	nameLabel.hidden = NO;
	nameLabel.text = [array objectAtIndex:[pickerView selectedRowInComponent:0]];
	[pickerView release];
	
	[array release];
	array = [[NSMutableArray alloc]initWithObjects:@"Name",@"Type",@"Near me location",@"Rating",@"Price",nil];
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
	
	nameTextField.hidden = YES;
	nameLabel.hidden = YES;
	//check1 = 0;
	
	array = [[NSMutableArray alloc]initWithObjects:@"Name",@"Type",@"Near me location",@"Rating",@"Price",nil];
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

#pragma mark Picker View Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [array count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	return [array objectAtIndex:row];
}

//-----------------------------------
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil];
		cell = Cell;
	}    
	// Configure the cell.
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	FindMeATableViewController * f = [[FindMeATableViewController alloc]initWithNibName:@"FindMeATableViewController" bundle:nil];
	[self.navigationController pushViewController:f animated:YES];
	[f release];
}


- (void)dealloc {
	[tableData release];
	[Cell release];
	[tableView release];
	[nameLabel release];
	[pickerView release];
	[actionSheet release];
	[array release];
	[filter release];
	[nameButton release];
	[nameTextField release];
    [super dealloc];
}


@end
