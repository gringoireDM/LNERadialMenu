//
//  ViewController.m
//  LNERadialMenu
//
//  Created by Giuseppe Lanza on 24/03/13.
//  Copyright (c) 2013 La Nuova Era. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(presentMenu:)];
	longPressRecognizer.minimumPressDuration = 1;
	
	[self.view addGestureRecognizer:longPressRecognizer];
}

-(void) presentMenu:(UILongPressGestureRecognizer *)gestureRecognizer{
	CGPoint location = [gestureRecognizer locationInView:self.view];
	if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
		LNERadialMenu *thisMenu = [[LNERadialMenu alloc] initFromPoint:location withDataSource:self andDelegate:self];
		
		[thisMenu showMenu];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Radial Menu datasource and delegate


-(NSInteger) numberOfButtonsForRadialMenu:(LNERadialMenu *)radialMenu{
	return 6;
}

-(CGFloat) radiusLenghtForRadialMenu:(LNERadialMenu *)radialMenu{
	return 100;
}

-(UIButton *)radialMenu:(LNERadialMenu *)radialMenu elementAtIndex:(NSInteger)index{
	UIButton *element = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
	element.backgroundColor = [UIColor whiteColor];
	element.layer.cornerRadius = element.bounds.size.height/2.0;
	element.layer.borderColor = [UIColor blackColor].CGColor;
	element.layer.borderWidth = 1;
	
	return element;
}

-(void)radialMenu:(LNERadialMenu *)radialMenu didSelectButton:(UIButton *)button{
	[radialMenu closeMenu];
}

-(UIView *)viewForCenterOfRadialMenu:(LNERadialMenu *)radialMenu{
	UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
	
	centerView.backgroundColor = [UIColor blackColor];
	
	return centerView;
}

-(void)radialMenu:(LNERadialMenu *)radialMenu customizationForRadialMenuView:(UIView *)radialMenuView{
	CALayer *bgLayer = [CALayer layer];
	bgLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
	bgLayer.borderColor = [UIColor colorWithWhite:200.0/255.0 alpha:1].CGColor;
	bgLayer.borderWidth = 1;
	bgLayer.cornerRadius = radialMenu.menuRadius;
	bgLayer.frame = CGRectMake(radialMenuView.frame.size.width/2.0-radialMenu.menuRadius, radialMenuView.frame.size.height/2.0-radialMenu.menuRadius, radialMenu.menuRadius*2, radialMenu.menuRadius*2);
	[radialMenuView.layer insertSublayer:bgLayer atIndex:0];
}

-(BOOL)canDragRadialMenu:(LNERadialMenu *)radialMenu{
	return YES;
}

@end
