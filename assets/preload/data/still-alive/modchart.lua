

local firstY = 0
local secondY = 0
local thirdY = 0
local fourthY = 0
local firstX = 0
local secondX = 0
local thirdX = 0
local fourthX = 0
local kait1 = 2
local kait2 = 2
local kait3 = 2
local kait4 = 2
local pr3zt = 0.78
-- this gets called starts when the level loads.
function start(song) -- arguments, the song name

	tweenFadeOut('dad', 0, 0.01)
	tweenFadeOut('boyfriend', 0, 0.01)
	tweenFadeOut('girlfriend', 0, 0.01)
	showOnlyStrums = true
	for i = 0, 7 do
		tweenFadeIn(i,0,0.01)
    end
	actorScale = 1
end

-- this gets called every frame
function update(elapsed) -- arguments, how long it took to complete a frame
	if (zoom) then
		
		setActorX(kait1 + -30 * math.sin((songPos / 1000) * 2 * math.pi), 4)
		setActorX(kait2 + -30 * math.sin((songPos / 1000) * 2 * math.pi), 5)
		setActorX(kait3 + -30 * math.sin((songPos / 1000) * 2 * math.pi), 6)
		setActorX(kait4 + -30 * math.sin((songPos / 1000) * 2 * math.pi), 7)
		
	end
	
	if (pulse) then
		if (actorScale > 1) then
			actorScale = actorScale - elapsed
		end
		for i=4,7 do
			setActorScale(actorScale, i)
		end
	end
	
	
	
end
-- this gets called every beat
function beatHit(beat) -- arguments, the current beat of the song	

	if (pulse and beat >= 74 and beat <= 217 and beat % 2 == 1) then
		actorScale = 1.15
		for i=4,7 do
			setActorScale(0.85, i)
		end
	end
	
	if (pulse and beat >= 218 and beat <= 348 and beat % 2 == 0) then
		actorScale = 1.15
		for i=4,7 do
			setActorScale(0.85, i)
		end
	end
	
	if curBeat == 12 then
		for i = 4, 7 do
			tweenFadeIn(i, 1, 0.5)
		end
		tweenFadeIn('boyfriend', 1, 0.5)
		
	end
	
	if curBeat == 74 then
		pulse = true
	end

	if curBeat == 101 then
		zoom = true
	
	end
	
	if curBeat == 217 then
		zoom = false
		pulse = false
		setActorX(firstX + 140, 4)
		setActorX(secondX + 140, 5)
		setActorX(thirdX + 140, 6)
		setActorX(fourthX + 140, 7)
	end
	
	if curBeat == 248 then
		zoom = true
		pulse = true
	end
	
	if curBeat == 348 then
		zoom = false
		pulse = false
		setActorX(firstX + 140, 4)
		setActorX(secondX + 140, 5)
		setActorX(thirdX + 140, 6)
		setActorX(fourthX + 140, 7)
	end

	if curBeat == 350 then
		for i = 4, 7 do
			tweenFadeOut(i, 1, 0.5)
		end
		tweenFadeOut('boyfriend', 1, 0.5)	
	end
	
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)
		
	


	if curStep == 1 then
		showOnlyStrums = true
		for i = 0, 7 do
			tweenFadeOut(i, 0, 0.01)
		end
		firstY = getActorY(4)
		secondY = getActorY(5)
		thirdY = getActorY(6)
		fourthY = getActorY(7)
		firstX = getActorX(4)
		secondX = getActorX(5)
		thirdX = getActorX(6)
		fourthX = getActorX(7)
	end
	
	if curStep == 10 then
		
		setActorY(firstY + 340, 4)
		setActorY(secondY + 340, 5)
		setActorY(thirdY + 340, 6)
		setActorY(fourthY + 340, 7)
		setActorX(firstX + 140, 4)
		setActorX(secondX + 140, 5)
		setActorX(thirdX + 140, 6)
		setActorX(fourthX + 140, 7)
		setHudZoom(0.7)
    end

	if curStep == 11 then
	
		kait1 = getActorX(4)
		kait2 = getActorX(5)
		kait3 = getActorX(6)
		kait4 = getActorX(7)
	
	end
	
end