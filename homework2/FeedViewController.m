//
//  FeedViewController.m
//  homework2
//
//  Created by Gabriele Angeline on 3/15/14.
//  Copyright (c) 2014 Gabriele Angeline. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@property (strong, nonatomic) IBOutlet UIView *feedView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedActivityView;
@property (weak, nonatomic) IBOutlet UIImageView *feed;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) delayImageView {
    CGRect rect = self.feed.frame;
    CGSize size = CGSizeMake(320, 415);
    rect.size = size;
    self.feed.frame = rect;
    [self.view addSubview:self.feed];
    self.feed.center=CGPointMake(0,113);
    self.feed.hidden = false;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.feedView.backgroundColor = [UIColor colorWithRed:0.82 green:0.83 blue:0.85 alpha:1];
    
    self.navigationItem.title = @"News Feed";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_icn"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messages_icn"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
   [self performSelector:@selector(delayImageView) withObject:nil afterDelay:3];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
