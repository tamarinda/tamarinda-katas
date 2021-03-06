//
//  TMRCodingBat.m
//  TamarindaKatas
//
//  Created by mariachi on 10/05/14.
//  Copyright (c) 2014 Tamara Bernad. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TMRCodingBatLogic2 : XCTestCase

@end

@implementation TMRCodingBatLogic2

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
 MAKE BRICKS - Logic-2
 
 We want to make a row of bricks that is goal inches long. We have a number of small bricks (1 inch each) and big bricks (5 inches each). Return true if it is possible to make the goal by choosing from the given bricks. This is a little harder than it looks and can be done without any loops. See also: Introduction to MakeBricks
 
 makeBricks(3, 1, 8) → true
 makeBricks(3, 1, 9) → false
 makeBricks(3, 2, 10) → true
 
 */

- (BOOL) makeBricksWithSmall:(NSInteger )small Big:(NSInteger ) big AndGoal:(NSInteger) goal{
    NSInteger div = goal / 5;
    goal -= div >= big ? big * 5 : div * 5;
    return goal <= small;
}

- (void)testMakeBricks3_1_8
{
    
    XCTAssertEqual(YES, [self makeBricksWithSmall:3 Big:1 AndGoal:8]);
    
}
- (void)testMakeBricks3_2_9
{
    
    XCTAssertEqual(NO, [self makeBricksWithSmall:3 Big:2 AndGoal:9]);
    
}

/*
 Given 3 int values, a b c, return their sum. However, if one of the values is the same as another of the values, it does not count towards the sum.
 
 loneSum(1, 2, 3) → 6
 loneSum(3, 2, 3) → 2
 loneSum(3, 3, 3) → 0
 */
- (NSInteger) loneSumWithA:( NSInteger )a AndB:(NSInteger)b AndC:(NSInteger)c{
    NSInteger sum = 0;
    sum += (a != b && a != c) ? a : 0;
    sum += (b != a && b != c) ? b : 0;
    sum += (c != a && c != b) ? c : 0;
    return sum;
}
- (void)testLoneSum_1_2_3{
    
    XCTAssertEqual(6, [self loneSumWithA:1 AndB:2 AndC:3]);
}

- (void)testLoneSum_3_2_3{
    
    XCTAssertEqual(2, [self loneSumWithA:3 AndB:2 AndC:3]);
}

- (void)testLoneSum_3_3_3{
    
    XCTAssertEqual(0, [self loneSumWithA:3 AndB:3 AndC:3]);
}

/*
 Given 3 int values, a b c, return their sum. However, if one of the values is 13 then it does not count towards the sum and values to its right do not count. So for example, if b is 13, then both b and c do not count.
 
 luckySum(1, 2, 3) → 6
 luckySum(1, 2, 13) → 3
 luckySum(1, 13, 3) → 1
 
 */
- (NSInteger) luckySumWithA:( NSInteger )a AndB:(NSInteger)b AndC:(NSInteger)c{
    
    NSInteger sum = 0;
    if(a != 13){
        sum += a;
        if(b != 13){
            sum +=b;
            if (c!=13) {
                sum += c;
            }
        }
    }
    
    return sum;
}
- (void)testLuckySum_1_2_3{
    
    XCTAssertEqual(6, [self luckySumWithA:1 AndB:2 AndC:3]);
}

- (void)testLuckySum_1_2_13{
    
    XCTAssertEqual(3, [self luckySumWithA:1 AndB:2 AndC:13]);
}

- (void)testLuckySum_1_13_3{
    
    XCTAssertEqual(1, [self luckySumWithA:1 AndB:13 AndC:3]);
}

/*
 Given 3 int values, a b c, return their sum. However, if any of the values is a teen -- in the range 13..19 inclusive -- then that value counts as 0, except 15 and 16 do not count as a teens. Write a separate helper "public int fixTeen(int n) {"that takes in an int value and returns that value fixed for the teen rule. In this way, you avoid repeating the teen code 3 times (i.e. "decomposition"). Define the helper below and at the same indent level as the main noTeenSum().
 
 noTeenSum(1, 2, 3) → 6
 noTeenSum(2, 13, 1) → 3
 noTeenSum(2, 1, 14) → 3
 
 */

- (NSInteger) fixTeen:(NSInteger )n{
    if(n >= 13 && n<=19){
        return n == 15 || n == 16 ? n : 0;
    }
    return n;
}

- (NSInteger) noTeenSumWithA:( NSInteger )a AndB:(NSInteger)b AndC:(NSInteger)c{
    
    NSInteger sum = 0;
    sum += [self fixTeen:a];
    sum += [self fixTeen:b];
    sum += [self fixTeen:c];
    return sum;
}
- (void)testNoTeenSum_1_2_3{
    
    XCTAssertEqual(6, [self noTeenSumWithA:1 AndB:2 AndC:3]);
}

- (void)testNoTeenSum_2_13_1{
    
    XCTAssertEqual(3, [self noTeenSumWithA:2 AndB:13 AndC:1]);
}

- (void)testNoTeenSum_2_1_14{
    
    XCTAssertEqual(3, [self noTeenSumWithA:2 AndB:1 AndC:14]);
}


@end
