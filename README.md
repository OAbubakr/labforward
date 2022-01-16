# README

In the task description it is stated that I need to calculate moving z-score, which is the expected if the input is a stream of readings. However, I think the samples in the spreadsheet attached were calculated with normal z-score. So I implemented both solutions

For each solution, I created a service class for calculation and added specs for both.
In the moving z-score implementation with O(n) time complexity by caching the sum and sum of squared values.
The idea is simply calculating the square bracket in the variance equation (i.e. (x-mean)^2). to be sum(x^2) - 2*mean*sum(x) + N*mean^2

The task took about 5 hours:
2 for reading about z-score and how to calculate it.
1 for figuring out an optimized way to calculate moving z-score in O(n).
1 for Implementation.
1 for specs.


