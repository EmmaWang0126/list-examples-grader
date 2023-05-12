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

cp TestListExamples.java student-submission/ListExamples.java Server.java grading-area

javac Server.java 
javac -cp .:/lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 
java -cp .:/lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore Tests > grading-area/TestResults.txt 2>&1

if [[ $?!=0 ]]
then
    echo "Test Cases Failed"
else 
    echo "Your ListExamples.java file has passed all the Tests!!"
fi

cat grading-area/TestResults.txt


