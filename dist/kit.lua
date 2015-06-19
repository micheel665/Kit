--[[
    Kit version 1.3.0
    Copyright AxTo Inc.
    Released under the MIT License
    http://git.io/kitdocs

    Made for ComputerCraft 1.7 and above.

    How to include the API in your file (assuming that this file is called "kit"):
    os.loadAPI("kit")
    Call a function from this file using:
    kit.functionName()
]]--

  --[[
      Get local or latest Kit version.
      
      @returns string
  ]]--
  function version(getLatest)
    if getLatest then
      return load("https://raw.githubusercontent.com/AxTo/Kit/master/version", true)
    else
      return "1.3.0"
    end
  end

  --[[
      Check if the computer is advanced or not.
      
      @returns boolean
  ]]--
  function isAdvanced()
    if term.isColor() == false then
      return false
    else
      return true
    end
  end

  --[[
      Wrap all attatched peripherals on the computer.
      
      @returns table
  ]]--
  function wrapSides()
    local peripherals = peripheral.getNames()
    local peripheralTable = {}
    for i = 1, #peripherals do
      pripheralTable[i] = peripheral.wrap(peripherals[i])
      return pripheralTable
    end
    return peripheralTable
  end

  --[[
      Load a local file or remote web page.
      
      @param string path The path to the file including the file name (required)
      @param boolean isurl If path is an URL. Use 'true' if path is an URL (optional)
      @returns string / boolean Returns string with data or false on error.
  ]]--
  function load(path, isurl)
    if path == "" or path == nil then
      error("Invalid arguments for load()", 2)
    end
    if isurl == true then
      local file = http.get(path)
      if file == nil or file == false then
        error("Loading webpage failed.")
      end
      local data = file.readAll()
      return data
    else
      if fs.exists(path) then
        local file = fs.open(path, "r")
        local data = file.readAll()
        file.close()
        return data
      else
        return false
      end
    end
  end
  
  --[[
      Save given data to local file.
      
      @param string data The text or code you want to save (required)
      @param string path The path to save the file to (required)
      @param string method The method to use when opening the file, use:
      "w" to open the file for writing and remove any existing data on file open or;
      "a" to open for writing but keep existing data and append any writes to the end of the file.
      @returns boolean
  ]]--
  function save(data, path, method)
    if data == "" or data == nil or path == "" or path == nil or method == "" or method == nil then
      error("Invalid arguments for save()", 2)
    end
    if method == "w" or method == "a" then
      local file = fs.open(path, method)
      file.write(data)
      file.close()
      return true
    else
      return false
    end
  end

  --[[
      Explode a string by given separator.
      
      @param string separator The character to explode at (required)
      @param string string The data to explode (required)
      @returns table
  ]]--
  function explode(separator, string)
    if type(separator) ~= "string" or separator == "" or type(string) ~= "string" or string == "" then
      error("Invalid arguments for explode()", 2)
    else
      table = {}
      i = 1
      inputstring = string
      for str in string.gmatch(inputstring, "([^"..separator.."]+)") do
        table[i] = str
        i = i + 1
      end
      return table
    end
  end

  --[[
      Implode a table with given separator.
      
      @param string separator The character to implode at (required)
      @param table table The table to implode (required)
      @returns string
  ]]--
  function implode(separator, table)
    if type(table) ~= "table" or type(separator) ~= "string" or separator == "" then
      error("Invalid argument(s) for implode()", 2)
    else
      result = ""
      for i = 1, #table do
        result = result .. separator .. table[i]
      end
      return result
    end
  end

  --[[
      Wait for a key press.
      
      @param string key The key to wait for to be pressed (optional)
      @param boolean exitonfalse Should the function return false if a keypress is not 'key'? (optional)
      @returns boolean
  ]]--
  function keyPress(key, exitonfalse)
    if key == "" or key == nil or string.len(key) > 1 then
      key = "any"
    else
      key = string.lower(key)
    end
    while true do
      evt, char = os.pullEvent("char")
      if key == "any" then
        return true
      else
        char = string.lower(char)
        if char == key then
          return true
        elseif exitonfalse == true then
          return false
        end
      end
    end
  end

  --[[
      Generate a random hash using a remote API.
      
      @param integer length The length of the random hash (required)
      @param boolean digits Use digits in the hash? (optional)
      @param boolean upper Use uppercase letters in the hash? (optional)
      @param boolean lower Use lowercase letters in the hash? (optional)
      @returns boolean/string Returns random generated hash or false on error.
  ]]--
  function remoteRandom(length, digits, upper, lower)
    if length == nil or length == "" then
      error("Invalid arguments for random()", 2)
    end
    if digits == true then
      digits = "on"
    else
      digits = "off"
    end
    if upper == true then
      upper = "on"
    else
      upper = "off"
    end
    if lower == true then
      lower = "on"
    else
      lower = "off"
    end
    hash = load("http://www.random.org/strings/?num=1&format=plain&len="..length.."&digits="..digits.."&upperalpha="..upper.."&loweralpha="..lower.."", true)
    return hash
  end
  
  --[[
      Generate a random hash using a remote API.
      @deprecated since 2.0.0 Use function remoteRandom() instead.
      @see remoteRandom()
  ]]--
  function random(length, digits, upper, lower)
    return remoteRandom(length, digits, upper, lower)
  end

  --[[
      Make a table readable for debugging purposes.
      
      @param table table The table to dump (required)
      @returns string
  ]]--
  function dump(table)
    if table == nil or table == "" or type(table) ~= "table" then
      error("Invalid arguments for dump()", 2)
    end
    result = ""
    for key, value in pairs(table) do
      result = result.."["..tostring(key).."]: \""..tostring(value).."\"\n"
    end
    return result
  end

  --[[
      Get all the functions of the given API.
      
      @param table api The API to scan.
      @returns string
  ]]--
  function scanAPI(api)
    if api == nil or api == "" or type(api) ~= "table" then
      error("Invalid arguments for scanAPI()", 2)
    end
    i = 1
    result = {}
    for fname, obj in pairs(api) do
      if type(obj) == "function" then
        result[i] = fname
        i = i + 1
      end
    end
    return result
  end

  --[[
      Display some information of Kit.
      
      @returns string
  ]]--
  function help()
    result = kit.scanAPI(kit)
    result = kit.dump(result)
    term.setCursorPos(1,1)
    term.clear()
    return "Welcome to Kit!\nVisit git.io/kitdocs for the documentation.\n\nHere's a list of all the functions you can use:\n"..result
  end

  --[[
      Clear the given screen and set the cursor position.
      
      @param table screen The screen to clear (required)
      @param integer pos1 Set the X position of the cursor (optional)
      @param integer pos2 Set the Y position of the cursor (optional)
      @returns boolean
  ]]--
  function clear(screen, pos1, pos2)
    if type(screen) ~= "table" then
        error("Invalid argument for clear()", 2)
    end
    if pos1 == nil or pos1 == "" and pos2 == nil or pos2 == "" then
      pos1 = 1
      pos2 = 1
    end
    screen.clear()
    screen.setCursorPos(pos1, pos2)
    return true
  end

  --[[
      Open modem port(s).
      
      @param string side The side where your wireless or wired modem is located (required)
      @param string range The range of ports to open (max 128), separated by '-' (required)
      @returns boolean
  ]]--
  function open(side, range)
    if side == nil or side == "" or range == nil or range == "" then
      error("Invalid arguments for open()", 2)
    end
    if string.find(range, "-") then
      rangeTable = kit.explode("-", range)
      for i = rangeTable[1], rangeTable[2] do
        peripheral.call(side, "open", i)
      end
    else
      if type(range) == "string" then
        range = tonumber(range)
      end
      peripheral.call(side, "open", range)
    end
    return true
  end

  --[[
      Close modem port(s).
      
      @param string side The side where your wireless or wired modem is located (required)
      @param string range The range of ports to close (max 128), separated by '-' (required)
      @returns boolean
  ]]--
  function close(side, range)
    if side == nil or side == "" or range == nil or range == "" then
      error("Invalid arguments for close()", 2)
    end
    if string.find(range, "-") then
      rangeTable = kit.explode("-", range)
      for i = rangeTable[1], rangeTable[2] do
        peripheral.call(side, "close", i)
      end
    else
      if type(range) == "string" then
        range = tonumber(range)
      end
      peripheral.call(side, "close", range)
    end
    return true
  end

  --[[
      Listen to opened port(s).
      
      @param integer timeout The amount of seconds to wait until breaking (optional)
      @returns boolean/table Formatted received message or false on error.
  ]]--
  function receive(timeout)
    if timeout == nil or timeout == "" then
    else
      timer = os.startTimer(timeout)
    end
    event, modemSideorTimerID, usedChannel, replyChannel, rawMessage, senderDistance = os.pullEvent()
    if event == "modem_message" then
      result = {
        channel = usedChannel,
        replyChannel = replyChannel,
        message = rawMessage,
        distance = senderDistance,
        modem = modemSideorTimerID
      }
      return result
    elseif event == "timer" and modemSideorTimerID == timer then
      return false
    end
  end
