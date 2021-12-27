package org.springframework.ntfh.cardlogic.abilitycard.rogue;

import org.springframework.ntfh.command.GetGoldCommand;
import org.springframework.ntfh.entity.player.Player;

public class SaqueoOro {
    public void execute(Player playerFrom){
        Integer nEnemies = 0;
        //TODO enemies on table
        new GetGoldCommand(nEnemies*2, playerFrom).execute();
    }
}
