# Coursera-Tidy-Data

The script merges many files from the UCI HAR Dataset, into one single dataset as it has been stated in the exercise (see readme for the exercise's description).
The input is described in the README.txt of the downloaded input (see "UCI HAR Dataset/README.txt" file).
The output represents the average of each variable for each activity and each subject. Each variable is represented by a column, and each activity / subject is represented by a row. 

# Column Names 
The resulting data frame has 66 rows
<pre>
1            tBodyAcc-mean()-X
2            tBodyAcc-mean()-Y
3            tBodyAcc-mean()-Z
4             tBodyAcc-std()-X
5             tBodyAcc-std()-Y
6             tBodyAcc-std()-Z
7         tGravityAcc-mean()-X
8         tGravityAcc-mean()-Y
9         tGravityAcc-mean()-Z
10         tGravityAcc-std()-X
11         tGravityAcc-std()-Y
12         tGravityAcc-std()-Z
13       tBodyAccJerk-mean()-X
14       tBodyAccJerk-mean()-Y
15       tBodyAccJerk-mean()-Z
16        tBodyAccJerk-std()-X
17        tBodyAccJerk-std()-Y
18        tBodyAccJerk-std()-Z
19          tBodyGyro-mean()-X
20          tBodyGyro-mean()-Y
21          tBodyGyro-mean()-Z
22           tBodyGyro-std()-X
23           tBodyGyro-std()-Y
24           tBodyGyro-std()-Z
25      tBodyGyroJerk-mean()-X
26      tBodyGyroJerk-mean()-Y
27      tBodyGyroJerk-mean()-Z
28       tBodyGyroJerk-std()-X
29       tBodyGyroJerk-std()-Y
30       tBodyGyroJerk-std()-Z
31          tBodyAccMag-mean()
32           tBodyAccMag-std()
33       tGravityAccMag-mean()
34        tGravityAccMag-std()
35      tBodyAccJerkMag-mean()
36       tBodyAccJerkMag-std()
37         tBodyGyroMag-mean()
38          tBodyGyroMag-std()
39     tBodyGyroJerkMag-mean()
40      tBodyGyroJerkMag-std()
41           fBodyAcc-mean()-X
42           fBodyAcc-mean()-Y
43           fBodyAcc-mean()-Z
44            fBodyAcc-std()-X
45            fBodyAcc-std()-Y
46            fBodyAcc-std()-Z
47       fBodyAccJerk-mean()-X
48       fBodyAccJerk-mean()-Y
49       fBodyAccJerk-mean()-Z
50        fBodyAccJerk-std()-X
51        fBodyAccJerk-std()-Y
52        fBodyAccJerk-std()-Z
53          fBodyGyro-mean()-X
54          fBodyGyro-mean()-Y
55          fBodyGyro-mean()-Z
56           fBodyGyro-std()-X
57           fBodyGyro-std()-Y
58           fBodyGyro-std()-Z
59          fBodyAccMag-mean()
60           fBodyAccMag-std()
61  fBodyBodyAccJerkMag-mean()
62   fBodyBodyAccJerkMag-std()
63     fBodyBodyGyroMag-mean()
64      fBodyBodyGyroMag-std()
65 fBodyBodyGyroJerkMag-mean()
66  fBodyBodyGyroJerkMag-std()
</pre>

# Column Names 
The resulting data frame has 36 columns
<pre>
1                  LAYING
2                  SITTING 
3                  STANDING
4                  WALKING
5       WALKING_DOWNSTAIRS
6          WALKING_UPSTAIRS
7                   subject.1
8                   subject.2
9                   subject.3
10                  subject.4
11                  subject.5
12                  subject.6
13                  subject.7
14                  subject.8
15                  subject.9
16                 subject.10
17                 subject.11
18                 subject.12
19                 subject.13
20                 subject.14
21                 subject.15
22                 subject.16
23                 subject.17
24                 subject.18
25                 subject.19
26                 subject.20
27                 subject.21
28                 subject.22
29                 subject.23
30                 subject.24
31                 subject.25
32                 subject.26
33                 subject.27
34                 subject.28
35                 subject.29
36                 subject.30
</pre>
