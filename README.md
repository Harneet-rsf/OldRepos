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

touch()
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












Notes::::::::


single touch:::
sendevent /dev/input/event0 3 53 300
sendevent /dev/input/event0 3 54 400
sendevent /dev/input/event0 3 48 5
sendevent /dev/input/event0 3 58 50
sendevent /dev/input/event0 0 2 0
sendevent /dev/input/event0 0 0 0
sendevent /dev/input/event0 0 2 0
sendevent /dev/input/event0 0 0 0


long touch 1 sec:::
sendevent /dev/input/event0 3 53 300
sendevent /dev/input/event0 3 54 400
sendevent /dev/input/event0 3 48 5
sendevent /dev/input/event0 3 58 50
sendevent /dev/input/event0 0 2 0
sendevent /dev/input/event0 0 0 0
sleep 1
sendevent /dev/input/event0 0 2 0
sendevent /dev/input/event0 0 0 0



To send touch event you need to do:

Set coordinates:
adb shell sendevent /dev/input/event2 3 0 x
adb shell sendevent /dev/input/event2 3 1 y

Send touch event (must have 0 0 0 pair):
adb shell sendevent /dev/input/event2 1 330 1
adb shell sendevent /dev/input/event2 0 0 0

Send release finger event (must have 0 0 0 pair):
adb shell sendevent /dev/input/event2 1 330 0
adb shell sendevent /dev/input/event2 0 0 0

Please note, You can record events:
adb shell getevent

https://stackoverflow.com/questions/4386449/send-touch-events-to-a-device-via-adb/18959385#18959385


https://www.programmersought.com/article/6611358468/

getevent /dev/input/event7
Single touch
0003 0039 000000d5 //The unique ID of the contact distinction
0003 0035 00000165 //The x coordinate of the contact
0003 0036 000002fa //The y coordinate of the contact
0003 003a 00000025 //The pressure of the contact is actually the size of the contact area
0000 0000 00000000 //End

sendevent /dev/input/event1 3 57 213 //The unique ID of the contact distinction
sendevent /dev/input/event1 3 53 $1 //The x coordinate of the contact
sendevent /dev/input/event1 3 54 $2 //The y coordinate of the contact
sendevent /dev/input/event1 3 58 37 //The pressure of the contact is actually the size of the contact area
sendevent /dev/input/event1 0 0 0 //End




Only analyze multiple touch events
#define ABS_MT_SLOT 0x2f /* MT slot being modified */
#define ABS_MT_TOUCH_MAJOR 0x30 /* Major axis of touching ellipse */
#define ABS_MT_TOUCH_MINOR 0x31 /* Minor axis (omit if circular) */
#define ABS_MT_WIDTH_MAJOR 0x32 /* Major axis of approaching ellipse */
#define ABS_MT_WIDTH_MINOR 0x33 /* Minor axis (omit if circular) */
#define ABS_MT_ORIENTATION 0x34 /* Ellipse orientation */
#define ABS_MT_POSITION_X 0x35 /* Center X ellipse position */
#define ABS_MT_POSITION_Y 0x36 /* Center Y ellipse position */
#define ABS_MT_TOOL_TYPE 0x37 /* Type of touching device */
#define ABS_MT_BLOB_ID 0x38 /* Group a set of packets as a blob */
#define ABS_MT_TRACKING_ID 0x39 /* Unique ID of initiated contact */
#define ABS_MT_PRESSURE 0x3a /* Pressure on contact area */
#define ABS_MT_DISTANCE 0x3b /* Contact hover distance */
