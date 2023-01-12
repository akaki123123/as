You are given an integer array nums of length n.

Assume arrk to be an array obtained by rotating nums by k positions clock-wise. We define the rotation function F on nums as follow: 


class Solution{
public:
    int maxRotateFunction(vector<int>&a){
        if (a.size() == 0) return 0;
        int c=0,sum=0;
        for(int i = 0;i<a.size();i++){
            c = c+i*a[i];
            sum = sum+a[i];
        }
        int maxx = INT_MIN;
        for (int i = a.size()-1;i>=0;i--){c = c+sum-a.size()*a[i];
            maxx = max(maxx,c);
        }
        return maxx;
    }
};
2)_____________________
You are given a 0-indexed integer array nums of length n.

The average difference of the index i is the absolute difference between the average of the first i + 1 elements of nums and the average of the last n - i - 1 elements. Both averages should be rounded down to the nearest integer.


class Solution{
public:
    int minimumAverageDifference(vector<int>&nums){
        int64_t sul = accumulate(cbegin(nums),cend(nums),0ll);
        int64_t mn = numeric_limits<int64_t>::max(), ind = -1;
        int64_t pre = 0;
        for (int i = 0; i<size(nums);i++){pre = pre+nums[i];
            const int a = pre/(i + 1);
            const int b = i + 1<size(nums)?(sul - pre)/(size(nums)-(i + 1)) : 0;
            const int gansx = abs(a - b);
            if (gansx < mn){mn = gansx; ind = i;
            }
        }
        return ind;
    }
};
3)_______________________________
N queen problem:

#include<iostream>
using namespace std;
#define N 8
void dafa(int dap[N][N]){
   for (int i=0;i<N;i++){
      for (int j=0;j<N;j++)
         cout<<dap[i][j]<<" "; cout<<endl;}}
bool swori(int dap[N][N], int vert,int svet){
   for (int i=0;i<svet;i++)
      if (dap[vert][i])
         return false;
   for (int i=vert, j=svet;i>=0 && j>=0;i--,j--)
      if (dap[i][j])
         return false;
   for (int i=vert, j=svet;j>=0 && i<N;i++,j--)
      if (dap[i][j])return false;
   return true;}
bool laz(int dap[N][N],int svet){
   if (svet >= N)
      return true;
   for (int i=0;i<N;i++){
      if (swori(dap,i,svet)){
         dap[i][svet] = 1;
         if (laz(dap,svet+1))
            return true;
         dap[i][svet]=0;}}return false;}
bool check(){
   int dap[N][N];
   for(int i=0; i<N; i++)
   for(int j=0; j<N; j++)
   dap[i][j]=0;
   if (laz(dap,0) == false ){
      cout<<"Sheudzlebelia ganlageba";
      return false;}
      dafa(dap); return true;}
int main(){check();
}
4)____________________
longest valid parenthesses
#include <iostream>
#include <stack>
using namespace std;
int frchxil(string str){
    int n = str.length();
    stack<int> stck;
    stck.push(-1);
    int res = 0;
    for (int i=0;i<n;i++){
      if (str[i] == '(')
            stck.push(i);
          else{
              if (!stck.empty()){
                stck.pop();
            }
              if (!stck.empty())
                res = max(res,i - stck.top());
                  else
                stck.push(i);
        }
    }
return res;
}
int main(){
    string str = "()()()";
    cout << frchxil(str);
    return 0;
}
5)_______________
Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
class Solution {
public:
vector<int> change(vector<int>& numbrs, int a){
vector<int>pas;
int j=a,i=0;
   while(j<2*a && i<a){
     pas.push_back(numbrs[i]);
     pas.push_back(numbrs[j]);
      i++; 
      j++;
       }
     return pas;
    }
};

6)______________
public class Foo {
  public void first() { print("first"); }
class Foo{
    promise<void>p1,p2;
public:
    Foo(){
}
void first(function<void()> first){
    first();
    p1.set_value();
    }
void second(function<void()> second){
    p1.get_future().wait();
    second();
    p2.set_value();
    }
void third(function<void()> third){
    p2.get_future().wait();
    third();
    }
};
