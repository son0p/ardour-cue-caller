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

    -- assuming some tracks
    foh = Session:route_by_name("foh")
    video = Session:route_by_name("video")

    -- comments on foh track
    if foh:isnil() then
      print ("no track named foh found")
    else
      if(pos > 240000) then foh:set_comment ("foo", nil) end
      if(pos > 400000) then foh:set_comment ("bar", nil) end
    end
    -- comments of video track
    if video:isnil() then
      print ("no track named video found")
    else
      if(pos > 300000) then video:set_comment ("curly", nil) end
      if(pos > 480000) then video:set_comment ("moe", nil) end
    end
  end
end

