//
//  TMRCodility.m
//  TamarindaKatas
//
//  Created by mariachi on 11/05/14.
//  Copyright (c) 2014 Tamara Bernad. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TMRCodility : XCTestCase

@end

@implementation TMRCodility

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
 A non-empty zero-indexed array A consisting of N integers is given. Array A represents numbers on a tape.
 Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
 The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
 In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
 For example, consider array A such that:
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 We can split this tape in four places:
 P = 1, difference = |3 − 10| = 7
 P = 2, difference = |4 − 9| = 5
 P = 3, difference = |6 − 7| = 1
 P = 4, difference = |10 − 3| = 7
 Write a function:
 int solution(int A[], int N);
 that, given a non-empty zero-indexed array A of N integers, returns the minimal difference that can be achieved.
 For example, given:
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 4
 A[4] = 3
 the function should return 1, as explained above.
 Assume that:
 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
 Complexity:
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 */

- (NSInteger)tapeEquilibrium:(NSArray *)A{
    int __block totalSum = 0;
    int __block minValue = INT_MAX;
    int __block intermediateSum = 0;
    [A enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        totalSum += [obj intValue];
    }];
    [A enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != 0) {
            int val = [obj intValue];
            intermediateSum += val;
            int res = totalSum - intermediateSum*2;//substract one for the total sum, and once to do the calc
            res = abs(res);
            minValue = MIN(res, minValue);
        }
        
    }];
    
    return minValue;
}
- (void)testtapeEquilibrium
{
    NSInteger i = [self tapeEquilibrium:@[@5,@3,@10, @1, @2, @4]];
    XCTAssertEqual(9, i);
}
- (void)testtapeEquilibrium2
{
    NSInteger i = [self tapeEquilibrium:@[@5,@3,@10, @1, @2]];
    XCTAssertEqual(5, i);
}
- (void)testtapeEquilibrium3
{
    NSInteger i = [self tapeEquilibrium:@[@3,@1,@2, @4, @3]];
    XCTAssertEqual(1, i);
}
- (void)testtapeEquilibrium4
{
    NSInteger i = [self tapeEquilibrium:@[@(-1000),@1000]];
    XCTAssertEqual(2000, i);
}
- (void)testtapeEquilibrium5
{
    NSInteger i = [self tapeEquilibrium:@[@(-1000),@(-1000)]];
    XCTAssertEqual(0, i);
}
@end
