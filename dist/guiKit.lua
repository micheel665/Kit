-- GuiKit v1.0 unstable dist. API
-- Copyright AxTo Inc. Released under the MIT License.

-- Made for ComputerCraft 1.7.
-- Use this file in combination with the normal Kit!

-- How to include the API in your file (assuming that this file is called "guiKit"):
-- os.loadAPI("kit")
-- os.loadAPI("guiKit")
-- Now call a function from this file using:
-- guiKit.functionName()


-- Initialize API variables
function InitializeAPI()
	windowTable = {}
	nativeScreen = term.current()
end

-- Draw a rectangle (Window response).
-- Parameters: 
--  startX: The starting X pos of the square (number) (required).
--  startY: The starting Y pos of the square (number) (required).
--  width:  The width of the square (number) (required).
--  height: The height of the square (number) (required).
--  color: The color of the square or nil if you want an outlined square (number or nil) (required).
--  func: The function which will be executed upon pressing the rectangle (function or nil) (required).
--  windowObject: The parent window of the rectangle, when in doubt use getNativeScreen (window) (required).
--  exists: A Boolean which determines if the rectangle needs to be registered, not important for coders(boolean).
function drawRectangle(startX, startY, width, height, color, func, windowObject, exists)
   --[[
		TODO:
		1. change error parameters 
	]]--
   
   if startX == nil or startX == "" or startY == nil or startY == "" or width == nil or width == "" then
     error("Invalid arguments for drawRectangle()")
   end

   local windowRec = window.create(windowObject, startX, startY, width, height, true)
   windowRec.setBackgroundColor(color)
   windowRec.clear()
  
   if exists ~= true then
	 windowTable[#windowTable + 1] = {windowRec, {startX, startY, width, height, color, func}}
   end
  
   return windowRec
  
end

-- Print text to a rectangle (no response).
-- Parameters: 
--  x: The starting X pos of the text (number) (required).
--  y: The starting Y pos of the text (number) (required).
--  str: The string to be printed (string) (required). --need to check if nil could also work
--  windowObject: The parent window of the text, when in doubt use getNativeScreen (window) (required).
--  exists: A Boolean which determines if the rectangle needs to be registered, not important for coders (boolean).
function printTextToRectangle(x, y, str, windowObject ,exists)
	--[[
		TODO:
		1. add background color
		2. add text color
		3. change error parameters 
	]]--
   if x == "" or y == "" or str == "" or windowObject == "" then
      error("Invalid arguments for printTextToRectangle()")
   end

   term.redirect(windowTable[1][1])
   term.setCursorPos(x, y)
   term.write(str)
   
   term.redirect(term.native())
   term.setCursorPos(1,1)
   
   if exists ~= true then
      windowTable[getRectangleId(windowObject)][#windowTable[getRectangleId(windowObject)] + 1] = "text"
	  windowTable[getRectangleId(windowObject)][#windowTable[getRectangleId(windowObject)] + 1] = {x, y, str}
	  refreshScreen()
   end

end

-- Get a rectangle at x, y. Picks the one which is at the top (window response).
-- Parameters: 
--  x: The starting X pos of the rectangle (number) (required).
--  y: The starting Y pos of the rectangle (number) (required).
function getRectangleByPos(x, y)
   --[[
		Complete, for now
   ]]--

   for i, v in ipairs(windowTable) do
      if windowTable[i][2][1] <= x and windowTable[i][2][3] + windowTable[i][2][1] >= x and windowTable[i][2][2] <= y and windowTable[i][2][4] + windowTable[i][2][2] >= y then
         return windowTable[i][1]
	  else
		 error("could not find rectangle at ".. x .. " , " .. y)
	  end
   end
end

-- Get a rectangle's index in the windowTable (number response)
-- Parameters: 
--  rectangle: The windowObject you wish to find the id of (window) (required).
function getRectangleId(rectangle)
	--[[
		Complete, for now
	]]--
   for i, v in ipairs(windowTable) do
      if windowTable[i][1] == rectangle then
	     return i
	  end
   end
   error("no such rectangle")	
end

-- Stop drawing a rectangle.
function removeRectangle()
	--[[
		TODO:
		1. make the removeRectangle function
	]]--
end

-- The loop where the computer checks if a button was pressed (place in programs main loop, see wiki)
function buttonCheck()
    --[[
		Complete, for now
	]]--

   for i, v in ipairs(windowTable) do
	  local eventToCatch = "mouse_click"
	  local timeout = os.startTimer(1)
	  local e, arg1, x, y = os.pullEvent()
      if e == 'timer' and arg1 == timeout then
	  elseif e == 'mouse_click' and windowTable[i][2][6] ~= nil and windowTable[i][2][1] <= x and windowTable[i][2][3] + windowTable[i][2][1] >= x and windowTable[i][2][2] <= y and windowTable[i][2][4] + windowTable[i][2][2] >= y then
		local func = windowTable[i][2][6]
		func()
		
	  end
   end
end

-- Redraws the whole screen, do not use every single tick as it will flicker (no response)
function refreshScreen()
   --[[
		TODO:
		1. add a line function
   ]]--

   for i, v in ipairs(windowTable) do
      
      term.redirect(windowTable[i][1])
	  term.setBackgroundColor(windowTable[i][2][5])
	  term.clear()
	  
	  for i1, v1 in ipairs(windowTable[i]) do
		if windowTable[i][i1] == "text" then
		   printTextToRectangle(windowTable[i][i1 + 1][1], windowTable[i][i1 + 1][2], windowTable[i][i1 + 1][3], windowTable[i][1], true)
		elseif windowTable[i][i1] == "line" then
		
		end
	  end
   end
	term.redirect(term.native())
end

-- Get the table in which all the windows are stored (table response).
function getWindowTable()
	return windowTable
end

-- Get the native window object (window response)
function getNativeScreen()
	return nativeScreen
end

