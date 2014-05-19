-- OpenKit v1.0 unstable dist. API
-- Copyright AxTo Inc. Released under the MIT License.

-- Made for ComputerCraft 1.6 and OpenPeripherials Addons.
-- Use this file in combination with the normal Kit!

-- How to include the API in your file (assuming that this file is called "openKit"):
-- os.loadAPI("kit")
-- os.loadAPI("openKit")
-- Now call a function from this file using:
-- openKit.functionName()

-- Gets current position of given player using OpenPeripherals (table response).
-- Parameters:
--  player: the username of the player you want it's current position from (required).
--  side: the side of your sensor (required).
function getPosition(player, side)
  if player == nil or player == "" or side == nil or side == "" then
    return false
  end
  p = peripheral.wrap(side)
  pos = {}
  pos["x"] = p.getPlayerData(player).position.x
  pos["y"] = p.getPlayerData(player).position.y
  pos["z"] = p.getPlayerData(player).position.z
  return pos
end

-- Checks if the x, u and z values are greater or less than the values in dimensions (boolean response).
-- Parameters: 
--  pos: The x, y and z you are checking for.
--  dimensions: The x, y and z values of the "box" you are checking for.
function checkPos(pos, dimensions)
  if pos["x"] > dimensions["-x"] and pos["x"] < dimensions["+x"] and pos["y"] > dimensions["-y"] and      pos["y"] < dimensions["+y"] and pos["z"] > dimensions["-z"] and pos["z"] < dimensions["+z"] then
    return true
  else
    return false
  end
end
