//
//  LoginViewController.h
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController {
	IBOutlet UITextField * email;
	IBOutlet UITextField * password;
	
	BOOL rememberMe;
	IBOutlet UIImageView * imageView;
	NSInteger tmp;
}
-(IBAction)registerAction:(id)semder;
-(IBAction)loginAction:(id)sender;
-(IBAction)forgetPassAction:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)skipRegister:(id)sender;
-(IBAction)checked:(id)sender;
@end
