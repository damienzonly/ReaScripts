local track = reaper.GetSelectedTrack(0, 0)
if not track then return end

local is_new_value, filename, sectionID, cmdID, mode, resolution, val, contextstr = reaper.get_action_context()
local byte1, byte2 = contextstr:match("^midi:(%x%x):(%x%x)$")

if not byte1 or not byte2 then return end

local pan = reaper.GetMediaTrackInfo_Value(track, "D_PAN")
local increment = 0.01  -- Adjust this value as needed for sensitivity
local new_pan

if val > 0 then
    new_pan = math.min(pan + increment, 1)  -- Ensure pan does not exceed 1
elseif val < 0 then
    new_pan = math.max(pan - increment, -1)  -- Ensure pan does not go below -1
else
    return
end

reaper.SetMediaTrackInfo_Value(track, "D_PAN", new_pan)
