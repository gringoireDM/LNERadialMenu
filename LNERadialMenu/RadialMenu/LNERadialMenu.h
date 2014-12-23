//
//  LNERadialMenuView.h
//  LNERadialMenu
//
//  Created by Giuseppe Lanza on 24/03/13.
//  Copyright (c) 2013 La Nuova Era. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNERadialMenu;

@protocol LNERadialMenuDataSource <NSObject>

/*!
 This dataSource method asks the number of buttons that should be showed by the radial menu
 
 @p radialMenu the radial menu that is asking for this method
 @return NSInteger the number of buttons
 */
-(NSInteger)numberOfButtonsForRadialMenu:(LNERadialMenu *)radialMenu;

/*!
 This dataSource method asks for the i Button for the radial menu
 
 @p radialMenu the radial menu that is asking for this method
 @p index the index of the asked object
 @return UIButton the asked button
 */
-(UIButton *) radialMenu:(LNERadialMenu *)radialMenu elementAtIndex:(NSInteger)index;

@optional
/*!
 Thsi dataSource method determines if the menu can be moved with a pan gesture Recognizer. Defaults to YES.
 
 @p radialMenu the radial menu that is asking for this method
 @return BOOL
 */
-(BOOL) canDragRadialMenu:(LNERadialMenu *) radialMenu;

/*!
 This method is used to set the radius of the menu. Defaults to 50. This radius will be the minimum radius for the radial menu. All the buttons will have theyr center point on the circonference of the circle virtually drawn by this radius.
 
 @p radialMenu the radial menu that is asking for this method.
 @return CGFloat the radius size
 */
-(CGFloat)radiusLenghtForRadialMenu:(LNERadialMenu *)radialMenu;

/*!
 You should use this method if you want an inside center top view in the center of the menu. You could also use radialMenu:customizationForRadialMenuView: method to achieve the same result by adding your custom view to the radialMenuView, but you will have to do math to center the custom view of course. ;)
 
 @p radialMenu the radial menu that is asking for this method
 @return UIView Your center view.
 */
-(UIView *)viewForCenterOfRadialMenu:(LNERadialMenu *)radialMenu;

/*!
 A window to customize the radialMenuView (which is the "background plus center" view of the radial menu) before it becomes visible on screen. This method will be called AFTER the viewForCenterOfRadialMenu: method.
 
 @p radialMenu the radial menu that is asking for this method
 @p radialMenuView the background view of the radial menu that contains the centerView
 */
-(void) radialMenu:(LNERadialMenu *)radialMenu customizationForRadialMenuView:(UIView *) radialMenuView;

@end

@protocol LNERadialMenuDelegate <NSObject>

-(void)radialMenu:(LNERadialMenu *)radialMenu didSelectButton:(UIButton *)button;

@end

@interface LNERadialMenu : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, readonly) CGPoint centerPoint;
@property (nonatomic, readonly) CGFloat menuRadius;
@property (nonatomic, readonly) NSInteger numberOfButtons;
@property (nonatomic, readonly) UIView *radialMenuView;

/*!
 The color of the background view. Default is black with 0.3 alpha.
 */
@property (nonatomic, copy) UIColor *backgroundColor;

@property (nonatomic, weak) id<LNERadialMenuDelegate> delegate;
@property (nonatomic, weak) id<LNERadialMenuDataSource> dataSource;

@property (nonatomic, readonly) UIView *centerRadialView;

@property (nonatomic, strong) id radialMenuIdentifier;

/*!
 @warning The centerPoint MUST be related to the window.
 */
-(id) initFromPoint:(CGPoint)centerPoint withDataSource:(id<LNERadialMenuDataSource>)dataSource andDelegate:(id<LNERadialMenuDelegate>)delegate;

-(void) showMenu;
-(void) showMenuWithCompletion:(void(^)()) completion;

-(void) closeMenu;
-(void) closeMenuWithCompletion:(void(^)()) completion;

@end