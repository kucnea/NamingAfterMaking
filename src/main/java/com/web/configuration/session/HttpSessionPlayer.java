package com.web.configuration.session;

import org.springframework.stereotype.Component;

import com.web.entity.player.Player;


@Component
public class HttpSessionPlayer extends AbstractHttpSession<Player> {

	@Override
	protected String name() {
		return "SESSION_PLAYER";
	}

}
