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

- (IBAction)onButton:(id)sender;

- (IBAction)onTap:(id)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.passwordTextField.delegate = self;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"text field did begin editing");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"text field did end editing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"%@", text);
    
    if ([text isEqualToString:@"hello"]) {
        NSLog(@"You have the correct pass!");
    }
    
    return YES;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButton:(id)sender {
    NSLog(@"You tapped the button");
    NSString *text = self.passwordTextField.text;
    
    if ([text isEqualToString:@"hello"]) {
        NSLog(@"You got the correct password!");
    }
    
    
    FeedViewController *vc = [[FeedViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.23 green:0.34 blue:0.59 alpha:1];
    navigationController.navigationBar.translucent = YES;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}


@end
