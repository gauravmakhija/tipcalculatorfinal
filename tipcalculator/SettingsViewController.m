//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Gaurav Makhija on 1/10/14.
//  Copyright (c) 2014 Maps. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPercent;
- (IBAction)onTap:(UITapGestureRecognizer *)sender;

@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
    self.defaultPercent.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults]integerForKey:@"tipPercentDefault"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.defaultPercent.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults]integerForKey:@"tipPercentDefault"];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(self.defaultPercent.selectedSegmentIndex==0){
        [defaults setInteger:0 forKey:@"tipPercentDefault"];
    }else if(self.defaultPercent.selectedSegmentIndex==1){
        [defaults setInteger:1 forKey:@"tipPercentDefault"];
    }else if(self.defaultPercent.selectedSegmentIndex==2){
        [defaults setInteger:2 forKey:@"tipPercentDefault"];
    }
    [defaults synchronize];

}
@end
