//
//  FindaRestaurentViewController.h
//  iMyTable
//
//  Created by nguyen khanh on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FindaRestaurentViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate> {
	IBOutlet UILabel * filter;
	IBOutlet UITextField * nameTextField;
	IBOutlet UIButton * nameButton;
	IBOutlet UILabel * nameLabel;
	NSInteger check1;
	NSInteger check2;
	
	UIPickerView * pickerView;
	NSMutableArray *array;
	UIActionSheet * actionSheet;
	
	IBOutlet UITableView * tableView;
	IBOutlet UITableViewCell * Cell;
	NSMutableArray * tableData;
}
@property(nonatomic,retain)UITableView * tableView;
-(IBAction)dropdownAction:(id)sender;
-(void)newActionsheet;
@end
