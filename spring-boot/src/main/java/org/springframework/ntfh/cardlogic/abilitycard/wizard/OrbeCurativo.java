package org.springframework.ntfh.cardlogic.abilitycard.wizard;

import java.util.List;

import org.springframework.ntfh.command.ExileCommand;
import org.springframework.ntfh.command.HealCommand;
import org.springframework.ntfh.command.RecoverCommand;
import org.springframework.ntfh.entity.game.Game;
import org.springframework.ntfh.entity.playablecard.abilitycard.ingame.AbilityCardIngame;
import org.springframework.ntfh.entity.player.Player;
import org.springframework.stereotype.Component;

/**
 * (Exiliable)
 * Daño: -
 * Todos los Héores recuperan 2 cartas. Eliminas 1 herida de tu Héroe.
 * 
 * @author Pablosancval
 */
@Component
public class OrbeCurativo {
    public void execute(Player playerFrom, AbilityCardIngame cardPlayed) { // cambiar el cardPlayed aquí y en la poción
        new HealCommand(playerFrom).execute();
        Game game = playerFrom.getGame();
        List<Player> targets = game.getPlayers();
        for (Player playerTarget : targets) {
            new RecoverCommand(2, playerTarget).execute();
        }
        new ExileCommand(playerFrom, cardPlayed).execute();
    }
}