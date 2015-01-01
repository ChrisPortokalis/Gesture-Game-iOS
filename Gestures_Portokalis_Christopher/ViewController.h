//
//  ViewController.h
//  Gestures_Portokalis_Christopher
//
//  Created by Chris Portokalis on 9/6/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//labels
//**************************************************//
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UILabel *gameOver;
@property (weak, nonatomic) IBOutlet UILabel *yourScore;
@property (weak, nonatomic) IBOutlet UILabel *bestScore;
@property (weak, nonatomic) IBOutlet UILabel *bestScoreNum;
@property (weak, nonatomic) IBOutlet UILabel *yourScoreNum;


//ImageViews
//*************************************************//
@property (weak, nonatomic) IBOutlet UIImageView *gesture;




//UIViews
//****************************************************//
@property (weak, nonatomic) IBOutlet UIView *touch;



//score properties
//**************************************************//

//array
//(***************************************

@property NSArray* gestArray;



//actions
//**************************************************//
- (IBAction)startButton:(id)sender;

//pointers



@end
