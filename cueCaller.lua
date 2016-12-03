ardour {
	["type"]    = "session",
	name        = "cueCaller",
	license     = "MIT",
	author      = "Adapted from Marker stop of Ardour Lua Task Force",
	description = [[An example of track comment change following playhead position.]]
}

function factory ()
	return function (n_samples)
		if (not Session:transport_rolling ()) then
			-- not rolling, nothing to do.
			return
		end
		local pos = Session:transport_frame () -- current playhead position
    -- assuming two tracks called "foh" and "video"
    foh = Session:route_by_name("foh")
    video = Session:route_by_name("video")
    if(pos > 100000) then foh:set_comment ("foo", nil) end
    if(pos > 130000) then video:set_comment ("moe", nil) end
    if(pos > 150000) then foh:set_comment ("bar", nil) end
    if(pos > 190000) then foh:set_comment ("curly", nil) end
    if(pos > 220000) then foh:set_comment ("Fade Out", nil) end
  end
end

