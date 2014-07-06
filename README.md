![Kit](http://assets.gingergaming.com/img/kit/logo.png)

Shorten your ComputerCraft lua code by using Kit! This library, or rather API, has all the functions you need to make your code shorter, better-looking and faster to make.

OpenKit has all the functions you need for programming with OpenPeripherials Addons, wich is a mod for ComputerCraft.

# Getting Started
Download and install the latest version of Kit manually [here](https://github.com/AxTo/Kit/releases/latest "Download Latest"), or use the Pastebin installs.
- Pastebin install: `pastebin get 8EmNXzQr install-kit`.
- OpenKit pastebin install: `pastebin get eqdNPkkb install-openkit`.
- GuiKit pastebin install: `pastebin get guJxNvsS install-guikit`

> __Heads Up:__ The current versions of Kit, OpenKit and GuiKit are unstable and can contain typo's, errors and bugs.

# Documentation

## Load the API
Load the library in your file with a single line of code: 
```lua
os.loadAPI("kit")
``` 
Use one of the many functions by doing: 
```lua
kit.functionName()
```
This also applies to OpenKit and GuiKit: 
```lua
os.loadAPI("openKit")
openKit.functionName()

os.loadAPI("guiKit")
guiKit.functionName()
```

## Kit Functions
Below is a list of all functions in the Kit, OpenKit  and GuiKit libraries. Click the function names for their documentation.
> __Heads Up:__ Un-clickable functions in the table of contents don't have any documentation yet.


### Table of Contents

| [Kit Functions](https://github.com/AxTo/Kit/blob/master/README.md#kit-functions) | Description | 
|-------| --- | --- |
| [version()](https://github.com/AxTo/Kit/blob/master/README.md#version)| Get version of your Kit installation.
| [isAdvanced()](https://github.com/AxTo/Kit/blob/master/README.md#isadvanced)| Check if PC is advanced.
| [wrapSides()](https://github.com/AxTo/Kit/blob/master/README.md#wrapsides)| Wrap all attatched peripherals.
| [load()](https://github.com/AxTo/Kit/blob/master/README.md#loadpath-isurl)| Load a file or web URL.
| [save()](https://github.com/AxTo/Kit/blob/master/README.md#savedata-path-method)| Save data to a file.
| [explode()](https://github.com/AxTo/Kit/blob/master/README.md#explodeseperator-string)| Explode a string by seperator.
| [keyPress()](https://github.com/AxTo/Kit/blob/master/README.md#keypresskey-exitonfalse)| Detect a key press.
| [random()](https://github.com/AxTo/Kit/blob/master/README.md#randomlength-digits-upper-lower)| Random string generator.
| [dump()](https://github.com/AxTo/Kit/blob/master/README.md#dumptable)| Dump the contents of a table.
| [scanAPI()](https://github.com/AxTo/Kit/blob/master/README.md#scanapiapi) | Scan an API for its functions.
| [help()](https://github.com/AxTo/Kit/blob/master/README.md#help) | Get help info for Kit.
| [clear()](https://github.com/AxTo/Kit/blob/master/README.md#clearscreen-pos1-pos2) | Clear a screen and set cursor position.
| [open()](https://github.com/AxTo/Kit#openside-range) | Open modem channels.
| [close()](https://github.com/AxTo/Kit#closeside-range) | Close modem channels.
| [receive()](https://github.com/AxTo/Kit#receivetimeout) | Listen for modem messages on open channels.
__[OpenKit Functions](https://github.com/AxTo/Kit/blob/master/README.md#openkit-functions)__ | __Description__
[getPosition()](https://github.com/AxTo/Kit/blob/master/README.md#getpositionplayer-side)| Get current position of a player relative to the sensor.
|checkPosition() |
__GuiKit Functions__ | __Description__
|drawRectangle() |
| button()

----------

### version()

| cc  x.x > | Returns current Kit version.|
| --------- | ------------------------------------------ |
|Responses: | Data response.					         |
|Parameters:| None.										 |
|Example:   | `print( kit.version() )`		     		 |
|Result:    | The version of your installed Kit copy (eg: `1.1.0`).  |

----------

### isAdvanced()

| cc  1.45 > | Checks if computer is an advanced computer.|
| --------- | ------------------------------------------ |
|Responses: | Boolean (true or false).					 |
|Parameters:| None.										 |
|Example:   | `print( kit.isAdvanced() )`				 |
|Result:    | `true` or `false`							 |

----------

### wrapSides()

|  cc 1.5.1 >  | Checks all sides for peripherals and wraps them. |
|------------|--------------------------------------------------|
|Responses:  | Number of wrapped peripherals. *returns false if an error occurs.*|
|Parameters: | None. 											|
|Example:    | `result = kit.wrapSides() print(result)`			|
|Result:     | If we've got a printer and a monitor: `2`		|
> __Heads Up:__ The result in numbers, is actually a string, do `tonumber(result)` to convert it to raw numbers again.

----------

### load(path, isurl)

|  cc 1.4 >  | Load a file or webpage. |
|------------|--------------------------------------------------|
|Responses:  | Fetched data response. *returns false if an error occurs.* |
|Parameters: | _path_: the path to the file including the file name (required). |
|            | _isurl_: Use `true` if _path_ is an URL (optional). |
|Example:    | `result = kit.load("hello.txt") print(result)`|
|Result:	 | Contents of `hello.txt`.									|

----------

### save(data, path, method)

|  cc 1.0 >  | Save data to a file. |
|------------|--------------------------------------------------|
|Responses:  | Boolean (true or false). |
|Parameters: | _data_: the text/code/table you want to save (required). |
|            | _path_: the path to the file including the filename (required).|
|            | _method_: `w` to open it for writing and remove any existing data on file open. Or `a` to open for writing but keep existing data and append any writes to the end of the file.
|Example:    | `result = kit.save("Hello World!", "hello.txt", "a") print(result)` |
|Result:	 | `true` if the operation succeeded, or `false` if something went wrong. |

----------

### explode(seperator, string)

|  cc 1.0 >  | Explode a string by seperator. |
|------------|--------------------------------------------------|
|Responses:  | Table response. *returns false if an error occurs.* |
|Parameters: | _seperator_: explode at the given character (required). |
|            | _string_: data to explode (required). |
|Example:    | `result = kit.explode("#", "one#two#three#four")` |
|Result:	 | Table: `result{ [1]=>"one", [2]=>"two", [3]=>"three", [4]=>"four" }` |

----------

### keyPress(key, exitonfalse)

|  cc 1.0 >  | Wait for a keypress. |
|------------|--------------------------------------------------|
|Responses:  | Boolean (true or false) |
|Parameters: | _key_: the keypress we should wait for (optional). |
|            | _exitonfalse_: should the function return false if a keypress is not `key`? (optional). |
|Example 1:  | `result = kit.keyPress("Q") print(result)` |
|Result:	 | If the key Q is pressed: `true`, if not the function will keep waiting. |
|Example 2:  | `result = kit.keyPress("X", true) print(result)` |
|Result:     | If the key X is pressed: `true`, if not: `false`.|
> __Heads Up:__ for a list of keyboard keys (including Enter, Space, etc) see [the CC wiki](http://computercraft.info/wiki/File:CC-Keyboard-Charcodes.png "Go to the ComputerCraft wiki"), or if the wiki is being DDOS'ed again [this image](http://i.imgur.com/iFRtlWL.png).

----------

### random(length, digits, upper, lower)

|  cc 1.1 >  | Generate a random hash |
|------------|--------------------------------------------------|
|Responses:  | Data response *returns false if an error occurs.* |
|Parameters: | _length_: the length of the random hash (required) (max. is 20). |
|            | _digits_: use digits? (boolean) (optional). |
|            | _upper_: use uppercase letters? (boolean) (optional). |
|            | _lower_: use lowercase letters? (boolean) (optional). |
|Example 1:  | `result = kit.random(10, true) print(result)` |
|Result:	 | Example: `7381839149` |
|Example 2:  | `result = kit.random(12, true, true, true) print(result)` |
|Result:     | Example: `D9NqLaN1hkkHEU` |
> __Heads Up:__ the random function uses the HTTP API, make sure to enable it in your CC Config.

----------

### dump(table)

|  cc 1.0 >  | Dump a table. |
|------------|--------------------------------------------------|
|Responses:  | Data response *returns false if an error occurs.* |
|Parameters: | _table_: the table to dump (required). |
|Example 1:  | `result = kit.dump(myTable) print(result)` |
|Result:     | Example: `[1]: "one", [2]: "two", [3]: "three",` |
> __Heads Up:__ this function is mainly used for debugging purposes, to unserialize a table, use `textutils.serialize(myTable)`.

----------

### scanAPI(api)

|  cc 1.0 >  | Output all functions of given API. |
|------------|--------------------------------------------------|
|Responses:  | Table response *returns false if an error occurs.* |
|Parameters: | _api_: the library/api to scan (required). |
|Example:  | `result = kit.scanAPI(myAPI) print( kit.dump(result) )` |
|Result:     | Example: `[1]: "myFunction", [2]: "secondFunction", [3]: "anotherFunction",` |

----------

### help()
| cc 1.0 > | Outputs functions of Kit and a link to the docs.|
|-----|-----|
| Responses: | Data response.|
| Parameters: | none|
Example 1: | `print( kit.help() )`|
Result: | Welcome to Kit! Visit http://git.io/kitdocs for the documentation. Here's a list of all the functions you can use: ...|


----------

### clear(screen, pos1, pos2)
| cc x.x > | Clears your screen and sets cursor position.
|----|----|
|Responses: | Boolean (true or false)|
| Parameters: | _screen_: the screen you want to clear (required).|
| | _pos1_ and _pos2_: x and y values of where you want the pointer to be after the screen has been reset (optional).|
|Example 1:| `kit.clear(term)`|
|Result 1: | The terminal screen gets reset and the pointer to x=1 and y=1.
|Example 2:| (Assuming that there's a monitor wrapped to `monitor`) `kit.clear(monitor, 1, 5)`|
|Result 2:| The monitor screen gets reset and the pointer to x=1 and y=5.|
> __Heads Up:__ You can't use quotes in the clear function: So `kit.clear("term")` is wrong, but `kit.clear(term)` is correct.

----------

### open(side, range)
| cc x.x > | Opens given modem channels. |
| --- | --- |
|Responses: | Boolean (true or false) |
|Parameters: | _side_: the side where your modem is attached.|
| | _range_: the range of channels you want to open, separated by a `-`.|
|Example 1: | `kit.open("back", "1-10")` |
|Result 1: | The channels 1 to 10 have been opened.|
|Example 2: | `kit.open("top", "40")` or `kit.open("top", 40)` |
| Result 2: | The channel 40 has been opened. |
> __Heads Up:__ The maximum open channels allowed is 128 per computer. When trying to open more, your program will throw an error.

----------

### close(side, range)

Exactly the same as above; `kit.open(side, range)`. Difference is that `kit.close()` (obviously) closes channels instead of opening them.

----------

### receive(timeout)
| cc x.x > | Listen to opened ports for modem messages. |
| --- | --- |
| Responses: | Table data or boolean false if timed out. |
| Parameters: | _timeout_: in seconds, how long we should wait for a message until exiting the function (optional). _If not defined, the function will wait forever._
| Example 1: | `result = kit.receive() print( kit.dump(result) )`
| Result 1: | Example, If a message was intercepted on the opened channels: `{ message = "Hello World!", modem = "back", channel = 40, distance = 2.714829, replyChannel = 666, }`
| Example 2: | `result = kit.receive(5)`|
| Result 2: | If no message was intercepted after 5 seconds: `false`, else see result 1.
----------

## OpenKit Functions

### getPosition(player, side) / getPos()

|  openP 0.x >  | Gets current position of given player relative to the sensor. |
|------------|--------------------------------------------------|
|Responses:  | Table response. *returns false if an error occurs.* |
|Parameters: | _player_: the username of the player you want it's current position from (required). |
|            | _side_: the side of the PC where your sensor is located (required). |
|Example:    | `result = openKit.getPosition("alex", "right")` |
|Result:	 | Table: `result{ ["x"]=>"3", ["y"]=>"0", ["z"]=>"2" }` |
> __Heads Up:__ Make sure that the specified player is within the range of the sensor.

----------

### checkPosition() / checkPos()

----------

## GuiKit Functions

### drawRectangle()

----------

### button()

----------

*Have any questions/suggestions about the documentation, or do you have a function that __needs__ to be in Kit? Just [open an Issue](https://github.com/AxTo/Kit/issues/new "Open Issue Now"), or [do a Pull Request](https://github.com/AxTo/Kit/compare/ "Do a Pull Request Now").*

----------

# Copyright & License
Code and documentation copyright 2014 AxTo Inc. Code released under [the MIT license](https://github.com/AxTo/Kit/blob/master/LICENSE "The MIT License.").
