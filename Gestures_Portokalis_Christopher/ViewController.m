//
//  ViewController.m
//  ;
//
//  Created by Chris Portokalis on 9/6/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton* start;
@property NSTimer* myTimer;
@property int score;
@property int funcTime;
@property int timesUp;
@property int lastIndex;
@property int currBestScore;




@end

@implementation ViewController

- (IBAction)pinched:(UIPinchGestureRecognizer *)sender {
    
    //if tapped during gameplay segment
    if(self.gesture.image == [UIImage imageNamed: @"PinchButton.png" ])
    {
        self.score++;
        
        
        int rand = arc4random_uniform(4);
        
        while(rand == self.lastIndex)
        {
            
            rand = arc4random_uniform(4);
            
        }
        
        self.lastIndex = rand;
        
        self.gesture.image = [UIImage imageNamed: [self.gestArray objectAtIndex: rand ]];
        
        
    }
    
    
}

- (IBAction)tapped:(UITapGestureRecognizer*)sender {
    
    
    if(self.gesture.image == [UIImage imageNamed: @"TapButton.png" ])
    {
        self.score++;
        
        int rand = arc4random_uniform(4);
        
        while(rand == self.lastIndex)
        {
            
            rand = arc4random_uniform(4);
            
        }
        
        self.lastIndex = rand;
        
        self.gesture.image = [UIImage imageNamed: [self.gestArray objectAtIndex: rand ]];
        
        
    }
    
    //if tapped during game over screen
    if(self.myTimer == nil)
    {
        
        self.touch.hidden = YES;
        self.gameOver.hidden = YES;
        self.start.hidden = NO;
        self.yourScore.hidden = YES;
        self.bestScore.hidden = YES;
        self.bestScoreNum.hidden = YES;
        self.yourScoreNum.hidden = YES;
      
        
        if(self.score > self.currBestScore && self.myTimer == nil)
        {
            self.bestScoreNum.text = [NSString stringWithFormat: @"%d", self.score];
            self.currBestScore = self.score;
            
        }
        else
        {
            
            self.bestScoreNum.text = [NSString stringWithFormat: @"%d", self.currBestScore];
            
            
        }
        
          self.score = 0;
        
    }
    
    
}


- (IBAction)swipedRight:(UISwipeGestureRecognizerDirection*) sender {
    
    if(self.gesture.image == [UIImage imageNamed: @"SwipeRight.png" ])
    {
        self.score++;
        
        int rand = arc4random_uniform(4);
        
        while(rand == self.lastIndex)
        {
            
            rand = arc4random_uniform(4);
            
        }
        
        self.lastIndex = rand;
        
        self.gesture.image = [UIImage imageNamed: [self.gestArray objectAtIndex: rand ]];
        
        
    }
    
    
    
    
}


- (IBAction)swipedLeft:(UISwipeGestureRecognizerDirection*) sender {
    
    if(self.gesture.image == [UIImage imageNamed: @"SwipeLeft.png" ])
    {
        self.score++;
        
        int rand = arc4random_uniform(4);
        
        while(rand == self.lastIndex)
        {
            
            rand = arc4random_uniform(4);
            
        }
        
        self.lastIndex = rand;
        
        self.gesture.image = [UIImage imageNamed: [self.gestArray objectAtIndex: rand ]];
        
        
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    
    UIButton* button1 = (UIButton*) sender;
    
    //hide start button
    button1.hidden = true;
    
    //store the ptr to the start button
    self.start = button1;
    
    //show UIs for actual game
    self.gesture.hidden = false;
    self.timer.hidden = false;
    self.touch.hidden = false;
    
    
    //initialize timer variables
    self.timer.text = @"60";
    self.timesUp = [self.timer.text integerValue];
    
    //setup gesture Array
    
 self.gestArray = [[NSArray alloc] initWithObjects: @"SwipeLeft.png", @"SwipeRight.png", @"TapButton.png", @"PinchButton.png", nil];
    
    
    
    //initialize timer
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                            target:self
                            selector:@selector(updateTimer)
                            userInfo:nil
                            repeats:YES];
    
    //start gestures
    int rand = arc4random_uniform(4);
    self.lastIndex = rand;
    
    
    //get Initial random image
    self.gesture.image = [UIImage imageNamed: [self.gestArray objectAtIndex: rand]];
    
    
    
}

-(void)updateTimer
{
    
    self.funcTime++;
    
    self.timer.text = [NSString stringWithFormat: @"%02d", self.timesUp - self.funcTime];
    
    if(self.funcTime == self.timesUp)
    {
        [self stopTimer];
    }
    
    
}

-(void)stopTimer
{
    //int newBestScore = self.score;
    
    //invalidate timer and set reset the time that has past
    [self.myTimer invalidate];
    self.myTimer = nil;
    self.funcTime = 0;
    
    //hide timer and gesture image ui
    self.timer.hidden = true;
    self.gesture.hidden = true;
    
    //make end game screen visible
    self.gameOver.hidden = false;
    self.yourScore.hidden = false;
    self.bestScore.hidden = false;
    self.bestScoreNum.hidden = false;
    self.yourScoreNum.hidden = false;
    
    
    //print results
    self.yourScore.text = @"Gestures This Round: ";
    self.bestScoreNum.text = [NSString stringWithFormat:@"%d", self.currBestScore];
    self.yourScoreNum.text = [NSString stringWithFormat: @"%d", self.score];
    
    
    
}


@end
