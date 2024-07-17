tell application "System Events"

	key down shift
    delay 0.001
    key up shift

    delay 0.001 -- 延迟以确保按键事件被处理

    -- 模拟按下Esc
	key code 53

end tell

