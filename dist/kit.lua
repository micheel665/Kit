  -- Kit v1.3.0 unstable dist. API
  -- Copyright AxTo Inc. Released under the MIT License.
  
  -- Made for ComputerCraft 1.7 and above.
  
  -- How to include the API in your file (assuming that this file is called "kit"):
  -- os.loadAPI("kit")
  -- Now call a function from this file using:
  -- kit.functionName()
  
  -- Returns Kit version (data response).
  function version(getLatest)
    if getLatest then
      return load("https://raw.githubusercontent.com/AxTo/Kit/master/version", true)
    else
      return "1.3.0"
    end
  end
  
  -- Chceks if computer is an advanced computer (boolean response).
  function isAdvanced()
    if term.isColor() == false then
      return false
    else
      return true
    end
  end
  
  -- Checks all sides for peripherals and wraps them (number of wrapped sides response).
  function wrapSides()
    local peripherals = peripheral.getNames()
    local peripheralTable = {}
    for i = 1, #peripherals do
      pripheralTable[i] = peripheral.wrap(peripherals[i])
      return pripheralTable
    end
    return peripheralTable
  end
  
  -- Load a file or webpage (fetched data respponse).
  -- Parameters:
  --  path: the path to the file including the file name (required).
  --  isurl: if path is an URL. Use 'true' if path is an URL (optional).
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
  
  -- Save data to file (boolean response).
  -- Parameters:
  --  data: the text/code you want to save (required).
  --  path: the path to the file including the file name (required).
  --  method: (required)
  --    "w" to open it for writing and remove any existing data on file open.
  --    "a" to open for writing but keep existing data and append any writes to the end of the file.
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
  
  -- Explode a string by separator (table response).
  -- Parameters:
  --  separator: explode at this character (required).
  --  string: data to explode (required).
  function explode(separator, string)
    if separator == "" or separator == nil or string == "" or string == nil then
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
  
  -- Implode a table with given separator (string response).
  -- Parameters:
  --  separator: implode with this character (required).
  --  table: table to implode (required).
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

  -- Wait for a keypress (boolean response).
  -- If key is not defined, every key triggers the action.
  -- Parameters:
  --  key: the keypress we should wait for (optional).
  --  exitonfalse: should the function return false if a keypress is not `key`? (optional).
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
  
  -- Generate a random hash (data response).
  -- Parameters:
  --  length: the length of the random hash (required).
  --  digits: use digits? (boolean) (optional).
  --  upper: use uppercase letters? (boolean) (optional).
  --  lower: use lowercase letters? (boolean) (optional).
  function random(length, digits, upper, lower)
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
  
  -- Dump a Table (data response).
  -- Parameters:
  --  table: the table to dump (required).
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
  
  -- Output all functions of given API.
  -- Parameters:
  --  api: the library/api to scan (required).
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
  
  -- Output all the functions of Kit.
  function help()
    result = kit.scanAPI(kit)
    result = kit.dump(result)
    term.setCursorPos(1,1)
    term.clear()
    return "Welcome to Kit!\nVisit git.io/kitdocs for the documentation.\n\nHere's a list of all the functions you can use:\n"..result
  end
  
  -- Clear your screen and sets your cursor position (boolean response).
  -- Parameters: 
  --  screen: what screen you want to clear (required).
  --  pos1, pos2: place you want your cursor to be at after the screen clears (optional).
  function clear(screen, pos1, pos2)
    if screen == nil or screen == "" then
      error("Invalid arguments for clear()", 2)
    end
    if pos1 == nil or pos1 == "" and pos2 == nil or pos2 == "" then
      pos1 = 1
      pos2 = 1
    end
    screen.clear()
    screen.setCursorPos(pos1, pos2)
    return true
  end
  
  -- Open a single or multiple modem ports (boolean response).
  -- Parameters:
  --  side: the side where your (wireless) modem is.
  --  range: the range of ports we should open (max. is a total of 128), separated by a '-'.
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
  
  -- Close a single or multiple modem ports (boolean response).
  -- Parameters:
  --  side: the side where your (wireless) modem is.
  --  range: the range of ports we should close (max. is a total of 128), separated by a '-'.
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
  
  -- Listen to opened port(s) (table response).
  -- Parameters:
  --  time: listen x seconds until breaking (optional).
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
