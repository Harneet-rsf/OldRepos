# OldRepos
TBD......





Rough::::
# Hello World Program in Bash Shell

echo "Hello World!"

export PATH=$PATH:/system/bin/

n=10
x=300
y=800

for i in $(seq 1 $n)
do
    echo "Welcome $i times: " $x $y " : Now: " `date +"%T.%3N"`
    #input tap x y 
    #sleep 0.1
done



# Hello World Program in Bash Shell

export PATH=$PATH:/system/bin/

n=$1
x=300
y=800

for i in $(seq 1 $n)
do
    echo "Welcome $i times: " $x $y " : Now: " `date +"%T.%3N"`
    #input tap x y 
    #sleep 0.1
done





quit::::
export PATH=$PATH:/system/bin/

n=10
x=490
y=885

startx=500
startly=500

nextx=490
nexty=750

for i in $(seq 1 $n)
do
    echo "Welcome $i times: " $x $y " : Now: " `date +"%T.%3N"`
    #input tap $x $y 
    if ! (( $i % 5 )) ; then
        echo "Start $i times: " $startx $starty " : Now: " `date +"%T.%3N"`
    fi
    if ! (( $i % 5 )) ; then
        echo "Next $i times: " $nextx $nexty " : Now: " `date +"%T.%3N"`
    fi
    #input tap $lx $ly 
    
    #sleep 0.1
done

