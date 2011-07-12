//
//  FindMeATableViewController.m
//  iMyTable
//
//  Created by nguyen khanh on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FindMeATableViewController.h"
#import "Table.h"


@implementation FindMeATableViewController
@synthesize scrollview;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

-(void)clickAction
{
	NSLog(@"click");
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//UIDatePicker * picker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
	//CGSize pickerSize = [picker sizeThatFits:CGSizeZero];
	//picker.frame = CGRectMake(40,190,240,pickerSize.height - 50);
	//picker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	//picker.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	CGRect pickerFrame = CGRectMake(0,0,200,200);
	
    UIDatePicker *pickerView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    //[myPicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
	
   // [self.view addSubview:picker];
	
    //[picker release]; 
	
	CGSize pickerSize = [pickerView sizeThatFits:CGSizeZero];
	
	UIView * pickerTransformView = [[UIView alloc] initWithFrame:CGRectMake(-96.0, 30.0, pickerSize.width, pickerSize.height)];
	pickerTransformView.transform = CGAffineTransformMakeScale(0.4f, 0.4f);
	
	[pickerTransformView addSubview:pickerView];
	[self.view addSubview:pickerTransformView];
	[pickerTransformView release];
	
	
	//-----------------------------------------
	Table * a = [[[Table alloc]init]autorelease];
	a.top = 300.0;
	a.left = 160.0;
	a.size = 2;
	
	float f = 10.0;
	
	UILabel * table_a = [[[UILabel alloc]init]autorelease];
	table_a.frame = CGRectMake(a.left, a.top, a.size*f, a.size*f);
	table_a.text = [NSString stringWithFormat:@"%d",a.size];
	table_a.textColor = [UIColor whiteColor];
	table_a.backgroundColor = [UIColor blackColor];
	[table_a setTextAlignment:UITextAlignmentCenter];
	[self.view addSubview:table_a];
	
	UIButton * c = [UIButton buttonWithType:UIButtonTypeCustom];
	c.frame = CGRectMake(a.left, a.top, a.size*f, a.size*f);
	[c addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:c];
	
	UIButton * click = [UIButton buttonWithType:UIButtonTypeCustom];
	click.frame = CGRectMake(a.left+10.0, a.top-15.0, 30, 30);
	[click setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
	[click setTitle:@"1" forState:UIControlStateNormal];
	click.userInteractionEnabled = NO;
	//[click[36] addTarget:self action:@selector(clickCalendar) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:click];
	
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
	[scrollview release];
    [super dealloc];
}


@end
