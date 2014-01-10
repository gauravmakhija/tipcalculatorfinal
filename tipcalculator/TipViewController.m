//
//  TipViewController.m
//  tipcalculator
//
//  Created by Gaurav Makhija on 1/9/14.
//  Copyright (c) 2014 Maps. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentage;
-(IBAction)onTap:(id)sender;
-(void)updateValues;
-(void)onSettingsButton;
-(void)viewWillAppear:(BOOL)animated;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onTap:(id)sender{
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.tipPercentage.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults]integerForKey:@"tipPercentDefault"];
    [self updateValues];
}

-(void)updateValues{
    
    float billAmount = [self.billTextField.text floatValue];
    NSArray* percentages = @[@(0.1),@(0.15),@(0.2)];
    float tipAmount = billAmount * [percentages[self.tipPercentage.selectedSegmentIndex ] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
    
}

@end
