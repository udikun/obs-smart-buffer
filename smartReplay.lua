local obs = obslua

function turnBackOn()
	obs.obs_frontend_replay_buffer_start()
end

function on_event(event)
	print(event)
	if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
		obs.obs_frontend_replay_buffer_stop()
		obs.timer_add(turnBackOn, 1)
	elseif event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_STARTED then
		obs.timer_remove(turnBackOn)
  end 
end

function script_load(settings)
  obs.obs_frontend_add_event_callback(on_event)
  obs.obs_frontend_replay_buffer_start()
end

