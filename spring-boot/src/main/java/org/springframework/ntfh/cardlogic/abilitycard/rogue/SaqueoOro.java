package org.springframework.ntfh.cardlogic.abilitycard.rogue;

import java.util.List;

import org.springframework.ntfh.command.GiveGoldCommand;
import org.springframework.ntfh.entity.enemy.ingame.EnemyIngame;
import org.springframework.ntfh.entity.game.Game;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;

/**
 * Daño: -
 * Gana 2 Monedas por cada enemigo vivo.
 * 
 * @author Pablosancval
 */
@Component
public class SaqueoOro {
    public void execute(Player playerFrom) {
        Game game = playerFrom.getGame();
        List<EnemyIngame> listEnemiesFighting = game.getEnemiesFighting();
        Integer nEnemies = listEnemiesFighting.size();
        new GiveGoldCommand(nEnemies * 2, playerFrom).execute();
    }
}
