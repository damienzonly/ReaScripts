local _, _, _, _, _, _, val = reaper.get_action_context()
tracksn = reaper.CountSelectedTracks(0)
for i = 0, tracksn-1 do
    track = reaper.GetSelectedTrack(0,i)
    local vol = reaper.GetMediaTrackInfo_Value(track, "D_VOL")
    local factor = 10 ^ (0.5 / 20)
    local new_vol
    if val > 0 then
        new_vol = vol * factor
    elseif val < 0 then
        new_vol = vol / factor
    else
        return
    end
    reaper.SetMediaTrackInfo_Value(track, "D_VOL", new_vol)
end
