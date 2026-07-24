local M = {}

local function escape_command(command)
    return command:gsub("'", "'\\''")
end

function M.app_cmd(command)
    local escaped = escape_command(command)
    return "sh -lc 'if command -v uwsm >/dev/null 2>&1; then uwsm app -- " .. escaped .. " || exec " .. escaped .. "; else exec " .. escaped .. "; fi'"
end

function M.autostart_cmd(command)
    local escaped = escape_command(command)
    return "sh -lc 'if command -v uwsm >/dev/null 2>&1 && uwsm check is-active >/dev/null 2>&1; then exit 0; fi; exec " .. escaped .. "'"
end

return M
