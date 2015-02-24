//
//  QuizViewController.m
//  QuizSample
//
//  Created by Master on 2014/11/01.
//  Copyright (c) 2014年 net.masuhara. All rights reserved.
//

#import "QuizViewController.h"


@interface QuizViewController ()
<UIAlertViewDelegate>

@end

@implementation QuizViewController

{
    int currentQuiz;
    int correctAnswer;
    AVAudioPlayer *questionSound, *correctSound, *incorrectSound;
    NSMutableArray *quizArray;
    IBOutlet UITextView *problemTextView;
    IBOutlet UIImageView *quizImageView;
    IBOutlet UIButton *buttonA, *buttonB, *buttonC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentQuiz = 0;
    correctAnswer = 0;
    
    quizArray = [NSMutableArray new];
    quizArray = [self shuffleQuiz:[self setQuiz]];
    
    buttonA.tag = 1;
    buttonB.tag = 2;
    buttonC.tag = 3;
    
    [self setSounds];
    [self setQuestions];
}

- (void)viewDidAppear:(BOOL)animated
{
    [questionSound play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (NSMutableArray *)shuffleQuiz:(NSMutableArray *)qArray
{
    int numberOfQuiz = (int)[qArray count];
    
    for (int i = numberOfQuiz - 1; i > 0; i--) {
        int randNumber = arc4random() % i;
        [qArray exchangeObjectAtIndex:i withObjectAtIndex:randNumber];
    }
    
    NSLog(@"問題一覧 %@", qArray);
    
    return qArray;
}



#pragma mark - IBAction

- (IBAction)selectAnswer:(UIButton *)selectedButton
{
    if (selectedButton.tag == [[quizArray[currentQuiz] objectAtIndex:0] intValue]) {
        //正解だったとき
        [correctSound play];
        correctAnswer++;
    }else{
        //不正解だったとき
        [incorrectSound play];
    }
    
    currentQuiz++;
    [self setQuestions];
}


#pragma mark - Sounds

- (void)setSounds
{
    //問題が出たときの音
    NSString *questionSoundPath = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"wav"];
    NSURL *questionSoundURL = [NSURL fileURLWithPath:questionSoundPath];
    
    //正解したときの音
    NSString *correctSoundPath = [[NSBundle mainBundle] pathForResource:@"correct" ofType:@"wav"];
    NSURL *correctSoundURL = [NSURL fileURLWithPath:correctSoundPath];
    
    //不正解だったときの音
    NSString *incorrectSoundPath = [[NSBundle mainBundle] pathForResource:@"incorrect" ofType:@"wav"];
    NSURL *incorrectSoundURL = [NSURL fileURLWithPath:incorrectSoundPath];
    
    
    questionSound = [[AVAudioPlayer alloc] initWithContentsOfURL:questionSoundURL error:nil];
    correctSound = [[AVAudioPlayer alloc] initWithContentsOfURL:correctSoundURL error:nil];
    incorrectSound = [[AVAudioPlayer alloc] initWithContentsOfURL:incorrectSoundURL error:nil];
    
    [questionSound prepareToPlay];
    [correctSound prepareToPlay];
    [incorrectSound prepareToPlay];
}



#pragma mark - Quiz

- (NSMutableArray *)setQuiz
{
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"g-logo.png"], @"７番", @"長野", @"坂本", @"ロペス", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"g-logo.png"], @"11番", @"久保", @"内川", @"西村", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"g-logo.png"], @"10番", @"星野", @"藤村", @"阿部", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"g-logo.png"], @"９番", @"亀井", @"藤井", @"小田", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"g-logo.png"], @"２５番", @"村田", @"田中", @"相川", nil]];
       [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"g-logo.png"], @"23番", @"相川", @"小林", @"佐々岡", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"b-logo.png"], @"00番", @"東野", @"藤井", @"吉村", nil]];
    //
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"b-logo.png"], @"１８番", @"杉内", @"清水", @"三浦", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"１１番", @"東野", @"山口", @"井納", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"１７番", @"井納", @"三嶋", @"三上", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"g-logo.png"], @"１番(永久欠番)", @"金田", @"王", @"長島", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"b-logo.png"], @"22番", @"高崎", @"筒香", @"内村", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"47番", @"梶谷", @"尚成", @"荒波", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"b-logo.png"], @"４番", @"藤田", @"金城", @"荒波", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"g-logo.png"], @"22番", @"小林(幹）", @"小林(誠司)", @"小林(太)", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"６５番", @"モスコーソ", @"国吉", @"ロペス", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"b-logo.png"], @"９番", @"黒羽根", @"内藤", @"高木", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"２番", @"ブランコ", @"ロペス", @"筒香", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"b-logo.png"], @"２５番", @"三浦", @"筒香", @"長谷川", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"b-logo.png"], @"111番", @"今井", @"亀井", @"砂田", nil]];
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"c-logo.png"], @"１２番", @"福井", @"九里", @"野村", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c-logo.png"], @"１４番", @"大瀬良", @"前田", @"篠田", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c-logo.png"], @"１８番", @"前田", @"杉内", @"野村", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"c-logo.png"], @"２９番", @"岩見", @"中田", @"江草", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"c-logo.png"], @"００番", @"岩本", @"中東", @"高橋", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"c-logo.png"], @"３８番", @"平松", @"赤松", @"国松", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c-logo.png"], @"１２０番", @"久本", @"佐藤", @"辻", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"2", [UIImage imageNamed:@"c-logo.png"], @"３１番", @"阿部", @"石原", @"丸", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c-logo.png"], @"２番", @"東出", @"菊池", @"梵", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"1", [UIImage imageNamed:@"c-logo.png"], @"２８番", @"新井", @"栗原", @"堂林", nil]];
    
    [quizArray addObject:[NSArray arrayWithObjects:@"3", [UIImage imageNamed:@"sh-logo.png"], @"１番", @"王", @"柳田", @"内川", nil]];
    

    
    
      
    
        
    return quizArray;
}


- (void)setQuestions
{
    if (currentQuiz < quizArray.count) {
        quizImageView.image = [quizArray[currentQuiz] objectAtIndex:1];
        problemTextView.text = [quizArray[currentQuiz] objectAtIndex:2];
        [buttonA setTitle:[quizArray[currentQuiz] objectAtIndex:3] forState:UIControlStateNormal];
        [buttonB setTitle:[quizArray[currentQuiz] objectAtIndex:4] forState:UIControlStateNormal];
        [buttonC setTitle:[quizArray[currentQuiz] objectAtIndex:5] forState:UIControlStateNormal];
    }else{
        NSString *messageString = [NSString stringWithFormat:@"%d問中、%d問正解でした！",currentQuiz, correctAnswer];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"結果" message:messageString delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
}




@end
