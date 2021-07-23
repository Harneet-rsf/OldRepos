#quit::::

export PATH=$PATH:/system/bin/

n=$1
X=490
Y=885
#Y=1770

chooseLeagueX=500
chooseLeagueY=500
#chooseLeagueY=1000

nextX=490
nextY=750
#nextY=1500

quitX=80
#quitY=175
quitY=350

qConsentX=500
qConsentY=444
#qConsentY=950

closeX=550
closeY=905
#closeY=1750

battleX=850
battleY=500
#battleY=1000

collectX=440
collectY=930
#collectY=1860

gap=5
collectGap=10

function touch()
{
    echo "Touch: " $1 $2
    sendevent /dev/input/event1 3 53 $1
    sendevent /dev/input/event1 3 54 $2
    sendevent /dev/input/event1 1 330 1
    sendevent /dev/input/event1 0 0 0
    sendevent /dev/input/event1 1 330 0
    sendevent /dev/input/event1 0 0 0
}

for i in $(seq 1 $n)
do
    echo "Hit $i times: " $X $Y " : Now: " `date +"%T.%3N"`
    touch $X $Y
    #input tap $X $Y
    if ! (( $i % $gap )) ; then
        echo "ChooseLeague $i times: " $chooseLeagueX $chooseLeagueY " : Now: " `date +"%T.%3N"`
        touch $chooseLeagueX $chooseLeagueY

        echo "Next $i times: " $nextX $nextY " : Now: " `date +"%T.%3N"`
        touch $nextX $nextY

        echo "Quit $i times: " $quitX $quitY " : Now: " `date +"%T.%3N"`
        touch $quitX $quitY
        
        sleep 1
        
        echo "QuitConsent $i times: " $qConsentX $qConsentY " : Now: " `date +"%T.%3N"`
        touch $qConsentX $qConsentY
    fi
    
    if ! (( $i % $collectGap )) ; then
        echo "Collect $i times: " $collectX $collectY " : Now: " `date +"%T.%3N"`
        touch $collectX $collectY
        
        echo "Hit $i times: " $X $Y " : Now: " `date +"%T.%3N"`
        touch $X $Y
        
        sleep 0.5
        
        echo "Close $i times: " $closeX $closeY " : Now: " `date +"%T.%3N"`
        touch $closeX $closeY
    fi
    
    sleep 0.5
    #sleep 0.1
done
