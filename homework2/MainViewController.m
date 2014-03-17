//
//  MainViewController.m
//  homework2
//
//  Created by Gabriele Angeline on 3/15/14.
//  Copyright (c) 2014 Gabriele Angeline. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UIButton *logInBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


- (IBAction)onButton:(id)sender;

- (IBAction)onTap:(id)sender;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

- (void)myMethod;
- (void)wrongPass;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
 
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.passwordTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.loginView.backgroundColor = [UIColor colorWithRed:0.23 green:0.34 blue:0.59 alpha:1];
    self.logInBtn.enabled = NO;
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicatorView.center = CGPointMake(13,20);
    
    [self.activityView addSubview:indicatorView];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"text field did begin editing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"text field did end editing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    //NSLog(@"%@", text);
    
    //if ([text isEqualToString:@"hello"]) {
    //    NSLog(@"You have the correct pass!");
    //}
    
    if (self.emailTextField.text.length == 0 || self.passwordTextField.text.length == 0) {
        NSLog(@"Btn is enabled");
        self.logInBtn.enabled = NO;
    }   else {
        self.logInBtn.enabled = YES;
    }
    
    return YES;
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.logoView.frame = CGRectMake(73,50, self.logoView.frame.size.width, self.logoView.frame.size.height);
                         self.loginView.frame = CGRectMake(0,120, self.loginView.frame.size.width, self.loginView.frame.size.height);
                         self.signUpBtn.frame = CGRectMake(84,300, self.signUpBtn.frame.size.width, self.signUpBtn.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.logoView.frame = CGRectMake(73,117, self.logoView.frame.size.width, self.logoView.frame.size.height);
                         self.loginView.frame = CGRectMake(0,190, self.loginView.frame.size.width, self.loginView.frame.size.height);
                         self.signUpBtn.frame = CGRectMake(84,480, self.signUpBtn.frame.size.width, self.signUpBtn.frame.size.height);
                     }
                     completion:nil];
}

- (void)myMethod {
    
    FeedViewController *vc = [[FeedViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.23 green:0.34 blue:0.59 alpha:1];
    navigationController.navigationBar.translucent = YES;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    
}

- (void)wrongPass {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
    [self.activityView stopAnimating];
    UIImage *loginImage = [UIImage imageNamed:@"loggin_btn_disabled"];
    [self.logInBtn setBackgroundImage:loginImage forState:UIControlStateNormal];

}


- (void)myWaitMethod {
    
    FeedViewController *vc = [[FeedViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.23 green:0.34 blue:0.59 alpha:1];
    navigationController.navigationBar.translucent = YES;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButton:(id)sender {
    NSLog(@"You tapped the button");
    NSString *text = self.passwordTextField.text;
    //UIImage *login = [UIImage imageNamed:@"loggin_in_btn"];
    UIImage *loggingInImage = [UIImage imageNamed:@"loggin_in_btn"];
    //UIImage *loginImage = [UIImage imageNamed:@"loggin_button_disabled"];

    
    [self.logInBtn setBackgroundImage:loggingInImage forState:UIControlStateNormal];
    [self.activityView startAnimating];
    
    if ([text isEqualToString:@"password"]) {
        NSLog(@"You got the correct password!");
        [self performSelector:@selector(myMethod) withObject:nil afterDelay:2];

    } else {

        NSLog(@"incorrect password!");
        [self performSelector:@selector(wrongPass) withObject:nil afterDelay:2];
   
    }
    
}



- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}




@end
