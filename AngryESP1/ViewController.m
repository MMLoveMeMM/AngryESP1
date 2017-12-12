//
//  ViewController.m
//  AngryESP1
//
//  Created by liuzhibao on 12/9/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#import "ViewController.h"
#import "esView01.h"
@interface ViewController ()
@property (nonatomic , strong) esView01*   myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myView = (esView01 *)self.view;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
