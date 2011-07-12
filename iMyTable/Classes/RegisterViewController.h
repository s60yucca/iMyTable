//
//  RegisterViewController.h
//  iMyTable
//
//  Created by nguyen khanh on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterViewController : UIViewController {
	IBOutlet UITextField * email;
}
-(IBAction)registerAction:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)skipRegister:(id)sender;
@end
