package org.springframework.ntfh.cardlogic.abilitycard.market;

import org.springframework.ntfh.command.DrawCommand;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;


@Component
public class ElixirDeConcentracion {
    public void execute(Player playerFrom){
        new DrawCommand(3, playerFrom).execute();
    }
}
