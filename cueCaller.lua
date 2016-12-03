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
    
    if(pos > 100000) then
      Session:route_by_name("foh_audio"):set_comment ("foo", nil)
    end
    --end
  end
end

