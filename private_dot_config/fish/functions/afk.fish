# Start the screensaver on macOS.
function afk -d "Start screensaver"
	if test (uname) = Darwin
		open -a "/System/Library/CoreServices/ScreenSaverEngine.app"
		return
	end

	echo "Don't know how to start screensaver"
end
