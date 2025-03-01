# Google Phone 2015

## Description

Please use this Google doc to code during your interview. To free your hands for coding, we recommend that you use a headset or a phone with speaker option.Best,Google Staffing

From 1 to 1000 I want to print each number i. For multples of 3 I want to print fizz(i). For multiples of 5, I want to print buzz(i).

for %15 -> buzz(fizz(i)) OR fizz(buzz(i));

```
public void foo() {
	for(int i = 1; i<=1000;i++) {
		if(i < 3) {
			System.out.println(i);
		}
		else if(((i % 5) == 0) && ((i % 3) == 0))
			System.out.println(buzz(fizz(i)));
		else if((i % 5) == 0)
			System.out.println(buzz(i));
		else if((i % 3) == 0)
			System.out.println(fizz(i));
		else
			System.out.println(i);
  }
}

public void foo(int n, int m) {
	int nCount= 0;
	int mCount= 0;
	for(int i = 1; i<=1000;i++) {
		nCount++;
		mCount++;

		System.out.println(i);

		if(n == nCount) {
			System.out.println(fizz(i));
		}

		if(m == mCount) {
				System.out.println(buzz(i));
		}

		if((n == nCount) && (m == mCount)) {
				System.out.println(buzz(fizz(i)));
		}

		if(m == mCount) {
				mCount= 0;
		}

		if(n == tnCounthree) {
				nCount= 0;
		}
	}
}
```

### Notes

1
2
fizz(3)
4
buzz(5)

1
2
3
fizz(3)
4
5
buzz(5)
…
15
fizz(15)
buzz(15)
fizz(buzz(15))


[s1, s2, s3, s4...]

1 9 3 5 4 8 5 7

s1 <= s2 >= s3 <= s4 … sN
