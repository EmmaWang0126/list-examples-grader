CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# Step2: Check that the student code has the correct file submitted. If they didn’t, 
#       detect and give helpful feedback about it. This is not done by the provided code, you should figure out where to add it

if [[ ! -f student-submission/ListExamples.java ]]
then 
    javac IncorrectFileSubmission.java
    java IncorrectFileSubmission 2
fi
