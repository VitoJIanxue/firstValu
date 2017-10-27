//
//  ViewController.m
//  CoreDa
//
//  Created by Vito on 17/2/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//

#import "newses.h"
#import "Tool.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Tool *too = [[Tool alloc] init];
    
    [too removePerson];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
