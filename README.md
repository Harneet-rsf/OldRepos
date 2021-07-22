# OldRepos
TBD......





# Rough::::

export PATH=$PATH:/system/bin/

n=$1
x=300
y=800

for i in $(seq 1 $n)
do
    echo "Welcome $i times: " $x $y " : Now: " `date +"%T.%3N"`
    #input tap $x $y 
    #sleep 0.1
done





#quit::::

export PATH=$PATH:/system/bin/

n=10
x=490
y=885

startx=500
starty=500

nextx=490
nexty=750

function touch()
{
    echo "Touch: " $1 $2
    sendevent /dev/input/event1 3 53 $1
    sendevent /dev/input/event1 3 54 $2
    sendevent /dev/input/event1 3 48 5
    sendevent /dev/input/event1 3 58 50
    sendevent /dev/input/event1 0 2 0
    sendevent /dev/input/event1 0 0 0
    sendevent /dev/input/event1 0 2 0
    sendevent /dev/input/event1 0 0 0
}

for i in $(seq 1 $n)
do
    echo "Welcome $i times: " $x $y " : Now: " `date +"%T.%3N"`
    touch $x $y
    #input tap $x $y
    if ! (( $i % 5 )) ; then
        echo "Start $i times: " $startx $starty " : Now: " `date +"%T.%3N"`
        touch $startx $starty
        #input tap $startx $starty
    fi
    if ! (( $i % 5 )) ; then
        echo "Next $i times: " $nextx $nexty " : Now: " `date +"%T.%3N"`
        touch $nextx $nexty
        #input tap $nextx $nexty
    fi
    #input tap $lx $ly 
    
    #sleep 0.1
done




