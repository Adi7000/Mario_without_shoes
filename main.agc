// Author: Aditya Goyal
// Project: Mario without shoes
// Created: 2019-04-10

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Mario without shoes" )
SetWindowSize( 2560, 1600, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 2560, 1600 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

//variables
level=11							//level changes how many levels you will face (add 1 to the number you want to face)
startscreen=1
w=87
s=83
a=65
d=68
p=80
jumpspeed=-30
n=20
marioflip=0
shootdelay=0
levelcomplete=0
goombajumpheight1=25
goombajumpheight2=25
goombajumpheight3=25
endscreen=0
goombadead=0
jumpinggoombas=1
fireball=0
rocketidealangle=0
explosion=0
wave=1
cinematicframes=0

//sprites and images
createimagecolor(1,255,255,255,255)
createsprite(1,1)
setspritesize(1,1,1)
setspritecolor(1,0,0,0,0)

createtext(2,"Play")
settextsize(2,200)
settextposition(2,getvirtualwidth()/2-gettexttotalwidth(2)/2,getvirtualheight()/2-gettexttotalheight(2)/2)
settextcolor(2,50,100,200,250)

createsprite(2,1)
setspritecolor(2,255,126,0,255)
setspritesize(2,gettexttotalwidth(2)+200,GetTextTotalHeight(2)+20)
setspriteposition(2,gettextx(2)-100,gettexty(2)-5)

createsprite(3,1)
setspritesize(3,getvirtualwidth(),getvirtualheight())
setspritecoloralpha(3,0)
setspriteposition(3,0,0)

createtext(4,"How to Play")
settextsize(4,50)
settextposition(4,getvirtualwidth()/2-gettexttotalwidth(4)/2,getspritey(2)+300)
settextcolor(4,50,100,200,250)
settextbold(4,1)

createsprite(4,1)
setspritecolor(4,255,126,0,255)
setspritesize(4,gettexttotalwidth(4)+200,GetTextTotalHeight(4)+20)
setspriteposition(4,gettextx(4)-100,gettexty(4)-7)

createtext(5,"Change Controls")
settextsize(5,50)
settextposition(5,getvirtualwidth()/2-gettexttotalwidth(5)/2,getspritey(4)+100)
settextcolor(5,50,100,200,250)
settextbold(5,1)

createsprite(5,1)
setspritecolor(5,255,126,0,255)
setspritesize(5,gettexttotalwidth(4)+200,GetTextTotalHeight(5)+20)
setspriteposition(5,getspritex(4),gettexty(5)-7)
// Ids 10-24 are for things that move with the character
loadimage(10,"background2.png")
createsprite(10,10)
setspritesize(10,getvirtualwidth(),getvirtualheight())
setspritecolor(10,150,150,255,255)
setspritex(10,getvirtualwidth()*2)

createsprite(11,10)
setspritesize(11,getvirtualwidth(),getvirtualheight())
setspritecolor(11,150,150,255,255)
setspritex(11,getvirtualwidth()*2)
//12 and 13 are lava
loadimage(14,"goomba.png")
createsprite(14,14)
setspriteposition(14,getvirtualwidth(),getvirtualheight())
setspritesize(14,100,100)

createsprite(15,14)
setspriteposition(15,getvirtualwidth(),getvirtualheight())
setspritesize(15,100,100)

createsprite(16,14)
setspriteposition(16,getvirtualwidth(),getvirtualheight())
setspritesize(16,100,100)
//17 is water
loadimage(18,"missile.png")
createsprite(18,18)
setspritesize(18,100,300)
setspriteposition(18,400,-getvirtualheight()+500)

loadimage(19,"fireball.png")
createsprite(19,19)
setspritesize(19,100,100)
setspriteposition(19,400,getvirtualheight()+500)
//20 is the bullet
loadimage(21,"cloud.png")
createsprite(21,21)
setspritesize(21,300,70)
setspritecolor(21,220,220,220,255)
setspriteposition(21,-1000,0)

createsprite(22,21)
setspritesize(22,300,70)
setspritecolor(22,200,200,200,255)
setspriteposition(22,-1000,0)

createsprite(23,21)
setspritesize(23,300,70)
setspritecolor(23,175,175,175,255)
setspriteposition(23,-1000,0)

createsprite(24,21)
setspritesize(24,300,70)
setspritecolor(24,220,220,220,255)
setspriteposition(24,-1000,0)
//25 is mario
createsprite(26,1)
setspritesize(26,getvirtualwidth(),getvirtualheight())
setspritecolor(26,149,84,26,255)
setspritex(26,getvirtualwidth()*2)

createsprite(27,1)
setspritesize(27,getvirtualwidth(),40)
setspritecolor(27,132,205,56,255)
setspritex(27,getvirtualwidth()*2)

loadimage(25,"mario.png")
createsprite(25,25)
setspritex(25,getvirtualwidth()*2)
setspritesize(25,150,170)

loadimage(28,"gun.png")
createsprite(28,28)
setspritesize(28,196,78)
setspriteposition(28,getvirtualwidth()+1,0)
setspritecoloralpha(28,200)

loadimage(29,"watergun.png")
createsprite(29,29)
setspritesize(29,196,78)
setspriteposition(29,getvirtualwidth()+1,0)
setspritecoloralpha(29,200)

loadimage(31,"circle.png")
createsprite(31,31)
setspritesize(31,200,200)
setspriteposition(31,getvirtualwidth(),0)
setspritecolor(31,100,100,100,200)

loadimage(30,"exclamation.png")
createsprite(30,30)
setspritesize(30,150,150)
setspriteposition(30,getvirtualwidth(),0)

loadimage(32,"peach.png")
createsprite(32,32)
setspritex(32,getvirtualwidth()*2)
setspritesize(32,150,170)

loadimage(33,"rope.png")
createsprite(33,33)
setspritesize(33,550,30)
setspriteposition(33,getvirtualwidth(),1100)

loadimage(20,"bullet.png")
createsprite(20,20)
setspritesize(20,50,10)
setspriteposition(20,-1*getvirtualwidth(),0)

loadimage(17,"water1.png")
createsprite(17,17)
setspritesize(17,100,50)
setspriteposition(17,-1*getvirtualwidth(),0)
setspritecolor(17,100,100,255,255)

loadimage(12,"lava.jpeg")
createsprite(12,12)
setspritesize(12,2005,1620)
setspriteposition(12,getvirtualwidth(),0)

createsprite(13,12)
setspritesize(13,2005,1620)
setspriteposition(13,getvirtualwidth(),0)

setprintcolor(255,126,0,255)

do
    gosub startscreen
    gosub cinematics
	gosub movecharacter
	gosub gun
	gosub obstaclerandomizer
	gosub jumpinggoombas
	gosub lavawall
	gosub fireball
	gosub platforms
	gosub endscreen
	gosub pausing
	gosub wins_score
    Sync()
loop

startscreen:
while startscreen=1
	
	//Play button
	setspriteposition(1,getpointerx(),getpointery())
	if getspritecollision(1,2)=1
		if gettextsize(2)<300
			settextsize(2,gettextsize(2)+4)
			settextposition(2,getvirtualwidth()/2-gettexttotalwidth(2)/2,getvirtualheight()/2-gettexttotalheight(2)/2)
			setspritesize(2,gettexttotalwidth(2)+200,GetTextTotalHeight(2)+20)
			setspriteposition(2,gettextx(2)-100,gettexty(2)-5)
		endif
		if getpointerpressed()=1
			startscreen=0
			settextposition(2,getvirtualwidth(),0)
			setspriteposition(26,0,1200)
			setspriteposition(27,0,1200)
			setspriteposition(10,getvirtualwidth(),0)
			setspriteposition(11,0,0)
			setspriteposition(28,getspritex(25)+32,getspritey(25)-20)
			setspriteposition(12,50-getspritewidth(12),0)
			setspriteposition(13,50-getspritewidth(12),-1*getvirtualheight()+10)
			setspriteposition(14,getvirtualwidth(),getspritey(26)-getspriteheight(14))
			setspriteposition(15,getvirtualwidth()+150,getspritey(26)-getspriteheight(15))
			setspriteposition(16,getspritex(15)+150,getspritey(26)-getspriteheight(16))
			setspriteposition(4,getvirtualwidth(),0)
			settextposition(4,getvirtualwidth(),0)
			setspriteposition(5,10000,10000)
			settextx(5,10000)
			setspriteposition(32,1700,1200-getspriteheight(32))
			setspriteposition(25,1700-getspritewidth(32),1200-getspriteheight(25))
			cinematics=1
		endif
	else
		if gettextsize(2)>200
			settextsize(2,gettextsize(2)-4)
			settextposition(2,getvirtualwidth()/2-gettexttotalwidth(2)/2,getvirtualheight()/2-gettexttotalheight(2)/2)
			setspritesize(2,gettexttotalwidth(2)+200,GetTextTotalHeight(2)+20)
			setspriteposition(2,gettextx(2)-100,gettexty(2)-5)
		endif
	endif
	
	//How to play button
	if getspritecollision(4,1)+getpointerpressed()=2
		settextvisible(4,0)
		settextvisible(2,0)
		settextvisible(5,0)
		setspriteposition(2,10000,10000)
		setspriteposition(4,10000,10000)
		setspritex(5,10000)
		howtoplay=1
		while howtoplay=1
			Print("")
			Print("")
			Print("")
			Print("")
			Print("				Use A and D to move or choose your own controls.")
			Print("								Press W to Jump")
			Print("						    Use Mouse to Aim and Shoot")
			Print("							    	Save Peach")
			Print("								Don't die (Hard)")
			Print("")
			Print("")
			Print("")
			Print("")
			Print("		Press H to return to home")
			if getrawkeypressed(72)=1
				howtoplay=0
				settextvisible(4,1)
				settextvisible(2,1)
				settextvisible(5,1)
				setspriteposition(2,gettextx(2)-100,gettexty(2)-5)
				setspriteposition(4,gettextx(4)-100,gettexty(4)-7)
				settextposition(5,getvirtualwidth()/2-gettexttotalwidth(5)/2,getspritey(4)+100)
				setspriteposition(5,getspritex(4),gettexty(5)-7)
			endif
			sync()
		endwhile
	endif
	
	//Change Controls button
	if getspritecollision(5,1)+getpointerpressed()=2
		settextvisible(4,0)
		settextvisible(2,0)
		settextvisible(5,0)
		setspriteposition(2,10000,10000)
		setspriteposition(4,10000,10000)
		setspritex(5,10000)
		changecontrols=1
		while changecontrols=1
			Print("				Press Enter to start")
			if getrawkeypressed(13)=1
				changecontrols=0
				chooseleftkey=1
			endif
			sync()
		endwhile
		while chooseleftkey=1
			Print("				Choose LEFT key")
			if not getrawlastkey() = 13
				a=getrawlastkey()
				chooseleftkey=0
				chooserightkey=1
			endif
			sync()
		endwhile
		while chooserightkey=1
			Print("				Choose RIGHT key")
			if not getrawlastkey() = a
				d=getrawlastkey()
				chooserightkey=0
				choosejumpkey=1
			endif
			sync()
		endwhile
		while choosejumpkey=1
			Print("				Choose JUMP key")
			if not getrawlastkey() = d
				w=getrawlastkey()
				choosejumpkey=0
				choosepausekey=1
			endif
			sync()
		endwhile
		while choosepausekey=1
			Print("				Choose PAUSE key")
			if not getrawlastkey() = w
				p=getrawlastkey()
				choosepausekey=0
				settextvisible(4,1)
				settextvisible(2,1)
				settextvisible(5,1)
				setspriteposition(2,gettextx(2)-100,gettexty(2)-5)
				setspriteposition(4,gettextx(4)-100,gettexty(4)-7)
				settextposition(5,getvirtualwidth()/2-gettexttotalwidth(5)/2,getspritey(4)+100)
				setspriteposition(5,getspritex(4),gettexty(5)-7)
			endif
			sync()
		endwhile
		endif
	sync()
endwhile

return

cinematics:
while cinematics=1
	cinematicframes=cinematicframes+1
	if cinematicframes>150 and cinematicframes<300
		setspritex(33,getspritex(33)-40)
		if getspritecollision(33,32)=1
			setspritex(33,getspritex(33)+100)
			setspritex(32,getspritex(32)+60)
		endif
		if getspritex(33)>getvirtualwidth()
			if mod(cinematicframes,40)<20
				setspritex(25,getspritex(25)+30)
				setspriteflip(25,0,0)
			else
				setspritex(25,getspritex(25)-30)
				setspriteflip(25,1,0)
			endif
		endif
	endif
	if cinematicframes>300
		cinematics=0
		cinematicframes=0
		setspriteposition(25,400,1200-getspriteheight(25))
	endif
	sync()
endwhile

return

movecharacter:
//moving right
if getrawkeystate(d)=1 or stationary=1
	setspriteflip(25,0,0)
	marioflip=0
	if getspritex(25)>1100 //screen moves
		// use while loop to be efficient
		screenmoves=1
		n=9
		while n<24
			n=n+1
			setspritex(n,getspritex(n)-20)
		endwhile
		//reset position of background
		if getspritex(10)=0
			setspritex(11,getvirtualwidth())
		endif
		if getspritex(11)=0
			setspritex(10,getvirtualwidth())
		endif
	else// player moves
		screenmoves=0
		setspritex(25,getspritex(25)+20)
	endif
endif

//moving left
if getrawkeystate(a)=1 or stationary=1
	if stationary=1 and getrawkeypressed(a)=0
		setspriteflip(25,0,0)
	else
		setspriteflip(25,1,0)
	endif	
	marioflip=1
	if getspritex(25)<200 //screen moves
		// use while loop to be efficient
		screenmoves=1
		n=9
		while n<24
			n=n+1
			setspritex(n,getspritex(n)+20)
		endwhile
		//reset position of background
		if getspritex(10)=getvirtualwidth()
			setspritex(10,-1*getvirtualwidth())
		endif
		if getspritex(11)=getvirtualwidth()
			setspritex(11,-1*getvirtualwidth())
		endif
	else// player moves
		screenmoves=0
		setspritex(25,getspritex(25)-20)
	endif
endif

//jumping
if jumping=1
	jumpspeed=jumpspeed+3
	setspritey(25,getspritey(25)+jumpspeed)
	if 	getspritecollision(25,26)=1			//getspritey(25)>1200-getspriteheight(25)
		jumping=0
		setspritey(25,1200-getspriteheight(25))
	endif
endif
if getrawkeypressed(w)=1 and jumping=0
	jumping=1
	jumpspeed=-50
endif
return

gun:
//make it trace mario
if getrawkeystate(d)=1
	setspriteposition(28+fireballs,getspritex(25)+32,getspritey(25)-20)
endif
if getrawkeystate(a)=1
	setspriteposition(28+fireballs,getspritex(25)-70,getspritey(25)-20)
endif
//gun y position
setspritey(28+fireballs,getspritey(25)-20)


//make it change angle
if getspritex(28+fireballs)+98-getpointerx()>0
	setspriteflip(28+fireballs,0,1)
	setspriteangle(28+fireballs,-1*(180 + atan((getspritey(28+fireballs)+39-getpointery())/(getpointerx()-getspritex(28+fireballs)-98))))
else
	setspriteflip(28+fireballs,0,0)
	setspriteangle(28+fireballs,-1*(atan((getspritey(28+fireballs)+39-getpointery())/(getpointerx()-getspritex(28+fireballs)-98))))
endif

//make it shoot
shootdelay=shootdelay-1
if shootdelay<0
	shootdelay=0
endif
if shootdelay = 0 and getpointerstate()=1
	shooting = 1
	if water=0
		shootdelay=50
	else
		shootdelay=50
	endif
	//make it appear
	setspriteposition(20-water,getspritex(28+fireballs)+getspritewidth(28+fireballs)/2-getspritewidth(20-water)/2,getspritey(28+fireballs)+getspriteheight(28+fireballs)/2-getspriteheight(20-water)/2)
	//change the angle
	setspriteangle(20-water,getspriteangle(28+fireballs))
endif
//make bullet move
if shooting = 1
	setspriteposition(20-water,getspritex(20-water)+100*cos(getspriteangle(20-water)),getspritey(20-water)+100*sin(getspriteangle(20-water)))
endif
//make bullet stop if out of frame
if getspritecollision(3,20-water)=0
	shooting = 0
	setspritey(20-water,getvirtualheight())
endif
if getspritecollision(26,20-water)=1
	shooting=0
	setspritey(20-water,getvirtualheight())
endif
return

obstaclerandomizer:
//print(obstacle)
if levelcomplete=1
	wave=wave+1
	obstacle=random(1,3)
	levelcomplete=0
	if not wave=level
		if obstacle=1
			jumpinggoombas=1
			setspriteposition(14,getvirtualwidth(),getspritey(26)-getspriteheight(14))
			setspriteposition(15,getvirtualwidth()+150,getspritey(26)-getspriteheight(15))
			setspriteposition(16,getspritex(15)+150,getspritey(26)-getspriteheight(16))
			goombajumpheight1=25
			goombajumpheight2=25
			goombajumpheight3=25
		endif
		if obstacle=2
			fireballs=1
			setspriteposition(18,random(200,getvirtualwidth()+200),-1000)
			if getspritex(18)-getspritex(25)>0
				setspriteangle(18,-1*(90 + atan((getspritey(18)-getspritey(25))/(getspritex(25)-getspritex(18)))))
			else
				setspriteangle(18,90)
			endif
			setspriteposition(28,-500,0)
			setspriteposition(20,-500,0)
			water=3
		endif
		if obstacle=3 
			platforms=1
			setspriteposition(21,getvirtualwidth()+400,900)
			numberofplatforms=1
			respawnplatforms=1
			setspritecoloralpha(21,255)
			setspritecoloralpha(22,255)
			setspritecoloralpha(22,255)
			setspritecoloralpha(22,255)
			setspriteangle(21,0)
			setspriteangle(22,0)
			setspriteangle(23,0)
			setspriteangle(24,0)
		endif
	endif
endif
return

jumpinggoombas:
if jumpinggoombas=1
// goombas automatically move with background
		//make it jump 1
		setspritey(14,getspritey(14)-goombajumpheight1)	
		goombajumpheight1=goombajumpheight1-1
		if getspritey(14)+getspriteheight(14)>1200
			goombajumpheight1=25
		endif

		//check if shot or touched by lava
		if getspritecollision(14,20)+getspritecollision(14,12)+getspritecollision(14,13)>0
			setspriteposition(14,-5000,0)
			if getspritecollision(14,20)=1
				setspritey(20,getvirtualheight())
			endif
			goombadead=goombadead+1
		endif
		
		//make them naturally move left
		setspritex(14,getspritex(14)-3)
		
		//make it jump 2
		setspritey(15,getspritey(15)-goombajumpheight2)	
		goombajumpheight2=goombajumpheight2-1
		if getspritey(15)+getspriteheight(15)>1200
			goombajumpheight2=25
		endif

		//check if shot or touched by lava
		if getspritecollision(15,20)+getspritecollision(15,12)+getspritecollision(15,13)>0
			setspriteposition(15,-5000,0)
			if getspritecollision(15,20)=1
				setspritey(20,getvirtualheight())
			endif
			goombadead=goombadead+1
		endif
		
		//make them naturally move left
		setspritex(15,getspritex(15)-3)
		
		//make it jump 3
		setspritey(16,getspritey(16)-goombajumpheight3)	
		goombajumpheight3=goombajumpheight3-1
		if getspritey(16)+getspriteheight(16)>1200
			goombajumpheight3=25
		endif

		//check if shot or touched by lava
		if getspritecollision(16,20)+getspritecollision(16,12)+getspritecollision(16,13)>0
			setspriteposition(16,-5000,0)
			if getspritecollision(16,20)=1
				setspritey(20,getvirtualheight())
			endif
			goombadead=goombadead+1
		endif
		
		//make them naturally move left
		setspritex(16,getspritex(16)-3)

	//determine if level is over
	if goombadead=3
		levelcomplete=1
		goombadead=0
		jumpinggoombas=0
	endif
	//check to kill mario
	if getspritecollision(25,14)+getspritecollision(25,15)+getspritecollision(25,16)>0
		endscreen=1
		jumpinggoombas=0
	endif
endif
	
return


lavawall:
//move right effect
setspritex(12,getspritex(12)+4)
if getspritex(12)<50-getspritewidth(12)
	setspritex(12,50-getspritewidth(12))
endif

setspritex(13,getspritex(12))

//fall effect
setspritey(12,getspritey(12)+4)
setspritey(13,getspritey(13)+4)
if getspritey(12)>getvirtualheight()
	setspritey(12,-1*getvirtualheight()+10)
endif
if getspritey(13)>getvirtualheight()
	setspritey(13,-1*getvirtualheight()+10)
endif

//check to kill mario
if getspritecollision(25,12)+getspritecollision(25,13)>0
	endscreen=1
endif
return



fireball:  // these are actually missiles
		
if fireballs=1
	//make them fall
	if fireball<4
		setspritey(18,getspritey(18)+5)
		//block at ground
		if getspritey(18)>1020
			setspriteposition(19,getspritex(18)+100,getspritey(26)-100) //setting the explosion position 
			setspriteposition(18,random(200,getvirtualwidth()+200),-1000)
			if getspritex(18)-getspritex(25)-100>0
				setspriteangle(18,-1*(90 + atan((getspritey(18)-getspritey(25))/(getspritex(25)-getspritex(18)))))
			else
				setspriteangle(18,90) //setspriteangle(18,-1*(-90+ atan((getspritey(18)-getspritey(25))/(getspritex(25)-getspritex(18)))))
			endif
			fireball=fireball+1
			explosion=1
		endif
	else
		setspriteposition(18,-5000,-5000)
		if explosion=0
			fireballs=0
			fireball=0
			levelcomplete=1
			setspriteposition(29,-500,0)
			setspritex(17,-500)
			water=0
		endif
	endif
	if fireball=4
		setspriteposition(18,-5000,-5000)
	endif
		// set exclamation mark position and circle
	if getspritey(18)<0
		setspriteposition(30,getspritex(18),25)
		if getspritex(30)+200>getvirtualwidth()
			setspritex(30,getvirtualwidth()-200)
		endif
		setspriteposition(31,getspritex(30)-25,0)
	else
		setspriteposition(30,getvirtualwidth(),0)
		setspriteposition(31,getvirtualwidth(),0)
	endif

	if rocketidealangle<0
		rocketidealangle=rocketidealangle+360
	endif
	
	if getspriteangle(18)>rocketidealangle
		setspriteangle(18,getspriteangle(18)-3)
	else
		if not getspriteangle(18)=rocketidealangle
			setspriteangle(18,getspriteangle(18)+3)
		endif
	endif
	//make them change angle with a trailing effect based on mario
	if getspritecollision(18,3)=1
		if getspritex(18)-getspritex(25)>0
			rocketidealangle=-1*(90 + atan((getspritey(18)-getspritey(25))/(getspritex(25)-getspritex(18))))
		else
			rocketidealangle=-1*(-90+ atan((getspritey(18)-getspritey(25))/(getspritex(25)-getspritex(18))))
		endif
		//make them go to the direction they are facingdw
		setspriteposition(18,getspritex(18)-sin(getspriteangle(18)+180)*27,getspritey(18)+cos(getspriteangle(18)+180)*27)
	else
		setspriteposition(18,getspritex(18)+20*screenmoves,getspritey(18)+20)
	endif
	//make rocket explode when touched
	if getspritecollision(25,18)=1
		explosion=1
		setspriteposition(19,getspritex(25)+50,getspritey(25)+70)
		setspriteposition(18,-5000,0)
		//setspritesize(19,300,300)
		while getspritewidth(19)<250
			setspritesize(19,getspritewidth(19)+10,getspriteheight(19)+10)
			setspriteposition(19,getspritex(19)-5,getspritey(19)-5)
			sync()
		endwhile
	endif
	//water defuses missile
	if getspritecollision(17,18)=1
		setspriteposition(18,-5000,0)
		setspriteposition(17,-500,0)
	endif
	//expolsion animation
	if explosion=1
		if getspritewidth(19)<250
			setspritesize(19,getspritewidth(19)+10,getspriteheight(19)+10)
			setspriteposition(19,getspritex(19)-5,getspritey(19)-5)
		else
			if getspritecoloralpha(19)>30
				setspritecoloralpha(19,getspritecoloralpha(19)-20)
			else
				setspriteposition(19,-300,0)
				setspritesize(19,100,100)
				setspritecoloralpha(19,255)
				explosion=0
			endif
		endif
	endif
	// make explosion kill
	if getspritecollision(19,25)=1
		endscreen=1
	endif
endif
return


platforms:
if platforms =1
	//clear the ground
	if screenmoves=1 and getrawkeystate(d)=1
		setspritex(26,getspritex(26)-20)
		setspritex(27,getspritex(27)-20)
	else
		if screenmoves=1 and getrawkeystate(a)=1
			setspritex(26,getspritex(26)+20)
			setspritex(27,getspritex(26)+20)
		endif
	endif
	platform=20
	while platform<24
		platform=platform+1
		if getspritex(platform)<-1*getspritewidth(platform)
			if respawnplatforms=1
				while getspritey(platform)>1300 or getspritey(platform)<300 or getspritex(platform)<-1*getspritewidth(platform)
					if platform=21
						setspriteposition(platform,getspritex(24)+700,getspritey(24)+400-random(0,800))
					else
						setspriteposition(platform,getspritex(platform-1)+750,getspritey(platform-1)+400-random(0,800))
					endif
					setspritecoloralpha(platform,255)
				endwhile
				numberofplatforms=numberofplatforms+1
			endif
		else
			if getspritecollision(platform,25)=1
				//left side of platform 
				if getspritey(25)<getspritey(platform)+getspriteheight(platform) and getspritey(25)+getspriteheight(25)>getspritey(platform) and getspritex(25)+getspritewidth(25)-getspritex(platform)<20
					setspriteangle(platform,1) 
				else
					setspriteangle(platform,0)
					// top of platform
					if getspritey(25)+getspriteheight(25)-getspritey(platform)<70 and jumpspeed>-1
						setspritey(25,getspritey(platform)-getspriteheight(25)+1)
						jumping=0
						jumpspeed=-50
						if getrawkeystate(w)=1
							jumping=1
						endif
						//make cloud fade
						setspritecoloralpha(platform,getspritecoloralpha(platform)-15)
						if getspritecoloralpha(platform)<30
							setspritey(platform,-1*getspriteheight(platform))
						endif
					endif
					//bottom of platform
					if getspritey(25)-getspritey(platform)-getspriteheight(platform)<10 and getspritey(25)-getspritey(platform)-getspriteheight(platform)>-40
						jumpspeed=jumpspeed*-1
					endif		
				endif  
			else 
				setspriteangle(platform,0)
				if jumping=0
					jumpspeed=0
					jumping=1
				endif
			endif
		endif
	endwhile
	if getspriteangle(21)+getspriteangle(22)+getspriteangle(23)+getspriteangle(24)= 1 
		stationary=1
		if getrawkeypressed(a)=1
			setspritex(25,getspritex(25)-20)
			setspriteflip(25,1,0)
		endif
	else
		stationary=0
	endif
	//figure out if level is over
	if numberofplatforms>10
		setspritex(26,getvirtualwidth())
		setspritex(27,getvirtualwidth())
		// put the sprite on top of land away
		respawnplatforms=0
		setspritex(23,-500)
		numberofplatforms=0
	endif
	if respawnplatforms=0
		if getspritex(26)<1
			levelcomplete=1
			platforms=0
		endif
	endif
	// check for death
	if getspritey(25)>getvirtualheight()
		endscreen=1
	endif
endif
return


endscreen:
while endscreen=1
	print("")
	print("")
	print("")
	Print("				Gameover")
	setprintsize(150)
	setspritecolor(25,255,100,100,255)
	Print("			press S to play again")
	if getrawkeypressed(s)=1
		endscreen=0
		setspritecolor(25,255,255,255,255)
		settextposition(2,getvirtualwidth(),0)
		setspriteposition(26,0,1200)
		setspriteposition(27,0,1200)
		setspriteposition(10,getvirtualwidth(),0)
		setspriteposition(11,0,0)
		setspriteposition(25,400,1200-getspriteheight(25))
		setspriteposition(28,getspritex(25)+32,getspritey(25)-20)
		setspriteposition(12,50-getspritewidth(12),0)
		setspriteposition(13,50-getspritewidth(12),-1*getvirtualheight()+10)
		setspriteposition(14,getvirtualwidth(),getspritey(26)-getspriteheight(14)+2000)
		setspriteposition(15,getvirtualwidth()+150,getspritey(26)-getspriteheight(15)+2000)
		setspriteposition(16,getspritex(15)+150,getspritey(26)-getspriteheight(16)+2000)
		setspriteposition(30,getvirtualwidth(),0)
		setspriteposition(31,getvirtualwidth(),0)
		levelcomplete=0
		jumpinggoombas=1
		setspriteposition(18,getvirtualWidth(),5000)
		setspriteposition(19,-500,0)
		setspritecoloralpha(19,255)
		setspritesize(19,100,100)
		setspriteposition(29,-500,0)
		setspritex(17,-500)
		water=0
		fireballs=0
		fireball=0
		setspritex(21,-500)
		setspritex(22,-500)
		setspritex(23,-500)
		setspritex(24,-500)
		setprintsize(80)
		platforms=0
		wave=1
	endif
	sync()
endwhile
return


pausing:
if getrawkeypressed(p)=1
	pausegame=1
	while pausegame=1
		pauseframes=pauseframes+1
		Printc("Level : ")
		Print(wave)
		Print("")
		Print("")
		Print("")
		Print("							Press pause again to unpause")
		if pauseframes>4
			if getrawkeypressed(p)=1
				pausegame=0
				pauseframes=0
			endif
			Print("					     	 	Press esc to quit game")
			if getrawkeypressed(27)=1
				end
			endif
		endif
		sync()
	endwhile
endif
return


wins_score:
Printc("						   		   Level : ")
Print(wave)
if wave=level
	setspriteposition(32,getvirtualwidth(),getspritey(26)-getspriteheight(32))
	setspriteposition(20,5000,5000)
	setspriteposition(17,5000,5000)
	setspriteposition(28,5000,5000)
	setspriteposition(29,5000,5000)
	setspriteflip(25,0,0)
	setspritey(25,getspritey(26)-getspriteheight(25))
endif
while wave=level
	if getspritecollision(25,32)=1
		Print("")
		Print("")
		Print("")
		Print("						And They Lived Happily Ever After")
		Print("")
		Print("					   And Bowser never bothered them agian")
		Print("")
		Print("						 Press Enter to bother them again")
		if getrawkeypressed(13)=1
			wave=1
			jumpinggoombas=1
			setspriteposition(14,getvirtualwidth(),getspritey(26)-getspriteheight(14))
			setspriteposition(15,getvirtualwidth()+150,getspritey(26)-getspriteheight(15))
			setspriteposition(16,getspritex(15)+150,getspritey(26)-getspriteheight(16))
			goombajumpheight1=25
			goombajumpheight2=25
			goombajumpheight3=25
			levelcomplete=0
			setspritex(33,getvirtualwidth())
			cinematics=1
		endif
	else
		if getspritex(32)>1700
			setspritex(32,getspritex(32)-20)
		else
			setspritex(25,getspritex(25)+20)
		endif
		setspritex(12,getspritex(12)-20)
		setspritex(13,getspritex(13)-20)
	endif
	sync()
endwhile
return
