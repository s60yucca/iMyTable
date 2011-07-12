//
//  ChangePassViewController.h
//  iMyTable
//
//  Created by nguyen khanh on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChangePassViewController : UIViewController {
	IBOutlet UITextField * oldPWD;
	IBOutlet UITextField * newPWD;
	IBOutlet UITextField * repaetPWD;
	NSString * email;
	NSString * personID;
}
@property(nonatomic,retain)NSString * email;
@property(nonatomic,retain)NSString * personID;
-(IBAction)personPWDChange:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
@end
